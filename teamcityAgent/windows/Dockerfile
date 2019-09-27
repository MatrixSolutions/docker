FROM jetbrains/teamcity-agent:2019.1.3-windowsservercore

COPY AceRedist.msi c:/temp/AceRedist.msi
COPY jetsetup.exe c:/temp/jetsetup.exe
COPY msodbcsql_17.4.1.1_x64.msi c:/temp/msodbcsql_17.4.1.1_x64.msi
COPY MsSqlCmdLnUtils.msi c:/temp/MsSqlCmdLnUtils.msi
COPY BuildTools_Full.exe c:/temp/BuildTools_Full.exe
COPY FSharp_Bundle.exe c:/temp/FSharp_Bundle.exe
COPY iisexpress_amd64_en-US.msi c:/temp/iisexpress_amd64_en-US.msi
COPY microsoft-windows-netfx3-ondemand-package~31bf3856ad364e35~amd64~~.cab c:/temp/microsoft-windows-netfx3-ondemand-package~31bf3856ad364e35~amd64~~.cab
COPY Microsoft-Windows-NetFx3-OnDemand-Package~31bf3856ad364e35~amd64~en-US~.cab c:/temp/Microsoft-Windows-NetFx3-OnDemand-Package~31bf3856ad364e35~amd64~en-US~.cab

RUN Start-Process -FilePath dism -ArgumentList /online, /enable-feature, /featurename:NetFX3ServerFeatures -PassThru | Wait-Process
RUN Start-Process -FilePath dism -ArgumentList /online, /enable-feature, /featureName:NetFX3, /Source:c:\temp, /LimitAccess  -PassThru | Wait-Process
RUN Start-Process -FilePath c:\temp\AceRedist.msi -ArgumentList /q, /l, "c:/temp/AceRedist.log" -PassThru | Wait-Process
RUN Start-Process -FilePath c:\temp\jetsetup.exe -ArgumentList /Q -PassThru | Wait-Process
RUN Start-Process -FilePath msiexec -ArgumentList /i, "c:\temp\msodbcsql_17.4.1.1_x64.msi", /quiet, /l, "c:/temp/msodbcsql_17.4.1.1_x64.log", "IACCEPTMSODBCSQLLICENSETERMS=YES" -PassThru | Wait-Process
RUN Start-Process -FilePath msiexec -ArgumentList /i, "c:\temp\MsSqlCmdLnUtils.msi", /quiet, /l, "c:/temp/MsSqlCmdLnUtils.log", "IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES" -PassThru | Wait-Process
RUN Start-Process -FilePath c:\temp\BuildTools_Full.exe -ArgumentList /Full, /Q, /L, "c:/temp/BuildTools_Full.log" -PassThru | Wait-Process
RUN Start-Process -FilePath c:\temp\FSharp_Bundle.exe -ArgumentList /install, /quiet, /log, "c:/temp/FSharp_Bundle.log" -PassThru | Wait-Process
RUN Start-Process -FilePath msiexec -ArgumentList /i, "c:\temp\iisexpress_amd64_en-US.msi", /quiet, /l, "c:/temp/iisexpress_amd64_en-US.log" -PassThru | Wait-Process

RUN Start-Process -FilePath nuget.exe -WorkingDirectory C:\ -ArgumentList install, "Microsoft.Data.Tools.Msbuild" -PassThru | Wait-Process
RUN xcopy c:\Microsoft.Data.Tools.Msbuild.10.0.61804.210\lib\net46\*.* 'C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Microsoft\VisualStudio\v10.0\SSDT\'
RUN xcopy c:\Microsoft.Data.Tools.Msbuild.10.0.61804.210\lib\net46\*.* 'C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Microsoft\VisualStudio\v11.0\SSDT\'
RUN xcopy c:\Microsoft.Data.Tools.Msbuild.10.0.61804.210\lib\net46\*.* 'C:\Extensions\Microsoft\SQLDB\Dac\140\'

RUN Start-Process -FilePath nuget.exe -WorkingDirectory C:\ -ArgumentList install, "MSBuild.Microsoft.VisualStudio.Web.targets" -PassThru | Wait-Process

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

RUN choco install ruby --yes --version 2.6.4.1
RUN gem install bundler
RUN gem install rake -v 0.9.2.2

RUN choco install nvm --yes
RUN nvm install 0.12.7
RUN nvm use 0.12.7
RUN Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
RUN npm install -g npm-windows-upgrade@3.1.1
RUN npm-windows-upgrade -v 3.3.4
RUN npm install -g ember-cli

RUN setx /M PATH $($Env:PATH + ';C:\Program Files (x86)\Microsoft SDKs\F#\4.0\Framework\v4.0')
RUN setx /M SdkToolsPath 'C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools'

RUN mkdir 'C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files'