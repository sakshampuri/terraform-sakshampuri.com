# Init terraform remote state

This terraform is to to be used as a separate terraform entity to initialise the resources required for the remote state that is used in the root project.

To initialise the resources for remote state:

-   `cd remote-state` from whichever directory currently in
-   `terraform init && terraform apply --auto-approve`

This procedure is to be only done once as to just provision the initial required resources. For the same reason, the .tfstate file might be committed in the VCS.
