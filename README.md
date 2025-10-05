========================================================================================
# LOADBALANCER URL for the application 👇

http://a66bd8d2dd8c54f3788495bd5fd71757-475823314.us-east-1.elb.amazonaws.com/

# Google docs link 
# Detailed project setup steps 👇

https://docs.google.com/document/d/17T_Rj5tOm-_YJSZJgMpm3sGumFTwapQaQKKptEdQa08/edit?usp=sharing

=====================================================================================
Pipeline Flow summary:

1️⃣ Source Stage → Pull code from GitHub
2️⃣ Build Stage → Build & push Docker image to Amazon ECR
3️⃣ Deploy Stage → Trigger CodeDeploy to run deploy.sh on an EC2 instance, which applies Kubernetes manifests to EKS

===> Stage 1: Source

Trigger: CodePipeline detects new commits pushed to the repository.

===> Stage 2: Build (CodeBuild)

Purpose:

- Build the Docker image.

- Push image to Amazon ECR.

- Update Kubernetes manifest (k8s/deployment.yml) with the latest image URI.

- Pass artifacts to CodeDeploy.

Output:

- New Docker image pushed to ECR.

- Updated manifests passed to CodeDeploy.

===> Stage 3: Deploy (CodeDeploy)

Purpose:

- Use CodeDeploy to trigger the deploy.sh script on an EC2 instance (which has kubectl and aws-cli access) to deploy to EKS.

Output:

- Pods and service are deployed/updated in the EKS cluster.



