# instantbox/cron

Run cron jobs inside a container


## Installed packages

 * dcron
 * curl
 * wget
 * rsync
 * ca-certificates


## Environment variables

`CRON_STRINGS` - string with cron jobs. Use "\n" for newline (Default: undefined)

`CRON_TAIL` - if defined, cron log file will read to `stdout` by `tail` (Default: undefined)

By default cron is running in foreground


## Cron files
 * `/etc/cron.d` - place to mount custom crontab files

At runtime, files in `/etc/cron.d` will copied to `/var/spool/cron/crontab`.

If present, `CRON_STRINGS` will create `/var/spool/cron/crontab/CRON_STRINGS`.


## Simple usage
```
docker run -d \
  -v /path/to/app/conf/crontabs:/etc/cron.d \
  -v /path/to/app/scripts:/scripts \
  instantbox/cron
```

### With scripts and CRON_STRINGS
```
docker run -d \
  -e 'CRON_STRINGS=* * * * * root /scripts/myapp-script.sh'
  -v /path/to/app/scripts:/scripts \
  instantbox/cron
```

### Get URL by cron every minute
```
docker run -d \
  -e 'CRON_STRINGS=* * * * * root wget https://example.com/job'
  instantbox/cron
```


## Log files
Log file by default placed in `/var/log/cron/cron.log `
