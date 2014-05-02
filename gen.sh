# generate list of files to be compiled
linkierFlags=$(echo $0 | awk '{ $1=""; print $0}')
dependancies=$(ls *.cpp)
ofiles=$(echo $dependancies | sed 's/.cpp/.o/g')
echo $1.x: $ofiles
echo -e"\tg++ -g" $1.x $ofiles; $linkerFlags

for file in $dependancies;
do
dep=$(g++ -MM $file);   
echo $dep
echo -e "\tg++ -g -c $file" 
done

 
