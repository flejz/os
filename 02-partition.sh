# partition
PART_BOOT="${PART_BOOT:=$PART_DEV\1}"
PART_SWAP="${PART_SWAP:=$PART_DEV\2}"
PART_ROOT="${PART_ROOT:=$PART_DEV\3}"

HAS_DEV=$(ls "$PART_DEV" 2>/dev/null)
if [ -z "$HAS_DEV" ]; then
  echo "No $PART_DEV found. Set \$PART_DEV environment variable"
  exit 1
fi

"
label: dos
label-id: 0xac35a35a
device: $PART_DEV
unit: sectors

$PART_BOOT : start=        2048, size=     1048576, type=b, bootable
$PART_SWAP : start=     1052670, size=   487344130, type=5
$PART_ROOT : start=     1052672, size=   487344128, type=83
"
sfdisk
