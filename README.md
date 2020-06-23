# Lambda layer Benchmark
Sample solution for evaluating lambda cold-start time reduction that comes from using lamda layers in .NET core 2.1.

## Requirements
* docker
* dotnet sdk 3.1
* aws cli

## Content
* `Functions` + `Dependencies` - sample lambda function and some external depenencies to make the deplyment package larger

**----TODO----** 
* `Deploy` - Dockerfile for publishing optimized Lambda Layer and PowerShell scripts that performs actual packaging and deployment

## Usage
Adjust `Deploy/publish-layer.ps1` script and provide s3 bucket name for the deployments.
Run the script to publish the Lambda Layer. Use an input argument to enable or disable the optimization. Note the layer's ARN.   

Adjust `Deploy/deploy.ps1` script and provide s3 bucket name for the deployments.
Adjust `Functions/application.yaml` and provide ARN of the layer.
Run the script to build and publish the Lambda Function.

Use our [cold-start measure app](https://github.com/Rozchmurzeni/cold-start-measure) to measure the cold-starts.