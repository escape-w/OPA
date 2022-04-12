r="\e[1;31m";g="\e[1;32m";b="\n\e[0;34m";n="\e[0m"
l1="\n===============================";l2="\n=================";

echo -e "${b}Applying Mutation for PrivilegeEscalation...$n$l1"
kubectl apply -f mutation-PrivilegeEscalation.yaml

echo -e "${b}Applying Mutation for supplementalGroups...$n$l1"
kubectl apply -f mutation-supplementalGroups.yaml

echo -e "${b}Applying Mutation for runAsUser...$n$l1"
kubectl apply -f mutation-runAsUser.yaml

echo -e "${b}Applying Mutation for runAsGroup...$n$l1"
kubectl apply -f mutation-runAsGroup.yaml

echo -e "${b}Applying Mutation for mustRunAsNonRoot...$n$l1"
kubectl apply -f mutation-mustRunAsNonRoot.yaml

echo -e "${b}Applying Mutation for fsGroup...$n$l1"
kubectl apply -f mutation-fsGroup.yaml

echo -e "${b}Syncing ingress resource for constraint...$n$l1"
kubectl apply -f ingress-sync.yaml

echo -e "${b}Applying Mutation for apparmor...$n$l1"
kubectl apply -f mutation-apparmor.yaml

echo -e "${b}Applying Mutation for readOnlyrootfilesystem...$n$l1"
kubectl apply -f mutation-readOnlyrootfilesystem.yaml

echo -e "${b}Applying Mutation for selinux...$n$l1"
kubectl apply -f mutation-selinux.yaml

echo -e "${b}Cleaning Up the mutation and gatekeeper config file...$n$l1"
{
	kubectl delete -f mutation-PrivilegeEscalation.yaml
	kubectl delete -f mutation-supplementalGroups.yaml
	kubectl delete -f mutation-runAsUser.yaml
	kubectl delete -f mutation-runAsGroup.yaml
	kubectl delete -f mutation-mustRunAsNonRoot.yaml
	kubectl delete -f mutation-fsGroup.yaml
	kubectl delete -f mutation-addCapablities.yaml
	kubectl delete -f ingress-sync.yaml
	kubectl delete -f mutation-apparmor.yaml
	kubectl delete -f mutation-readOnlyrootfilesystem.yaml
	kubectl delete -f mutation-selinux.yaml
} 2> /dev/null
echo -e "$l2${b}Test Completed!$n$l2"