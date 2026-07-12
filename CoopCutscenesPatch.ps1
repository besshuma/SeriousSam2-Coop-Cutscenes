param(
    [ValidateSet("Install", "Restore", "Status")]
    [string]$Action = "Install"
)

$ErrorActionPreference = "Stop"

$gameRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$binRoot = Join-Path $gameRoot "Bin"
$backupRoot = Join-Path $binRoot "CoopCutscenesBackup"
$configPath = Join-Path $gameRoot "Content\SeriousSam2\Sam2.ini"
$networkBackupPath = Join-Path $backupRoot "CoopCutscenesNetworkTimeouts.json"
$networkTimeoutSeconds = 600

if ($Action -ne "Status") {
    $gameExe = [IO.Path]::GetFullPath((Join-Path $binRoot "Sam2.exe"))
    $runningGame = Get-Process -Name "Sam2" -ErrorAction SilentlyContinue | Where-Object {
        try {
            [IO.Path]::GetFullPath($_.Path) -eq $gameExe
        } catch {
            $false
        }
    }

    if ($runningGame) {
        throw "Serious Sam 2 is running from this folder. Close the game before installing or restoring the patch."
    }
}

$targets = @(
    @{
        Name = "Sam2Game.dll"
        Optional = $false
        OriginalSha256 = "5628B4ED30A966F10C8E8EA46BF0789257A35EA80127BACACEBE28B1CE5303DF"
        PatchedSha256 = "9ADBC94EE7FA7A26A11BF5AB2429040A521E1D39F2456122E29159579B3B6FDC"
        KnownHashes = @{
            "5628B4ED30A966F10C8E8EA46BF0789257A35EA80127BACACEBE28B1CE5303DF" = "Original"
            "5DE6453C28CD6E84AEB6EED025B080249D0BDC8731294D26A4312F947F0B47A3" = "LegacyV1"
            "196C0154B8C14DB8731D1EBFB143F9857D995F750C980B996FCCF8F9FD269C75" = "LegacyV2"
            "65CFE066E1E265E0431B605E7AE98C7B34BE5A026310C1F1C20890FCD1C65C83" = "LegacyV3"
            "CF2F0FEBFF3857460E2AF51579E6DC698947198CBA8A51AE921D21DDEECDFBD5" = "LegacyV5"
            "8CC69D733BAD1DE29C4A1EEE9B83659B2FF6FC40C40AFA3EB495DCC8B9E8A0F9" = "LegacyV6"
            "F44D222F0EE74C1AC5EB96C7E363775FFC5547B3D70E07818F26FEAF1F758086" = "LegacyV7"
            "875F957FDB134902851733782A4A7877C233B1A7124B8ACAE27C19CEE60B86EC" = "LegacyV8Test"
            "9ADBC94EE7FA7A26A11BF5AB2429040A521E1D39F2456122E29159579B3B6FDC" = "PatchedV9Test"
        }
        Patches = @(
            @{ Offset = 0x23A2F; Hex = "E9460926009090" },
            @{
                Offset = 0x28437A
                Hex = "E8000000005A81EA7F4328009090909090909090C78204E9400000000000C78208E9400000000000837E10000F849000000083BA4C334000000F8583000000608BEA8B8548A1400085C00F8E2E0000008BB544A1400033DB8B46345057FF953043290083C40885C00F841F00000083C678433B9D48A140000F8CDAFFFFFFC78500E9400000000000E9340000008B9500E940008B4634898500E94000898508E9400085D20F841700000085DB0F8E0F0000003B56BC0F8506000000899504E9400061E941F6D9FFC78200E9400000000000C78204E9400000000000C78208E94000000000008B4610E9CFF5D9FF"
            },
            @{
                Offset = 0x284600
                Hex = "60E8BAF1E5FFE80F00000061C360E8DDBDE5FFE80200000061C3E8000000005D81ED1F4628008BB508E9400085F6747C8BBD04E94000C78508E9400000000000C78504E94000000000008D85AD46280050FF958040290083C4046A01E8EFB2FAFF83C40485FF7410680000003F6A0157E8DBA8F9FF83C40C68000000406A0256E8CBA8F9FF83C40CBB000080BF85C07F05BB0000003F536A0056E8B1A8F9FF83C40C6A00E8A7B2FAFF83C404C35B436F6F704375747363656E65732076395D20706C6179696E67206465666572726564206D6F7669657320616674657220776F726C642073746172740A00"
            },
            @{ Offset = 0x29DE30; Hex = "00462810" },
            @{ Offset = 0x29DE3C; Hex = "0D462810" },
            @{ Offset = 0x1F0; Hex = "00402800" },
            @{ Offset = 0x290; Hex = "0C590100" }
        )
    },
    @{
        Name = "InSamnity2Game.dll"
        Optional = $true
        OriginalSha256 = "1F1CC0661D3C002A904A1AD875598CE44C02CF8DA29454EB771A9483EF4D0308"
        PatchedSha256 = "1986377F41115C8843FCB25448B869EB6C87832F7A1F76808DF2A193D94E2FF7"
        KnownHashes = @{
            "1F1CC0661D3C002A904A1AD875598CE44C02CF8DA29454EB771A9483EF4D0308" = "Original"
            "3E7F3BDC6224F0150BB5E6BC14822DDA6C7DD093830D66055B6953B5E7ED6EEF" = "LegacyV1"
            "BE2F0B1C66DC25BAD2A0476D97E5DE5544CAEE05C2E6CC8C2F1E3532F9148BD7" = "LegacyV2"
            "14FD9153A2911E8BD1F17B237AB9B063C23E0EB8B181A19D9F6341FA405AC6FA" = "LegacyV3"
            "72567AD4B9DB701D6825C244C4D30A9D8250087EBCD51D638BC2D6209E203297" = "LegacyV5"
            "D87B6A1A18770C4A384EC1C0D290CB20CB307969AEC0FFF386E9D21E1555397D" = "LegacyV6"
            "CA4F3AE972FB99A1178DF1FA4DE77B92B04C9D045504A538C07F52AF628A20A9" = "LegacyV7"
            "CE08454FBED73887131BF8EE313DFB56243A41CD71C34E6B73C9090ED06FBBE5" = "LegacyV8Test"
            "1986377F41115C8843FCB25448B869EB6C87832F7A1F76808DF2A193D94E2FF7" = "PatchedV9Test"
        }
        Patches = @(
            @{ Offset = 0x2A5E1; Hex = "E924392A009090" },
            @{
                Offset = 0x2CDF0A
                Hex = "E8000000005A81EA0FDF2C009090909090909090C782B4BF470000000000C782B8BF470000000000837E10000F849300000083BAC4EC4600000F8586000000608BEA8B854866470085C00F8E310000008BB54466470033DB8B46345057FF9550F32D0083C40885C00F842200000081C680000000433B9D486647000F8CD7FFFFFFC785B0BF470000000000E9340000008B95B0BF47008B46348985B0BF47008985B8BF470085D20F841700000085DB0F8E0F0000003B56B40F85060000008995B4BF470061E960C6D5FFC782B0BF470000000000C782B4BF470000000000C782B8BF4700000000008B4610E9EEC5D5FF"
            },
            @{
                Offset = 0x2DE26C
                Hex = "60E80E9AE1FFE80F00000061C360E8C130E1FFE80200000061C3E8000000005D81ED8BE22D008BB5B8BF470085F6747C8BBDB4BF4700C785B8BF470000000000C785B4BF4700000000008D8519E32D0050FF9580F02D0083C4046A01E87359F9FF83C40485FF7410680000003F6A0157E8FF02F8FF83C40C68000000406A0256E8EF02F8FF83C40CBB000080BF85C07F05BB0000003F536A0056E8D502F8FF83C40C6A00E82B59F9FF83C404C35B436F6F704375747363656E65732076395D20706C6179696E67206465666572726564206D6F7669657320616674657220776F726C642073746172740A00"
            },
            @{ Offset = 0x2EC4F0; Hex = "6CE22D10" },
            @{ Offset = 0x2EC4FC; Hex = "79E22D10" },
            @{ Offset = 0x240; Hex = "00F00000" },
            @{ Offset = 0x290; Hex = "BC7F0100" }
        )
    }
)

