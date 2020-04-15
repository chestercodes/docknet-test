param(
    [switch]$Build,
    [switch]$PublishTests,
    $testResultsDirectory
)

$wd = $PsScriptRoot

$testDir = "C:/wd/test"

if($Build){
    docker build --build-arg TESTDIR=$testDir $wd
    exit $LastExitCode
}

if($PublishTests){
    $publishDir = "C:/publish"

    if(-not $testResultsDirectory){
        Write-Error "Please specify testResultsDirectory"
        exit 1
    }
    if(-not (test-path $testResultsDirectory)){
        mkdir $testResultsDirectory
    }
    
    $lastImageId = docker images -q | select -first 1

    docker run --rm --mount type=bind,src=$testResultsDirectory,dst=$publishDir `
        $lastImageId `
        pwsh -command cp ('{0}/*' -f $testDir) $publishDir
    
    exit $LastExitCode
}
