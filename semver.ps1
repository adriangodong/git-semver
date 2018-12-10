# Find exact match tag, if found, great!
$version = & { git describe --tags --exact-match } 2>&1
$incrementPatch = $False

# If --exact-match failed, get description and apply prerelease adjustment
if ($LastExitCode -ne 0)
{
    $version = & { git describe --tags } 2>&1
    $baseVersion = (& { git describe --tags --abbrev=0 }) 2>&1
    $incrementPatch = $True
}

# If git describe failed, fallback to 0.0.0
if ($LastExitCode -ne 0)
{
    $version = ""
}

if ($incrementPatch)
{
    $prereleaseVersion = $version.SubString($baseVersion.Length)

    $adjustedBaseVersion = $baseVersion.Split(".")
    $adjustedBaseVersion[2] = ($adjustedBaseVersion[2] / 1) + 1 # Increment patch
    
    $version = [System.String]::Join(".", $adjustedBaseVersion) + $prereleaseVersion
}

Write-Host "Commit semver is $version"
