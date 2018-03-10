# only using 32-bit x86 installer
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
msteams:
  'latest':
    full_name: 'Microsoft Teams'
    installer: 'salt://win/repo-ng/msteams/msteams_x64.exe'
    install_flags: '--silent'
    uninstaller: '%userprofile%\AppData\Local\Microsoft\Teams\Update.exe'
    uninstall_flags: '--uninstall -s'
    msiexec: False
    locale: en_US
    reboot: False

# due to winrepo installer limitations you need to manually download the exe with:
# wget -O msteams_x64.exe https://go.microsoft.com/fwlink/?linkid=859722
# and put it on the winrepo on master to install it the 'salt://win/repo-ng/msteams/... way
# wget -O /srv/salt/win/repo-ng/msteams/msteams_x64.exe https://go.microsoft.com/fwlink/?linkid=859722
