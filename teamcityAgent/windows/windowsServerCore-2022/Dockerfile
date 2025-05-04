FROM jetbrains/teamcity-agent:2024.07.2-windowsservercore-2022

USER ContainerAdministrator

# Install Chocolatey and necessary tools
RUN powershell -NoProfile -Command \
    "Set-ExecutionPolicy Bypass -Scope Process -Force; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); \
    choco install sqlcmd sqlpackage visualstudio2022buildtools -y --no-progress"
