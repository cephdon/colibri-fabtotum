#!/bin/bash

reset_totumduino()
{
	export_gpio ${RESET_PIN}
	set_direction_gpio ${RESET_PIN} high

	write_gpio ${RESET_PIN} 1
	# sleep not needed as it takes time to execute
	write_gpio ${RESET_PIN} 0
	# sleep not needed as it takes time to execute
	write_gpio ${RESET_PIN} 1
	
	unexport_gpio ${RESET_PIN}
}

## @fn custom_firstboot_begin()
## Execute custom commands upon entering firstboot
custom_firstboot_begin()
{
	write_uart "M728\r\n"
	write_uart "M701 S0\r\n"
	write_uart "M702 S0\r\n"
	write_uart "M703 S255\r\n"
}

## @fn custom_firstboot_end()
## Execute custom commands upon leaving firstboot
custom_firstboot_end()
{
#	reset_totumduino
	webui_redirect "/" 20
	sleep 1
}

## @fn custom_normal_begin()
## Execute custom commands upon entering earlyboot
custom_normal_begin()
{
	true
}

## @fn custom_normal_end()
## Execute custom commands upon user aborted recovery 
custom_recovery_aborted()
{
	#write_uart "M999\r\n"
	reset_totumduino
	webui_redirect "/" 15
	sleep 1
}

## @fn custom_normal_end()
## Execute custom commands upon leaving earlyboot
custom_normal_end()
{
	true
}

## @fn custom_recovery_begin()
## Execute custom commands upon entering emergency procedure
custom_recovery_begin()
{
	write_uart "M728\r\n"
	write_uart "M701 S255\r\n"
	write_uart "M702 S0\r\n"
	write_uart "M703 S0\r\n"
}

## @fn custom_recovery_end()
## Execute custom commands upon leaving emergency procedure
custom_recovery_end()
{
	#write_uart "M999\r\n"
	reset_totumduino
	webui_redirect "/" 20
	sleep 1
}

## @fn custom_recovery_condition()
## Condition for entering recovery mode.
custom_recovery_condition()
{
	false
}

## @fn custom shutdown code
## These instructions are executed when poweroff is requested
## after all the processes have been stopped
custom_shutdown_end()
{
	true
}

## @fn custom reboot code
## These instructions are executed when reboot is requested
## after all the processes have been stopped
custom_reboot_end()
{
	true
}
