# escape=`

# This Dockerfile adapted from https://stackoverflow.com/a/43759553/3960377

FROM microsoft/windowsservercore

# Install chocolatey
RUN @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1"

# Install Visual C++ Build Tools, as per: https://chocolatey.org/packages/visualcpp-build-tools
RUN choco install visualcpp-build-tools --version "15.0.26228.20170424" -y

# Install Python 3.6.5
RUN choco install python --version "3.6.5" -y

# Add msbuild to PATH
RUN setx /M PATH "%PATH%;C:\Program Files (x86)\MSBuild\14.0\bin"

CMD [ "cmd.exe" ]
