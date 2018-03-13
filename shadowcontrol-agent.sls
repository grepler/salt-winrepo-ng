shadowcontrol-agent:
  '2.8':
    full_name: 'StorageCraft ShadowControl'
    installer: 'https://downloads.storagecraft.com/_shadowcontrol/ShadowControl_Installer_4.0_en.msi'
    install_flags: '/quiet'
    uninstaller: '{{ PROGRAM_FILES }}\ossec-agent\uninstall.exe'
    uninstall_flags: '/uninstall'
    msiexec: True
    locale: en_US
    reboot: False
