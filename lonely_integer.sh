#https://www.hackerrank.com/challenges/lonely-integer-2
read n
read -a arr
declare -A assoc_arr
for num in ${arr[@]}
do
if [[ -z "${!assoc_arr[${num}]}" ]]
then
assoc_arr[${num}]=`expr ${assoc_arr[$num]} + 1`
else
assoc_arr[${num}]=1
fi
done

for key in "${!assoc_arr[@]}"
do
if [ ${assoc_arr[$key]} -eq 1 ]
then
echo $key
fi
done
