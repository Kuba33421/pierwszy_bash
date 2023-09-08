stworz_siatke(){
    siatka=(
        "G A B C D E F H I J K L M N O P Q S T U V W X Y Z"
    }
    )
}

#szyfrowanie 
szyfruj() {
    local tekst="$1"
    local zaszyfrowany_tekst=""

    for litera in $(echo "$tekst") | tr '[:lower]' '[:upper]'
    do
        if [["$litera" =~ [A-Z]]]; then
            for ((i = 0; i < ${#siatka[0]}; i++)); do
                if [[ "${siatka[0]:$i:1}" == "$litera"]]; then
                    zaszyfrowany_tekst+="$i"
                    break
                fi
            done
        else
            zaszyfrowany_tekst+="$litera"
        fi
    done
    echo "zaszyfrowany tekst"
}

#deszyfrowanie
deszyfruj(){
    local zaszyfrowany_tekst="$1"
    local odszywrowany_tekst=""

    for cyfra in $zaszyfrowany_tekst
    do
        if [["$cyfra"=~ [0-9]]]; then
        else
        odszywrowany_tekst+="$cyfra"
        fi
    done

    echo "$odszyfrowany_tekst"
}

#check 
if [ $# -lt 2 ]; then
    echo "Użycie: $0 -in <plik_wejsciowy> [-out <plik_wyjsciowy>]"
    exit 1
fi

while [[ $# -gt 0]]; do 
    key="$1"
    
    case $key in
        -in)
            plik_wejsciowy="$2"
            shift
            shift
            ;;
        -out)
            plik_wyjsciowy="$2"
            shift
            shift
            ;;
        *)
        shift
        ;;
    esac
done


if [ -z "plik_wejsciowy"]; then
    echo "Nie wybrales zadnego pliku."
    exit 1 

else

if [ ! -f "plik_wejsciowy"]; then
    echo "Plik $plik_wejsciowy nie istnieje."
    exit 1 
fi


#while read line
#do
 # echo $line
#done < input.txt
#!/bin/bash
echo "Today is " `date`

#echo -e "\nenter the path to directory"
#read the_path

#echo -e "\nyour path has the following files and folders: "
#ls $the_path
