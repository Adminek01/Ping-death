#!/bin/bash

# Funkcja do wyświetlania pomocy
show_help() {
    echo "Skrypt do pingowania hostów"
    echo "Opcje:"
    echo "-c: Sprawdź dostępność hosta"
    echo "-s: Wyświetl szczegółowe statystyki"
    echo "-f: Dostosuj formatowanie wyników"
    echo "-h: Wyświetl tę pomoc"
    echo "-o <plik>: Zapisz wyniki do pliku"
    echo "-m <liczba>: Pinguj wiele hostów"
    echo "-t <czas>: Ustaw timeout"
    echo "-i <interwał>: Ustaw interwał pingowania"
    echo "-j: Wyświetl wyniki JSON"
    echo "-v: Wyświetl szczegółowe informacje o błędach"
}

# Sprawdź argumenty
if [ -z "$1" ] || [[ "$1" == "-h" ]]; then
    show_help
    exit 1
fi

# Zdefiniuj opcje
check_availability=false
show_statistics=false
format=default
output_file=""
multi_ping=false
timeout=0
interval=1
json_output=false
verbose_errors=false

# Przetwórz argumenty
while getopts "cshfmo:t:i:jv" arg; do
    case $arg in
        c) check_availability=true ;;
        s) show_statistics=true ;;
        f) format=$arg ;;
        o) output_file=$OPTARG ;;
        m) multi_ping=true ;;
        t) timeout=$OPTARG ;;
        i) interval=$OPTARG ;;
        j) json_output=true ;;
        v) verbose_errors=true ;;
        *) echo "Nieprawidłowa opcja: -$arg" && exit 1 ;;
    esac
done

# Funkcja do sprawdzania błędów
check_errors() {
    # Sprawdź, czy podano hosta.
    if [ -z "$1" ]; then
        echo "Nie podano hosta." && exit 1
    fi

    # Sprawdź, czy plik wyjściowy istnieje (jeśli podano).
    if [ -n "$output_file" ] && [ -f "$output_file" ]; then
        echo "Plik wyjściowy '$output_file' już istnieje." && exit 1
    fi

    # Sprawdź, czy podano prawidłowy format (jeśli podano).
    if [ "$format" != "default" ] && ! grep -q "$format" <<< "csv json"; then
        echo "Nieprawidłowy format: '$format'." && exit 1
    fi

    # Sprawdź, czy podano prawidłowy timeout (jeśli podano).
    if [ "$timeout" -lt 0 ]; then
        echo "Nieprawidłowy timeout: '$timeout'." && exit 1
    fi

    # Sprawdź, czy podano prawidłowy interwał (jeśli podano).
    if [ "$interval" -lt 0 ]; then
        echo "Nieprawidłowy interwał: '$interval'." && exit 1
    fi
}

# Funkcja do wysyłania pakietów ping
send_ping() {
    ping $@ | while read pong; do
        echo $pong
    done
}

# Pingowanie pojedynczego hosta
if ! $multi_ping; then

    # Sprawdź błędy
    check_errors "$1"

    # Sprawdź dostępność hosta
    if $check_availability; then
        ping -c 1 $1 > /dev/null
        if [ $? -eq 0 ]; then
            echo "Host $1 jest dostępny"
        else
            echo "Host $1 jest niedostępny"
            exit 1
        fi
    fi

    # Wyślij ping i wyświetl wyniki w czasie rzeczywistym
    send_ping $1

# Pingowanie wielu hostów
else

    # TODO: Dodaj obsługę pingowania wielu hostów

    echo "Opcja pingowania wielu hostów jeszcze niezaimplementowana"

fi

# Wyświetlanie statystyk
if $show_statistics; then
    ping -c 5 $1 | tail -n 2
fi

# Zapisz wyniki do pliku
if [ -n "$output_file" ]; then
    ping $1 -c 5 > $output_file
    echo "Wyniki pingu zostały zapis
