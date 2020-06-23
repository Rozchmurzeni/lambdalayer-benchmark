param(
    [Parameter(Mandatory=$True)]
    [String]$StackName
)

# configuration
$DeployBucket = # insert your bucket here
$Region = 'eu-central-1'

# package locally with ReadyToRun disabled
dotnet lambda package --project-location $PSScriptRoot/../Functions --framework netcoreapp2.1

# deploy package to AWS
dotnet lambda deploy-serverless `
    --project-location $PSScriptRoot/../Functions `
    --package $PSScriptRoot/../Functions/bin/release/netcoreapp2.1/Functions.zip `
    --stack-name $StackName `
    --s3-bucket $DeployBucket `
    --template $PSScriptRoot/../Functions/application.yaml `
    --region $Region