# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
shadowcontrol-agent:
  '4.0.0':
    full_name: 'StorageCraft ShadowControl'
    installer: 'https://downloads.storagecraft.com/_shadowcontrol/ShadowControl_Installer_4.0_en.msi'
    install_flags: '/quiet'
    uninstaller: 'https://downloads.storagecraft.com/_shadowcontrol/ShadowControl_Installer_4.0_en.msi'
    uninstall_flags: '/uninstall'
    msiexec: True
    locale: en_US
    reboot: False
