# Notificação automática de incidentes, com base no endereço de abuse coletado via whois

No exemplo disponibilizado o arquivo gen.sh coleta os logs com as evidencias de comportamento malicioso. O script mailsabuse2.sh prepara os dados para envio via email, enquanto o script mailcert.py envia efetivamente os emails.

O scripit mailsabuse2.sh permite a atuação manual, passando um endereço IP como parâmetro (ex. ./mailsabuse2.sh X.X.X.X).

Para o funcionamento automático (coleta de logs e envio automático dos emails com base no contato whois), deve-se programar o script
gen.sh para execuçãoo periódica, assim como o mailsabuse.sh. Também é necessário se configurar no arquivo mailcert.py os dados para
autenticação no servidor smtp a ser utilizado.
