# xojo_console_signals
An example of using system signals with macOS & Linux Xojo console and web apps with an additional SystemD module for Linux which allows you to hook into the SystemD watchdog system. Watchdog will watch your app to make sure it hasn't hung and if it has, will automatically kill and restart your app.

## SystemD example file

Edit the file, adding your own description, exe path, pid path, user and group. Rename the example file to reflect the name of your service

Place the file in /etc/systemd/system/

To install the service: 

```
sudo systemd enable yourapp.service
```

To start the service: 

```
sudo systemd start yourapp.service
```

To restart the service: 

```
sudo systemd restart yourapp.service
```

To stop the service: 

```
sudo systemd stop yourapp.service
```

To uninstall the service: 

```
sudo systemd disable yourapp.service
```

