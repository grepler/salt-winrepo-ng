# you must go to the ESET Remote Administration Server and download .ini files for each organization Static Group you wish to deploy agents for.
# For example, for XYZ organization, you would save the 'XYZ-install_config.ini' file.
# place these in the 'eset-remote-agent-config\client-configs' folder on your pillar.
# Also include one 'Default-install_config.ini' file, which is not associated with an ERA static group.
# Targetting the ini file requires that each machine has an 'organization' key that maps to the oeganization prefix (e.g. 'XYZ')

write_era_configuration_file:
  file.managed:
    - name: '%TEMP%\era-install-config.ini'
    - contents_pillar: base:eset-remote-agent-config:client-configs:{{ salt['pillar.get']('organization', 'Default') }}-install_config.ini
    - makedirs: True
    - show_changes: True

# This version will only install the 64-bit installer.

eset-remote-agent:
  'latest':
    full_name: 'ESET Remote Agent'
    installer: 'https://download.eset.com/com/eset/apps/business/era/agent/latest/agent_x64.msi'
    install_flags: '/QN /L*V "%TEMP%\era-agent-install.log" CONFIGFILE=%TEMP%\era-install-config.ini'
    msiexec: True
    locale: en_US
    reboot: False
