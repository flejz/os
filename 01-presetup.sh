# check if sysmte has efi
HAS_EFI=$(ls /sys/firmware/efi/efivars 2>/dev/null)
if [ -z "$HAS_EFI" ]; then
  echo "No EFI detected"
fi

# update system clock
timedatectl set-ntp true
