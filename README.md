Instalacja i konfiguracja skryptu pentestera w Kali Linux
Krok 1: Skopiowanie skryptu
 * Skopiuj kod skryptu do pliku o nazwie ping.sh.
 * Zapisz plik w katalogu, do którego masz łatwy dostęp.
Krok 2: Nadanie uprawnień wywoływalnych
 * Użyj polecenia chmod +x ping.sh.
Krok 3: Konfiguracja domyślnych opcji
Możesz opcjonalnie edytować plik ping.sh i dostosować domyślne opcje, takie jak:
 * Formatowanie wyników (format)
 * Plik wyjściowy (output_file)
 * Wysyłanie pingów do wielu hostów (multi_ping)
Krok 4: Użycie skryptu
Możesz użyć skryptu na dwa sposoby:
 * Pingowanie pojedynczego hosta:
ping.sh host

 * Pingowanie wielu hostów (niedostępne)
ping.sh host1 host2 host3 ...

Dodatkowe opcje
Możesz użyć flag, aby dostosować działanie skryptu:
 * -c: Sprawdź dostępność hosta
 * -s: Wyświetl szczegółowe statystyki
 * -f: Dostosuj formatowanie wyników
 * -h: Wyświetl pomoc
 * -o: Zapisz wyniki do pliku
 * -m: Pinguj wiele hostów (niedostępne)
 * -t: Ustaw timeout
 * -i: Ustaw interwał pingowania
 * -j: Wyświetl wyniki JSON
 * -v: Wyświetl szczegółowe informacje o błędach
Przykładowe zastosowania
 * Sprawdź dostępność strony internetowej:
ping.sh www.example.com

 * Wygeneruj szczegółowe statystyki pingu:
ping.sh -s host

 * Zapisz wyniki pingu do pliku output.txt:
ping.sh -o output.txt host

Uwaga:
 * Opcja pingowania wielu hostów nie jest jeszcze zaimplementowana.
Pomoc:
Aby uzyskać więcej informacji, możesz wyświetlić pomoc skryptu:
ping.sh -h

