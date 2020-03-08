# raspberry-pi-wifi-reconnect

A cron job for setting wlan0 interface down and up again to recover from loss of connectivity with Raspberry Pi 3 Model B+.

## Create the bash script:

Copy contents of `wifi_rebooter.sh` in a new file:

```
$ sudo nano /usr/local/bin/wifi_rebooter.sh
$ sudo chmod +x /usr/local/bin/wifi_rebooter.sh
```

Verify that the script is executable:

```
$ ./usr/local/bin/wifi_rebooter.sh
```

## Schedule the script to run every minute

Modify the root user's crontab:

```
$ sudo su
# crontab -e
```

Add the following line at the bottom to run the script every minute and write log to `/var/log/wifi_rebooter.txt`:

```
* * * * * /usr/local/bin/wifi_rebooter.sh >> /var/log/wifi_rebooter.txt  2>&1
```

You can check if the script has reconnected by viewing the log file:

```
$ cat /var/log/wifi_rebooter.txt
```


## Sources

The solution is based on Alex Bain's script at http://alexba.in/blog/2015/01/14/automatically-reconnecting-wifi-on-a-raspberrypi/ and modified to ping the router instead of a DNS server.
