FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ARG TESTDIR=

SHELL ["pwsh", "-command"]

RUN mkdir $env:TESTDIR

WORKDIR /src

COPY . .

RUN \
    function RunTestProj($absPath){                                             \
        $name = $absPath.Replace('\ '.Replace(' ', ''), '_').Replace('.', '_'); \
        write-host ('Running dotnet test for {0} -> {1}' -f $absPath, $name);   \
        dotnet test $absPath                                                    \
          --logger ('trx;LogFileName={0}/{1}.trx' -f $env:TESTDIR, $name) ;     \
        if($LASTEXITCODE -ne 0){                                                \
            out-file -filepath ('{0}/failed' -f $env:TESTDIR) ;                 \
        } ;                                                                     \
    }                                                                           \
    gci -Recurse **/*Tests.*proj |% {                                           \ 
        RunTestProj (resolve-path -relative $_.FullName)                        \
    }

RUN if(test-path ('{0}/failed' -f $env:TESTDIR)){ exit 1 }