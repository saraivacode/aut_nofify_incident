# Notificação automática de incidentes, com base no endereço de abuse coletado via whois

No exemplo disponibilizado o arquivo [gen.sh](https://github.com/saraivacode/aut_nofify_incident/blob/master/gen.sh) coleta os logs com as evidencias de comportamento malicioso. O script [mailsabuse.sh](https://github.com/saraivacode/aut_nofify_incident/blob/master/mailsabuse.sh) prepara os dados para envio via email, enquanto o script [mailcert.py](https://github.com/saraivacode/aut_nofify_incident/blob/master/mailcert.py) envia efetivamente os emails.

O scripit [mailsabuse2.sh](https://github.com/saraivacode/aut_nofify_incident/blob/master/mailsabuse2.sh) permite a atuação manual, passando um endereço IP como parâmetro (ex. ./mailsabuse2.sh X.X.X.X).

Para o funcionamento automático (coleta de logs e envio automático dos emails com base no contato whois), deve-se programar o script
[gen.sh](https://github.com/saraivacode/aut_nofify_incident/blob/master/gen.sh) para execução periódica, assim como o [mailsabuse.sh](https://github.com/saraivacode/aut_nofify_incident/blob/master/mailsabuse.sh). Também é necessário que seja configurado no arquivo [mailcert.py](https://github.com/saraivacode/aut_nofify_incident/blob/master/mailcert.py) os dados para autenticação no servidor smtp a ser utilizado.

O modelo de notificação utilizado como exemplo é uma adaptacão do disponibilizado pelo CERT.br sob a licença Creative Commons Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional [(CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt_BR). Modelos originais em: https://www.cert.br/docs/whitepapers/notificacoes/#8.2
