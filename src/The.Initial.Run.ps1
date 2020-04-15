param($testResultsDirectory)

$wd = $PsScriptRoot
cd $wd

$containerTestDir = "C:/wd/test"
docker build -f "The.Initial.Dockerfile" --build-arg TESTDIR=$containerTestDir .

#$testResultsDirectory = "C:/temp"
$containerPublishDir = "C:/wd/publish"

$lastImageId = docker images -q | select -first 1

docker run --rm --mount type=bind,src=$testResultsDirectory,dst=$containerPublishDir `
    $lastImageId `
    pwsh -command cp ('{0}/*' -f $containerTestDir) $containerPublishDir
