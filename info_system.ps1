$info = [PSCustomObject]@{
	computerName	= $env:COMPUTERNAME
	IPAddress	= (Get-NetIPAddress -AddressFamily IPv4 | where-object {$_.InterfaceAlias -ne "Loopback*"} | Select-object -First 1 -ExpandProperty IPAddress)
	MACAddress	= (Get-NetAdapter | where-object {$_.Status -eq "Up" } | Select-object -First 1 -ExpandProperty MacAddress)
	RAM_MB		= [math]::Round((Get-CimInstance Win32_computerSystem).TotalPhysicalMemory / 1MB)
	DiskSpace_GB	= [math]::Round((Get-PSDrive -PSProvider FileSystem | where-object {$_.Name -eq "C"}).Free / 1GB)
	DateTime	= (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
	os		= (Get-cimInstance Win32_OperatingSystem).Caption
	OSVersion	= (Get-cimInstance Win32_OperatingSystem).Version
}

$info | ConvertTo-Json -Depth 3 | Out-File -Encoding UTF8 "info.json"

$info | Export-Clixml -Path "info.xml"

$info | ConvertTo-Yaml | Out-File -Encoding UTF8 "info.yaml"

$info