function Convert-HexToBytes([string]$Hex) {
    if (($Hex.Length % 2) -ne 0) {
        throw "Invalid hex byte string."
    }

    $bytes = [byte[]]::new($Hex.Length / 2)
    for ($i = 0; $i -lt $bytes.Length; $i++) {
        $bytes[$i] = [Convert]::ToByte($Hex.Substring($i * 2, 2), 16)
    }
    return $bytes
}

function Get-ByteHash([byte[]]$Data) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try {
        return ([BitConverter]::ToString($sha.ComputeHash($Data))).Replace("-", "")
    } finally {
        $sha.Dispose()
    }
}

function Apply-BinaryPatches([byte[]]$Data, $Target) {
    foreach ($patch in $Target.Patches) {
        $replacement = Convert-HexToBytes $patch.Hex
        if (($patch.Offset + $replacement.Length) -gt $Data.Length) {
            throw "Patch exceeds the size of $($Target.Name)."
        }
        [Array]::Copy($replacement, 0, $Data, $patch.Offset, $replacement.Length)
    }
}

function Get-DllState([string]$Hash, $Target) {
    if ($Hash -eq $Target.PatchedSha256) {
        return "PatchedV9Test"
    }
    if ($Target.KnownHashes.ContainsKey($Hash)) {
        return $Target.KnownHashes[$Hash]
    }
    return "Unknown"
}

