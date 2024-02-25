I'd be glad to provide more tailored examples, but I'm unable to access the specific contents of your ping.sh script or README.md file due to privacy restrictions. However, I can offer general examples based on the ping command and common usage scenarios:
Basic ping:
 * Check the availability of a website:
   ping google.com

 * Ping a specific IP address:
   ping 8.8.8.8

Advanced ping options:
 * Send a specific number of pings:
   ping -c 10 192.168.1.100

 * Set a custom packet size:
   ping -s 1024 10.0.0.1

 * Increase the time between pings:
   ping -i 3 172.16.0.254

 * Save ping results to a file:
   ping -c 5 www.example.com > ping_results.txt

Remember:
 * Use ping responsibly and ethically, with proper authorization.
 * Explore the ping man page (man ping) for more options and usage details.
If you have further questions or need more specific examples, feel free to ask, providing any relevant context or requirements without disclosing sensitive information.

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

