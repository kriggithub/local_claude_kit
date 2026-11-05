# Install claude-kit into %USERPROFILE%\.claude (Windows PowerShell).
#
#   powershell -ExecutionPolicy Bypass -File install.ps1             install or update
#   powershell -ExecutionPolicy Bypass -File install.ps1 -Uninstall  remove what the kit installed
#
# Copies (doesn't symlink — no Developer Mode needed); re-run after `git pull`
# to update. Only touches what the kit owns: CLAUDE.md (an existing non-kit
# one is backed up first) and the skill folders in skills\ and third-party\.
# Never run this in the filming Windows profile.
param([switch]$Uninstall)
$ErrorActionPreference = 'Stop'

$Kit  = $PSScriptRoot
$Dest = if ($env:CLAUDE_HOME) { $env:CLAUDE_HOME } else { Join-Path $env:USERPROFILE '.claude' }
$Mark = '# Kurt - personal instructions (claude-kit)'
$Manifest = Join-Path $Dest '.claude-kit-skills'
$Target = Join-Path $Dest 'CLAUDE.md'

function Get-KitSkills {
  foreach ($root in 'skills', 'third-party') {
    $p = Join-Path $Kit $root
    if (Test-Path $p) {
      Get-ChildItem $p -Directory | Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') }
    }
  }
}

function Test-KitFile($path) {
  (Test-Path $path) -and ((Get-Content $path -TotalCount 1 -Encoding UTF8) -eq $Mark)
}

if ($Uninstall) {
  if (Test-Path $Manifest) {
    Get-Content $Manifest | Where-Object { $_ } | ForEach-Object {
      Remove-Item (Join-Path $Dest "skills\$_") -Recurse -Force -ErrorAction SilentlyContinue
    }
    Remove-Item $Manifest -Force
  }
  if (Test-KitFile $Target) { Remove-Item $Target -Force }
  Write-Host '[claude-kit] uninstalled (backups of your own CLAUDE.md, if any, are untouched)'
  return
}

New-Item -ItemType Directory -Force -Path (Join-Path $Dest 'skills') | Out-Null

if ((Test-Path $Target) -and -not (Test-KitFile $Target)) {
  $bak = "$Target.bak-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
  Copy-Item $Target $bak
  Write-Host "[claude-kit] backed up your existing CLAUDE.md to $bak"
}
Copy-Item (Join-Path $Kit 'CLAUDE.md') $Target -Force

$skills = @(Get-KitSkills)
$names  = $skills | ForEach-Object { $_.Name }
if (Test-Path $Manifest) {
  Get-Content $Manifest | Where-Object { $_ -and ($names -notcontains $_) } | ForEach-Object {
    Remove-Item (Join-Path $Dest "skills\$_") -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[claude-kit] removed retired skill $_"
  }
}
foreach ($s in $skills) {
  $to = Join-Path $Dest "skills\$($s.Name)"
  if (Test-Path $to) { Remove-Item $to -Recurse -Force }
  Copy-Item $s.FullName $to -Recurse
}
Set-Content -Path $Manifest -Value $names -Encoding UTF8

Write-Host "[claude-kit] installed into ${Dest}: CLAUDE.md + $($names.Count) skills ($($names -join ','))"