function Get-NetworkTimeouts([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        return $null
    }

    $text = [IO.File]::ReadAllText($Path)
    $connectionMatch = [Text.RegularExpressions.Regex]::Match(
        $text,
        "(?m)^\s*net_fConnectionTimeout\s*=\s*([^;]+);"
    )
    $problemsMatch = [Text.RegularExpressions.Regex]::Match(
        $text,
        "(?m)^\s*net_fProblemsTimeout\s*=\s*([^;]+);"
    )

    if (-not $connectionMatch.Success -or -not $problemsMatch.Success) {
        return $null
    }

    return @{
        ConnectionTimeout = $connectionMatch.Groups[1].Value.Trim()
        ProblemsTimeout = $problemsMatch.Groups[1].Value.Trim()
    }
}

function Set-NetworkTimeouts([string]$Path, [string]$ConnectionTimeout, [string]$ProblemsTimeout) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Missing config file: $Path"
    }

    $text = [IO.File]::ReadAllText($Path)
    $connectionPattern = "(?m)^(\s*net_fConnectionTimeout\s*=\s*)[^;]+;"
    $problemsPattern = "(?m)^(\s*net_fProblemsTimeout\s*=\s*)[^;]+;"

    if (-not [Text.RegularExpressions.Regex]::IsMatch($text, $connectionPattern)) {
        throw "net_fConnectionTimeout was not found in $Path"
    }
    if (-not [Text.RegularExpressions.Regex]::IsMatch($text, $problemsPattern)) {
        throw "net_fProblemsTimeout was not found in $Path"
    }

    $text = [Text.RegularExpressions.Regex]::Replace($text, $connectionPattern, "`${1}$ConnectionTimeout;")
    $text = [Text.RegularExpressions.Regex]::Replace($text, $problemsPattern, "`${1}$ProblemsTimeout;")

    $utf8NoBom = New-Object Text.UTF8Encoding($false)
    [IO.File]::WriteAllText($Path, $text, $utf8NoBom)
}

