

      $volume = Get-WmiObject win32_EncryptableVolume `
    -Namespace root\CIMv2\Security\MicrosoftVolumeEncryption `
    -Filter "DriveLetter = 'C:'"
    if ($Volume.VolumeStatus -eq 'FullyEncrypted')
    {
      Write-host "jiz zasifrovano"
    }
    else
    {
      manage-bde -on c: -s -rp
    }
    Write-host "zasifrovano"