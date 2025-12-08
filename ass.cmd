%echo off
color 60
set path=C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8.1 Tools
ildasm.exe  %1 /out=myfile.il