FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ARG TESTDIR=

SHELL ["pwsh", "-command"]

RUN mkdir $env:TESTDIR

WORKDIR /src

COPY . .

RUN dotnet test MyProject.Domain.Tests/MyProject.Domain.Tests.fsproj \
        --logger ('trx;LogFileName={0}/MyProject.Domain.Tests.trx' -f $env:TESTDIR)

RUN dotnet test MyProject.Services.Tests/MyProject.Services.Tests.fsproj \
        --logger ('trx;LogFileName={0}/MyProject.Services.Tests.trx' -f $env:TESTDIR)

