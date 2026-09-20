Объявление secrets.yml (для логина и пароля): ansible-vault create secrets.yml
В нём прописываем переменные следующим образом:

vault_carx_password: "..."
vault_carx_login: "..."

Редактировать и посмотреть secrets.yml: ansible-vault edit secrets.yml
 
Запуск: sudo ansible-playbook nginx_deploy.yaml -e "local=true" --ask-vault-pass

