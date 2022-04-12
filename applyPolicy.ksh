##Tested on Git bash : git version 2.33.0.windows.2
##initilaizing varibles
policies=()
typoRaw="$1"
validInput=(Bootstrap Baseline Restricted) ##valid standards for poilicies

##script usage function
usage()
{
 echo -e "\nSyntax : \n"
 echo -e "applyPolicy.ksh <standard>"
 echo -e " where:"
 echo -e "\tStandard(Argument) would be : Bootstrap or Baseline or Restricted"
}

##Policies against standard
policyCalcultor()
{
while IFS=, read -r PolicyKind Bootstrap Baseline Restricted
do  
    typo="$1"
    if [[ ${!typo} == [yY][eE][sS] ]] 
    then
      policies+=("$PolicyKind")
    fi
done < file.csv
}

##Script start
##validating for right input
if [ "$1" == "-h" ] || [ "$#" -ne 1 ] || [[ ! " ${validInput[*]} " =~ $1  ]]
then
    usage
    exit 1
fi

policyCalcultor "$typoRaw"

for policy in ${policies[@]}
do
    policyName=`grep -rw $policy .|awk -F"/" '{print $2}'|uniq|grep -v file`
    echo -e "\nApplying Policy : $policyName \n"
    kubectl apply -f ./$policyName/constraint-template.yaml  &>/dev/null
    if [[ ! $? ]]
    then
    echo "contranint-template and constarint not applied : $policyName"
    else
    kubectl apply -f ./$policyName/constraint.yaml  &>/dev/null
    fi
done
