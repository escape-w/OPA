# Run all tests and collect outputs. Generate a common report to find which policies fail.
for policy in */; do
    echo -e "\e[1;32m"
    echo ${policy%?} | awk '{print toupper($0)}'
    echo -e "\e[0m======================================\n"
    $policy/test.sh
done;