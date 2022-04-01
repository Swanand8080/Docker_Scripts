earch_dir=/docker_imports
for entry in "$search_dir"/*
do
  var1=$(echo "$(basename "$entry")")
  var2=$(ls $entry | wc -l)
  echo "$var1     $var2" >> result
done

