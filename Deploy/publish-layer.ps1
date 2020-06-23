param(
    [Boolean]$Optimize = $False
)

# configuration
$DeployBucket = # insert your bucket here
$DockerTag = 'rozchmurzeni/lambdadotnetlayer'
$Region = 'eu-central-1'
$LayerName = 'LambdaLayerBenchmark'

$optimizeStrMap = @{
    $True = 'true'
    $False = 'false'
}
$OptimizeStr = $optimizeStrMap[$Optimize]

# check if docker image exists in local repository
docker image inspect $DockerTag 2>&1 | Out-Null
$imageExists = $LASTEXITCODE -eq 0

if(!$imageExists){
    # build docker image
    docker build -t $DockerTag $PSScriptRoot
}

# publish lambda layer optimized for linux using the docker container
docker run --rm -v $HOME/.aws:/root/.aws -v $PSScriptRoot/../:/work -e PROJECT=Functions -e BUCKET=$DeployBucket -e REGION=$Region -e LAYER=$LayerName -e OPTIMIZE=$OptimizeStr $DockerTag