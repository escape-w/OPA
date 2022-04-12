echo -e "\n\e[44;97m Creating Constraint Template...\e[0m"
# echo "================================"
kubectl apply -f constraint-template.yaml
echo -e "\n\e[44;97m Creating Constraint...        .\e[0m"
# echo "================================"
kubectl apply -f constraint.yaml
echo -e "\n\e[44;97m Running Positive Test Case... .\e[0m"
# echo "================================"
kubectl apply -f positive-test-case.yaml && \
echo -e "\n=================\n\e[102;93;1m  Result: PASS!  \e[0m\n=================" || \
echo -e "\n=================\n\e[41;97;1m  Result: FAIL!  \e[0m\n================="
echo -e "\n\e[44;97m Running Negative Test Case...\e[0m"
# echo "================================"
kubectl apply -f negative-test-case.yaml && \
echo -e "\n=================\n\e[41;97;1m  Result: FAIL!  \e[0m\n=================" || \
echo -e "\n=================\n\e[102;93;1m  Result: PASS!  \e[0m\n================="

echo -e "\n\e[44;97m Cleaning Up the environment...\e[0m"
# echo "================================"

kubectl apply -f negative-test-case1.yaml && \
echo -e "\n=================\n\e[41;97;1m  Result: FAIL!  \e[0m\n=================" || \
echo -e "\n=================\n\e[102;93;1m  Result: PASS!  \e[0m\n================="

echo -e "\n\e[44;97m Cleaning Up the environment...\e[0m"
# echo "================================"

{
    kubectl delete -f negative-test-case.yaml
    kubectl delete -f negative-test-case1.yaml
    kubectl delete -f positive-test-case.yaml
    kubectl delete -f constraint.yaml
    kubectl delete -f constraint-template.yaml
} 2> /dev/null
echo -e "\n================\n\e[44;97mTest Completed!\e[0m\n================"