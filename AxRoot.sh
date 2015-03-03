#!/system/bin/sh
# Get root, FTW!

mount -o rw,remount /system
cp enable_uninstall.sh /system/vendor/bin/enable_uninstall.sh
cp su /system/bin/su
cp Superuser.apk /system/app/Superuser.apk
chmod 644 /system/app/Superuser.apk
cp stericson.busybox-1.apk /data/app/stericson.busybox-1.apk
chmod 644 /data/app/stericson.busybox-1.apk
chown system.system /data/app/stericson.busybox-1.apk
cp busybox /system/xbin/busybox
chown root.shell /system/xbin/busybox
chmod 04755 /system/xbin/busybox
/system/xbin/busybox --install -s /system/xbin
find /system/xbin -type l | busybox xargs busybox chown -h 0.0
chown root.shell /system/bin/su
chmod 06755 /system/bin/su
ln -s /system/bin/su /system/xbin/su

# Restore original /system/vendor/bin/enable_uninstall.sh
chmod 777 /system/vendor/bin/enable_uninstall.sh
rm /system/vendor/bin/enable_uninstall.sh
cp /data/local/tmp/enable_uninstall.sh /system/vendor/bin/enable_uninstall.sh
chown root.shell /system/vendor/bin/enable_uninstall.sh
chmod 755 /system/vendor/bin/enable_uninstall.sh

# Remove temp stuff
rm su
rm stericson.busybox-1.apk
rm Superuser.apk
rm busybox
rm /data/local/tmp/enable_uninstall.sh

# Banzai!
rm /data/local/tmp/rooting.sh
