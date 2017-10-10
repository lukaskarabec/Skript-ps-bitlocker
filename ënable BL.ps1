Enable-BitLocker -mountpoint C -EncryptionMethod Aes128 -RecoveryPasswordProtector -SkipHardwareTest
			
    do
      {
        
        Start-Sleep -Seconds 1
      }
      until ($Volume.VolumeStatus -eq 'FullyEncrypted')
			
      Write-Progress -Activity "Sifruji disk C" -Status 'Stav sifrovani...:' -Completed
      
      $BitlockerStatus = (Get-BitLockerVolume -MountPoint C).ProtectionStatus