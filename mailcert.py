# -*- coding: utf-8 -*-
"""
Created on Wed Jul 31 22:46:11 2019

@author: saraiva
"""

from datetime import datetime
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib

# create message object instance
msg = MIMEMultipart()

password = "yourpass"
msg['From'] = "user_smtp_server@domain"

print("Identificando endereço abuse de destino...")
path = './to.txt'
to_file = open(path,'r')
to = to_file.read()
to_file.close()
msg['To'] = str(to)

print("Identificando ip com comportamento malicioso...")
path = './ip.txt'
ip_file = open(path,'r')
ip = ip_file.read()
ip_file.close()

print("Identificando logs...")
path = './logsatk.txt'
logsatk_file = open(path,'r')
logsatk = logsatk_file.read()
logsatk_file.close()

print("Iniciando...")

print("Enviando email...")
agora = str(datetime.now())
print(agora)

msg['Subject'] = " {} - possible malicious activity from this host".format(ip)

# O modelo de notificação proposto é uma adaptacão do disponibilizado pelo CERT.br sob a licença Creative Commons (CC BY-NC-SA 4.0).
#Modelos originais em: https://www.cert.br/docs/whitepapers/notificacoes/#8.2

html = """\
<!DOCTYPE html>
<html>
<html>
        <body>
        <p>Dear Sir/Madam,</p>
        <p>I am the administrator of a machine (IP: X.X.X.X).</p>
        <p>You've received this message because you are the the WHOIS contact for the<br />network mentioned below. This message is intended for the person<br />responsible for computer security at your site. If this is not the<br />correct address, please forward this message to the appropriate party.</p>
        <p>The logs attached at the end of this message show malicious activity<br />originated from an IP address in your network. They are samples of<br />BRUTE FORCE ATTACK. All times are UTC.</p>
        <p>Either:</p>
        <p>* a machine in your network has been compromised and is now being<br />used to launch attacks, or;</p>
        <p>* a legitimate user is engaged in activity that is probably in<br />violation of your Terms of Service.</p>
        <p>I kindly request you to look into the matter.</p>
        <p>Thanks in advance. I would also appreciate a reply that this message<br />has been received.</p>
        <p><br />Best regards,<br />Saraiva</p>
        <p>##################################################################<br />## LOGs - all times are UTC</p>

        {}

 </body>
</html>""".format(logsatk)

part2 = MIMEText(html, "html")
msg.attach(part2)

#utilizado servidor do gmail.
server = smtplib.SMTP('smtp.gmail.com: 587')

server.starttls()

server.login(msg['From'], password)

server.sendmail(msg['From'], msg['To'], msg.as_string())

server.quit()

print("OK!")
