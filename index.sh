
## testowe zadanie echo "test" > test.txt
##Lista słów zastrzeżonych:

#!
#case
#do
#done
#elif
#else
#esac
#fi
#for
#function
#if
#in
#select
#then
#until
#while
#{
#}
#time
#[
#]



towrzenie_siatka(){
    siatka=( [0]="ABCDE" [1]="FGHIK" [2]="LMNOP" [3]="RSTUV" [4]="WXYZA")
}

#kod szyfrowania
syfruj(){
    local tekst"$1"
    local zaszyfrowany_tekst""
    
    for litera in $(echo "$tekst") | tr '[:lower]' '[:upper]' #zmienia male litery na duze 
    do 
    if [[ "$litera =~ "[A-Z]"]]; then
    for i in {0..4}; do #przedzial liczb z siatki 
        for j in {0..4}; do 
            if [[ "${siatka[i]:$j:1}" == "$litera"]]; then
            zaszyfrowany_tekst+="$i$j"
            fi 
        done
    done
    else 
        zaszyfrowany_tekst+="$litera"
    fi
    done

    echo "$zaszyfrowany_tekst"
}

# deszyfrowanie kod

deszyfruj(){
    local tekst="$1"
    local odszyfrowany_tekst=""
    for (( i=0; i<${#tekst}; i+=2))
    do
        local row="${tekst:$i:1}"
        local col="${tekst:$((i+1)):1}"
        odszyfrowany_tekst+="${siatka[$row]:$col:1}"
    done

    echo "$odszyfrowany_tekst"
} else


stworz_siatke

#sprawadzanie argument
if [ $# -lt 2]; then
    echo "Uzycie: $0 -in <plik_wejsciowy> [-out <plik_wyjsciowy>]"
    exit 1
fi
while [[ $# -gt 0 ]]; do
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

if [ -z "$plik_wejsciowy"]; then 
    zaszyfrowana_wiadomosc=$(szyfruj "$(cat "$plik_wejsciowy")")
    echo "Zaszyfrowana wiadomosc:"
    echo "$zaszyfrowana_wiadomosc"
else

    zaszyfrowana_wiadomosc=$(szefruj "$(cat "$plik_wejsciowy")")
    echo "zaszyfrowana_wiadomosc" > "$plik_wejsciowy"
    echo "Zaszyfrowana_wiadomosc zapisana do pliku $plik_wyjsciowy"
