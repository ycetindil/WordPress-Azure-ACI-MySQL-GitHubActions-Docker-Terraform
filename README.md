# WordPress on Azure Container Instance Deployed by GitHub Actions

## Notes

- GitHub Actions needs the Docker Hub username and token to push the docker image to Docker Hub. These are defined as repo secrets.
- Terraform needs Azure Credentials to create the infrastructure. These values are needed in environment for Terraform to look up.
	- ARM_SUBSCRIPTION_ID
	- ARM_TENANT_ID
	- ARM_CLIENT_ID
	- ARM_CLIENT_SECRET

	To get these credentials we use this command in a terminal;
	```
	az ad sp create-for-rbac --sdk-auth --role="Contributor" --scopes="/subscriptions/<subscription_id>"
	```
