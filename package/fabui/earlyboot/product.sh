#!/bin/bash

## @fn custom_firstboot_begin()
## Execute custom commands upon entering firstboot
custom_firstboot_begin()
{
	write_uart "M701 S255\r\n"
	write_uart "M702 S0\r\n"
	write_uart "M703 S0\r\n"
}

## @fn custom_firstboot_end()
## Execute custom commands upon leaving firstboot
custom_firstboot_end()
{
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
	true
}

## @fn custom_recovery_end()
## Execute custom commands upon leaving emergency procedure
custom_recovery_end()
{
	webui_redirect "/" 20
	sleep 1
}

## @fn custom_recovery_condition()
## Condition for entering recovery mode.
custom_recovery_condition()
{
	false
}
