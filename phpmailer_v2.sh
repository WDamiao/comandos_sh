#!/bin/bash

instalar_phpmailer() {
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
        sed -i "s/\$mail->Username = '.*';/\$mail->Username = 'teste@phpmailer.servicos.ws';/" enviar_email.php
        sed -i "s/\$mail->Password = '.*';/\$mail->Password = 'Teste@30303030';/" enviar_email.php
        sed -i "s/\$mail->setFrom = '.*';/\$mail->setFrom = 'teste@phpmailer.servicos.ws', 'Remetente';/" enviar_email.php
        sed -i "s/\$mail->addAddress = '.*';/\$mail->addAddress = 'suportelocaweb09@gmail.com', 'Destinatario';/" enviar_email.php
        echo "... configurações de e-mail atualizadas em enviar_email.php"
    else
        echo "⚠️ Arquivo enviar_email.php não encontrado!"
    fi

    echo "feito!"
}

instalar_phpmailer
