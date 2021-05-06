# terraform-livecode
This repository is aimed at people following the theTribe terraform livecode session.
It contains every needed terraform updates done step by step to spin up an architecture according to the presented usecase.

## Steps
### 1. MVP
Spin up a single publicly available server for a MVP

### 2. We need data
Add a managed database to complement the MVP

### 3. We need to scale
Add a second server and a load balancer

### 4. Junior ops is learning the hard way
*Simulate Junior creating server via Cloud UI instead of terraform*
Use of terraform import. Comment on why it's hard to use at a large scale & problems when having to import something into a terraform managed architecture.

### 5. Let's spin up a dev env
Workspaces magic!

### 6. Destroy everything!
Because all this is just a fantasy and the resource usage & cost in the cloud is not :D 
