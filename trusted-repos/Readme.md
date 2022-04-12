# Trusted Repository
This policy makes sure that only whitelisted/trusted repositories are used for container images. *docker.io* is added to trusted registries, hence the policy allows images from *docker.io* and denies creation of container with images from other sources.
This policy is applicable to following resources:
* Pod
* Job
* CronJob
* ReplicaSet
* Deployment
* DaemonSet
* StatefulSet

## Components
Following are the components of this policy:
1. **Contsraint Template**: Contains rego and CRD for policy
2. **Contsraint**: CRD resource for configuring policy

## Unit Testing
Unit testing can be done by running:
 ```./test.sh```

## Apply
Steps to install policy:
1. Install the constraint template
 ``` kubectl apply -f constraint-template.yaml ```

2. Apply the constraint
 ``` kubectl apply -f constraint.yaml ```


## Manual Test
Steps to test the policy execution:
1. Run the file for positive test scenario
 ``` kubectl apply -f positive-test-case.yaml ```

2. Run the file for negative test scenario
 ``` kubectl apply -f negative-test-case.yaml ```