foreach ($target in $targets) {
    $dllPath = Join-Path $binRoot $target.Name
    $backupPath = Join-Path $backupRoot $target.Name

    if (-not (Test-Path -LiteralPath $dllPath -PathType Leaf)) {
        if ($target.Optional) {
            Write-Host "$($target.Name): not installed, skipped"
            continue
        }
        throw "Missing file: $dllPath"
    }

    $currentHash = (Get-FileHash -LiteralPath $dllPath -Algorithm SHA256).Hash
    $state = Get-DllState $currentHash $target

    if ($Action -eq "Status") {
        Write-Host "$($target.Name): $state"
        continue
    }

    if ($Action -eq "Restore") {
        if (-not (Test-Path -LiteralPath $backupPath -PathType Leaf)) {
            throw "Backup is missing: $backupPath"
        }
        $backupHash = (Get-FileHash -LiteralPath $backupPath -Algorithm SHA256).Hash
        if ($backupHash -ne $target.OriginalSha256) {
            throw "Backup hash mismatch for $($target.Name): $backupHash"
        }
        Copy-Item -LiteralPath $backupPath -Destination $dllPath -Force
        Write-Host "$($target.Name): restored"
        continue
    }

    if ($state -eq "PatchedV9Test") {
        Write-Host "$($target.Name): v9 test already installed"
        continue
    }
    if ($state -eq "Unknown") {
        throw "Unsupported $($target.Name) build. SHA-256: $currentHash"
    }

    if (-not (Test-Path -LiteralPath $backupRoot -PathType Container)) {
        New-Item -ItemType Directory -Path $backupRoot | Out-Null
    }

    if (-not (Test-Path -LiteralPath $backupPath -PathType Leaf)) {
        if ($state -ne "Original") {
            throw "A verified original backup is required to upgrade $($target.Name) from $state."
        }
        Copy-Item -LiteralPath $dllPath -Destination $backupPath
    }

    $backupHash = (Get-FileHash -LiteralPath $backupPath -Algorithm SHA256).Hash
    if ($backupHash -ne $target.OriginalSha256) {
        throw "Backup hash mismatch for $($target.Name): $backupHash"
    }

    $patchedData = [IO.File]::ReadAllBytes($backupPath)
    Apply-BinaryPatches $patchedData $target
    $patchedHash = Get-ByteHash $patchedData
    if ($patchedHash -ne $target.PatchedSha256) {
        throw "Internal v9 test hash mismatch for $($target.Name): $patchedHash"
    }

    [IO.File]::WriteAllBytes($dllPath, $patchedData)
    Write-Host "$($target.Name): upgraded from $state to v9 test"
}

$networkTimeouts = Get-NetworkTimeouts $configPath

if ($Action -eq "Status") {
    if ($null -eq $networkTimeouts) {
        Write-Host "Network timeouts: Unknown"
    } elseif (
        ($networkTimeouts.ConnectionTimeout -eq "$networkTimeoutSeconds") -and
        ($networkTimeouts.ProblemsTimeout -eq "$networkTimeoutSeconds")
    ) {
        Write-Host "Network timeouts: PatchedV4 ($networkTimeoutSeconds/$networkTimeoutSeconds seconds)"
    } else {
        Write-Host "Network timeouts: $($networkTimeouts.ConnectionTimeout)/$($networkTimeouts.ProblemsTimeout) seconds"
    }
    exit 0
}

if ($Action -eq "Restore") {
    if (Test-Path -LiteralPath $networkBackupPath -PathType Leaf) {
        $savedTimeouts = Get-Content -LiteralPath $networkBackupPath -Raw | ConvertFrom-Json
        Set-NetworkTimeouts `
            $configPath `
            ([string]$savedTimeouts.ConnectionTimeout) `
            ([string]$savedTimeouts.ProblemsTimeout)
        Remove-Item -LiteralPath $networkBackupPath -Force
        Write-Host "Network timeouts: restored"
    } else {
        Write-Host "Network timeouts: no backup, skipped"
    }
    exit 0
}

if ($null -eq $networkTimeouts) {
    throw "Network timeout settings were not found in $configPath"
}

if (-not (Test-Path -LiteralPath $backupRoot -PathType Container)) {
    New-Item -ItemType Directory -Path $backupRoot | Out-Null
}

if (-not (Test-Path -LiteralPath $networkBackupPath -PathType Leaf)) {
    $networkTimeouts | ConvertTo-Json | Set-Content -LiteralPath $networkBackupPath -Encoding UTF8
}

Set-NetworkTimeouts $configPath "$networkTimeoutSeconds" "$networkTimeoutSeconds"

$verifiedTimeouts = Get-NetworkTimeouts $configPath
if (
    ($null -eq $verifiedTimeouts) -or
    ($verifiedTimeouts.ConnectionTimeout -ne "$networkTimeoutSeconds") -or
    ($verifiedTimeouts.ProblemsTimeout -ne "$networkTimeoutSeconds")
) {
    throw "Network timeout verification failed."
}

Write-Host "Network timeouts: PatchedV4 ($networkTimeoutSeconds/$networkTimeoutSeconds seconds)"
