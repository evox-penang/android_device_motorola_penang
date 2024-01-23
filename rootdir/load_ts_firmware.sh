#!/system/bin/sh

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=
device=$(getprop ro.boot.device)

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	while true; do
		readiness=$(cat $touch_path/poweron)
		if [ "$readiness" == "1" ]; then
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}
cd $firmware_path
touch_product_string=$(ls $touch_class_path)
if [[ -d /sys/class/touchscreen/ft8057 ]]; then
       echo "focaltech"
       firmware_file="focaltech-csot-ft8057-05-0000-penang.bin"
       touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | tail -n 1)
       wait_for_poweron
       echo $firmware_file > $touch_path/doreflash
       echo 1 > $touch_path/forcereflash
       sleep 5
       echo 1 > $touch_path/reset
elif [[ -d /sys/class/touchscreen/NVT-ts ]]; then
        echo "novatek"
        cfirmware_file="novatek_ts_fw.bin"
        echo 1 > /proc/nvt_update
fi

return 0
