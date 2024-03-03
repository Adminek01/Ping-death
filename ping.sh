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
    echo "11. Pobieranie informacji o koncie Instagrama"
    echo "0. Wyjście"
    read option
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

# Funkcja do pobierania informacji o koncie Instagrama
get_instagram_info() {
    echo "Wpisz nazwę użytkownika na Instagramie:"
    read username
    echo "Wpisz identyfikator sesji Instagrama:"
    read session_id
    toutatis -u "$username" -s "$session_id"
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
        get_instagram_info
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
