# vypnuti powershell 2.0
Write-Host -Object "$(Get-Date) - Odinstalovavam nepotrebne soucasti OS - Powershell 2.0`r"


  If ((Get-WindowsOptionalFeature -Online -FeatureName 'MicrosoftWindowsPowerShellV2Root' -ErrorAction Stop).State -eq 'Enabled') 
  {
    Disable-WindowsOptionalFeature -Online -FeatureName 'MicrosoftWindowsPowerShellV2Root' -NoRestart
  }



 
If ((Get-WindowsOptionalFeature -Online -FeatureName 'MicrosoftWindowsPowerShellV2').State -eq 'Enabled') 
{
  Disable-WindowsOptionalFeature -Online -FeatureName 'MicrosoftWindowsPowerShellV2' -NoRestart
}
   
# vypnuti samba protokolu
Write-Host -Object "$(Get-Date) - Odinstalovavam nepotrebne soucasti OS - Samba1 protokol`r"
If ((Get-WindowsOptionalFeature -Online -FeatureName 'SMB1Protocol').State -eq 'Enabled') 
{
  Disable-WindowsOptionalFeature -Online -FeatureName 'SMB1Protocol' -NoRestart
}

#bitlocker

Get-BitLockerVolume
    if ((Get-BitLockerVolume -MountPoint C).ProtectionStatus -eq 'FullyEncrypted')
    {
      Write-host "jiz zasifrovano"
    }
    else
    {
      Enable-BitLocker -mountpoint C -EncryptionMethod Aes128 -RecoveryPasswordProtector -SkipHardwareTest
    }
   
