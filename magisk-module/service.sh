touch "${0%/*}/disable"
touch /dev/.overlayfs_service_unblock

. "${0%/*}/mode.sh"

# unmount KSU overlay
"${0%/*}/overlayfs_system" --unmount-ksu
stop; start

while [ "$(getprop sys.boot_completed)" != 1 ]; do sleep 1; done
rm -rf "${0%/*}/disable"