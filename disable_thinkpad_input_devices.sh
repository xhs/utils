#!/usr/bin/env bash

function extract_device_id() {
	device_name=$1
	echo `xinput list | grep "$device_name" | awk -F'id=' '{print $2}' | awk -F' ' '{print $1}'`
}

device_names=(
	'SynPS/2 Synaptics TouchPad'
	'AT Translated Set 2 keyboard'
	'TPPS/2 IBM TrackPoint'
	'ThinkPad Extra Buttons'
)

for device_name in "${device_names[@]}"; do
	device_id=`extract_device_id $device_name`
	echo "Disabling $device_name (id=$device_id) ..."
	xinput float $device_id
done

