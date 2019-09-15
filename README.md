# Capstone
My udacity capstone project repository

### master branch
useless except for the fact that it has this README.

### create branch
branch that creates the blue and green clusters with eksctl.

### update branch
branch that creates the recouses (deployments, load balancers ect) within both the blue and green aws eks clusters.

### blue branch
updates the blue deployment to the most current image (or any other image specified) then reroutes the traffic of the domain name to the blue load balancer to the blue application.

### green branch
updates the green deployment to the most current image (or any other image specified) then reroutes the traffic of the domain name to the green load balancer to the green application.
