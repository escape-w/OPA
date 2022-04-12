r="\e[1;31m";g="\e[1;32m";b="\n\e[0;34m";n="\e[0m"
l1="\n===============================";l2="\n=================";

echo -e "${b}Creating Constraint Template...$n$l1"
kubectl apply -f constraint-template.yaml

echo -e "${b}Creating Constraint...$n$l1"
kubectl apply -f constraint.yaml

echo -e "${b}Running Positive Test Case...$n$l1"
kubectl apply -f positive-test-case.yaml && \
echo -e "$l2\n| Result:$g PASS!$n |$l2" || \
echo -e "$l2\n| Result:$r FAIL!$n |$l2"

echo -e "${b}Running Negative Test Case...$n$l1"
kubectl apply -f negative-test-case.yaml && \
echo -e "$l2\n| Result:$r FAIL!$n |$l2" || \
echo -e "$l2\n| Result:$g PASS!$n |$l2"

echo -e "${b}Cleaning Up the environment...$n$l1"
{
    kubectl delete -f negative-test-case.yaml
    kubectl delete -f positive-test-case.yaml
    kubectl delete -f constraint.yaml
    kubectl delete -f constraint-template.yaml
} 2> /dev/null
echo -e "$l2${b}Test Completed!$n$l2"