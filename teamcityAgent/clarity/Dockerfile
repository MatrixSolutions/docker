FROM mcr.microsoft.com/dotnet/sdk:8.0 AS dotnetsdk8

FROM jetbrains/teamcity-agent:latest as teamcity

WORKDIR /usr/local/bin
WORKDIR /usr/share

COPY --from=dotnetsdk8 /usr/share/dotnet /usr/share/dotnet

ARG DOTNET_SDK_VERSION8=8.0.0
ARG ASPNET_VERSION8=8.0.0
ARG DOTNET_VERSION8=8.0.0