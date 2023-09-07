
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
    
    for litera in $(echo "$tekst") | tr '[:lower]' '[upper]' #zmienia male litery na duze 
    do 
    if [[ "$litera =~ [A-Z]"]]; then
    for i in {0..4}; do #przedzial liczb z siatki 
        for j in {0..4}; do 
            if [[ "${siatka[i]:$j:1}" == "$litera"]]; then
            zaszyfrowany_tekst+="$i$j"
            fi 
        done
    done
    else 
        aszyfrowany_tekst+="$litera"
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
}