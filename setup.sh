
./01-presetup.sh $@

PART_DEV="${PART_DEV:=/dev/sda}"
./02-partition.sh $@
