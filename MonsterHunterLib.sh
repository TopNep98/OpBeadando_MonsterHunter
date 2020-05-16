#!/bin/bash



curl "https://mhw-db.com/monsters" | tr ',' "\n" > Monsters 
grep -A 3 -B 2 '"species"' Monsters > MonsterId

echo "How to use"
echo ""
echo "-l: list all monsters"
echo "-e list all elder dragons"
echo "-i(NUM): get a specific monster by its id"
 
while getopts lei: options; do
 case $options in
	l) cat MonsterId ;;
	e) grep -A 3 -B 2 'elder' Monsters > ElderDragons
	   cat ElderDragons ;;
	i) id=$OPTARG ;;
 esac
done

if [ -n "$id" ]
then
curl "https://mhw-db.com/monsters/"$id | tr ',' "\n" > Monster
cat Monster
fi
