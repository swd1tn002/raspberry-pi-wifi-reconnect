# raspberry-pi-wifi-reconnect

My Raspberry Pi 3 Model B+ at times loses wifi connectivity due to unknown reasons. The signal appears strong and wifi appears to be connected, but all connections time out. This cron job is created for setting the wifi interface down and up again when such connectivity issue is detected to restore the connection.

## Create the bash script:

Copy contents of [wifi_rebooter.sh](wifi_rebooter.sh) in a new file:

```
$ sudo nano /usr/local/bin/wifi_rebooter.sh
$ sudo chmod +x /usr/local/bin/wifi_rebooter.sh # makes the file executable
```

Verify that the script is executable:

```
$ sh /usr/local/bin/wifi_rebooter.sh
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
wlan0 reconnected at Sun Mar  8 12:02:01 EET 2020
```


## Sources

The solution is based on Alex Bain's script at http://alexba.in/blog/2015/01/14/automatically-reconnecting-wifi-on-a-raspberrypi/ and modified to ping the router instead of a DNS server.
