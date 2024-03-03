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

. oczywiście jest więcej może musisz się zapoznać z programem .

#instalacia 


(venv)─(root㉿kali)-[~]
└─# git clone https://github.com/Adminek01/Ping-death
Cloning into 'Ping-death'...
remote: Enumerating objects: 36, done.
remote: Counting objects: 100% (36/36), done.
remote: Compressing objects: 100% (34/34), done.
remote: Total 36 (delta 7), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (36/36), 16.40 KiB | 342.00 KiB/s, done.
Resolving deltas: 100% (7/7), done.

┌──(venv)─(root㉿kali)-[~]
└─# ls
https-security-checker  Ping-death  reinstall.sh  -SecurityScanner.pentest

┌──(venv)─(root㉿kali)-[~]
└─# cd Ping-death

┌──(venv)─(root㉿kali)-[~/Ping-death]
└─# ls
ping.sh  README.md

┌──(venv)─(root㉿kali)-[~/Ping-death]
└─# ping -h

Usage
  ping [options] <destination>

Options:
  <destination>      DNS name or IP address
  -a                 use audible ping
  -A                 use adaptive ping
  -B                 sticky source address
  -c <count>         stop after <count> replies
  -C                 call connect() syscall on socket creation
  -D                 print timestamps
  -d                 use SO_DEBUG socket option
  -e <identifier>    define identifier for ping session, default is random for
                     SOCK_RAW and kernel defined for SOCK_DGRAM
                     Imply using SOCK_RAW (for IPv4 only for identifier 0)
  -f                 flood ping
  -h                 print help and exit
  -H                 force reverse DNS name resolution (useful for numeric
                     destinations or for -f), override -n
  -I <interface>     either interface name or address
  -i <interval>      seconds between sending each packet
  -L                 suppress loopback of multicast packets
  -l <preload>       send <preload> number of packages while waiting replies
  -m <mark>          tag the packets going out
  -M <pmtud opt>     define path MTU discovery, can be one of <do|dont|want|probe>
  -n                 no reverse DNS name resolution, override -H
  -O                 report outstanding replies
  -p <pattern>       contents of padding byte
  -q                 quiet output
  -Q <tclass>        use quality of service <tclass> bits
  -s <size>          use <size> as number of data bytes to be sent
  -S <size>          use <size> as SO_SNDBUF socket option value
  -t <ttl>           define time to live
  -U                 print user-to-user latency
  -v                 verbose output
  -V                 print version and exit
  -w <deadline>      reply wait <deadline> in seconds
  -W <timeout>       time to wait for response

IPv4 options:
  -4                 use IPv4
  -b                 allow pinging broadcast
  -R                 record route
  -T <timestamp>     define timestamp, can be one of <tsonly|tsandaddr|tsprespec>

IPv6 options:
  -6                 use IPv6
  -F <flowlabel>     define flow label, default is random
  -N <nodeinfo opt>  use IPv6 node info query, try <help> as argument

For more details see ping(8).

┌──(venv)─(root㉿kali)-[~/Ping-death]
└─#