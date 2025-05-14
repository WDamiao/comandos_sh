#!/bin/bash

instalar_phpmailer() {
    # Verifica se a pasta existe e faz backup, se necessário
    if [ -d "phpmailerlw" ]; then
        mv phpmailerlw phpmailerlw_old
        echo "... pasta antiga renomeada para phpmailerlw_old"
    fi
    cd
    cd public_html
    # Cria nova pasta e entra nela
    mkdir phpmailerlw
    cd phpmailerlw

    # Clona o repositório do GitHub
    git clone https://github.com/WDamiao/phpmailer.git .
    
    echo "... repositório clonado com sucesso em 'phpmailerlw'"
    
    # (Opcional) Remover o diretório .git para "desvincular" do GitHub
    rm -rf .git
    echo "... pasta .git removida"
    
    echo "feito!"
}

instalar_phpmailer
