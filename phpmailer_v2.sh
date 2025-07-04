#!/bin/bash

instalar_phpmailer() {
    cd
    cd public_html
    # Verifica se a pasta existe e faz backup, se necessário
    if [ -d "phpmailerlw" ]; then
        mv phpmailerlw phpmailerlw_old
        echo "... pasta antiga renomeada para phpmailerlw_old"
    fi

    # Cria nova pasta e entra nela
    mkdir phpmailerlw
    cd phpmailerlw

    # Clona o repositório do GitHub
    git clone https://github.com/WDamiao/phpmailer.git .

    echo "... repositório clonado com sucesso em 'phpmailerlw'"

    # Remove o controle de versão Git (opcional)
    rm -rf .git

    # Altera as configurações do arquivo enviar_email.php
    if [ -f enviar_email.php ]; then
        sed -i "s/\$mail->Host = '.*';/\$mail->Host = 'email-ssl.com.br';/" enviar_email.php
        sed -i "s/\$mail->Username = '.*';/\$mail->Username = 'teste@phpmailerlw.servicos.ws';/" enviar_email.php
        sed -i "s/\$mail->Password = '.*';/\$mail->Password = 'Teste@3030';/" enviar_email.php
        sed -i "s|\$mail->setFrom('.*', '.*');|\$mail->setFrom('teste@phpmailerlw.servicos.ws', 'Formulario PHP Mailer');|" enviar_email.php
        sed -i "s|\$mail->addAddress('.*', '.*');|\$mail->addAddress('suportelocaweb09@gmail.com', 'Destinatario');|" enviar_email.php
        echo "... configurações de e-mail atualizadas em enviar_email.php"
    else
        echo "⚠️ Arquivo enviar_email.php não encontrado!"
    fi

    echo "feito! ✅ Acesse o "dominio/phpmailerlw" para testar o formulario"
}

instalar_phpmailer
