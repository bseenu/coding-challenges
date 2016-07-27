#https://www.hackerrank.com/challenges/fractal-trees-all
read count
declare -A matrix
NCOLS=100
NROWS=63
NMAX=5

for rows in $(seq 0 $(( $NROWS - 1 )) )
do
for cols in $(seq 0 $(( $NCOLS - 1 )) )
do
matrix[$rows,$cols]="_"
done
done
MAX=$NROWS
mid_point=`echo "scale=0;$NCOLS/2"|bc -l`
init=1
function update() {
mp_array=$@
if [ $init -gt $count ]
then
return
fi
for mp in $mp_array
do
NLEN=`echo "scale=0;2 ^ ( $NMAX - $init )"|bc -l`
start=`echo "scale=0;$mp - $NLEN"|bc`
end=`echo "scale=0;$mp +  $NLEN"|bc`
limit=`echo "2 * $NLEN "|bc -l`
while [ $limit -le $MAX ]
do
matrix[$limit,$start]=1
matrix[$limit,$end]=1
if [ $start -ne $end ]
then
start=`echo "scale=0;$start + 1"|bc -l`
end=`echo "scale=0;$end - 1"|bc -l`
fi
limit=`echo "$limit + 1"|bc -l`
done
done
MAX=`echo "2 * $NLEN"|bc -l`
init=`echo "scale=0;$init + 1"|bc -l`
if [ $init -le  $count ]
then
if [ $init -eq 2 ]
then
update  `echo "scale=0;$mid_point - ( 2 ^ ( $NMAX - 1 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) )"|bc -l`
fi
if [ $init -eq 3 ]
then
update `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 ))"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 ))"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 ))"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 ))"|bc -l`
fi
if [ $init -eq 4 ]
then
update `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) )"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) )"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) )"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) )"|bc -l`
fi
if [ $init -eq 5 ]
then
update `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) ) - ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) ) + ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) ) - ( 2 ^ ( $NMAX - 4 ))"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) ) + ( 2 ^ ( $NMAX - 4 ))"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) ) - ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) ) + ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) ) - ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0; $mid_point - ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) ) + ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) ) - ( 2 ^ ( $NMAX -4 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) ) + ( 2 ^ ( $NMAX -4 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) ) - ( 2 ^ ( $NMAX -4 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) - ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) ) + ( 2 ^ ( $NMAX -4 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) ) - ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) - ( 2 ^ ( $NMAX -3 ) ) + ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) ) - ( 2 ^ ( $NMAX - 4 ) )"|bc -l` `echo "scale=0;$mid_point + ( 2 ^ ( $NMAX - 1 ) ) + ( 2 ^ ( $NMAX -2 )) + ( 2 ^ ( $NMAX -3 ) ) + ( 2 ^ ( $NMAX - 4 ) )"|bc -l`
fi
fi
}

update 49

for nrows in $(seq 0 $(( $NROWS - 1 )))
do
for ncols in $(seq 0 $(( $NCOLS - 1 )))
do
echo -n "${matrix[$nrows,$ncols]}"
done
echo ""
done


