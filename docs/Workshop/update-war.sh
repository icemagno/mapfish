# A small script to add print configurations to a MapFish Print war file.
#
# Usage: ./update-war.sh print.war 00-workshop new-print.war
#
# This adds the print configuration in `00-workshop` to the war `print.war`
# and created the updated war in `new-print.war`.
#

if [ $# -lt 3 ]; then
  echo 'Usage: ./update-war.sh [path to print war to update] [path to print app to add]  [path to target war]'
  echo 'Example: ./update-war.sh print.war 00-workshop new-print.war'
  exit 1
fi

touch $3
source_war="$(readlink -e  $1)"
target_war="$(readlink -e  $3)"
print_app="$(readlink -e  $2)"

echo "Source: ${source_war}"
echo "Target: ${target_war}"
echo "Print-app: ${print_app}"

# unzip the original war to a temp. folder
tmp=/tmp/mfp-temp
rm -rf ${tmp}
mkdir ${tmp}
cd ${tmp}
jar xf ${source_war}

# add the print configuration
cp -r ${print_app} "${tmp}/print-apps"

# zip the war again
jar cf ${target_war} .
rm -rf ${tmp}
