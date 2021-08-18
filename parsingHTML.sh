#!/bin/bash
if [ "$1" == "" ]
then
	echo "Dh-Paradox - PARSING HTML"
	echo "Modo de uso: $0 exemplo.com"
else
#pegar o codigo fonte do site especificado
echo "*********RESOLVENDO HOST $1*********"
wget -q $1 bg;
#limpar o resultado para mostrar apenas subdominios, sem poluicao visual
cat index.html | grep "href" | grep "http" | cut -d ":" -f 2 | sed 's/\/\///g' | cut -d ">" -f 1 | cut -d "/" -f 1 | tr -d '"' | uniq -c > lista.txt;
for url in $(cat lista.txt);
do
	host $url | grep "has address" | uniq -c;
done
rm -r index.html
rm -r lista.txt
fi
