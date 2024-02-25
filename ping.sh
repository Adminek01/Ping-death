#!/bin/bash

# Funkcja do wyświetlania menu i pobierania opcji
show_menu() {
    echo "Wybierz opcję:"
    echo "1. Test Apache Bench"
    echo "2. Test ping"
    echo "3. Monitorowanie wydajności sieciowej"
    echo "4. Sprawdzanie dostępności portów"
    echo "5. Analiza logów"
    echo "6. Testowanie prędkości łącza"
    echo "0. Wyjście"
    read option
}

# Funkcja do uruchamiania testu Apache Bench
run_ab_test() {
    # Dodanie argumentu do wyboru celu testu
    echo "Wpisz adres URL strony do testowania:"
    read url
    ab -n 1000000 -c 1000 -g ab_results.csv $url &
}

# Funkcja do uruchamiania testu ping
run_ping_test() {
    # Dodanie argumentu do wyboru celu testu
    echo "Wpisz adres IP lub nazwę hosta do pingowania:"
    read host
    ping -f -c 65507 -s 65507 -i 0.001 $host &
}

# Funkcja do monitorowania wydajności sieciowej
network_performance_monitor() {
    echo "Monitorowanie wydajności sieciowej:"
    echo "----------------------------------"
    # Dodanie argumentu do wyboru serwera
    echo "Wpisz adres IP lub nazwę hosta serwera:"
    read server
    iperf -c $server
}

# Funkcja do sprawdzania dostępności portów
check_port_availability() {
    # Dodanie argumentu do wyboru celu testu
    echo "Wpisz adres IP lub nazwę hosta do sprawdzania:"
    read host
    echo "Sprawdzanie portu 80:"
    nc -zv $host 80
    echo "Sprawdzanie portu 443:"
    nc -zv $host 443
}

# Funkcja do analizy logów
analyze_logs() {
    echo "Analiza logów:"
    echo "--------------"
    # Dodanie kodu do analizy logów, generowania raportów itp.
}

# Funkcja do testowania prędkości łącza
speed_test() {
    echo "Testowanie prędkości łącza:"
    echo "---------------------------"
    speedtest-cli --server 1234
}

# Główna pętla programu
while true; do
    show_menu
    case "$option" in
    1)
        run_ab_test
        ;;
    2)
        run_ping_test
        ;;
    3)
        network_performance_monitor
        ;;
    4)
        check_port_availability
        ;;
    5)
        analyze_logs
        ;;
    6)
        speed_test
        ;;
    0)
        echo "Wyjście z programu..."
        break
        ;;
    *)
        echo "Nieprawidłowa opcja. Spróbuj ponownie."
        ;;
    esac
    wait
done
