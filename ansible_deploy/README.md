# Описание
Плейбук nginx_deploy.yaml - точка входа. Решение разбито на 4 логические роли:

1. Подготовительная часть по обновлению пакетов (preinstall)
2. Непосредственно установка nginx (nginx_install)
3. Настройка nginx (nginx_setup)
4. Настройка доступа по SSH (security).

Пункт 1 постарался предусмотреть для большинства Linux-систем (apt + dnf + yum).

Также отмечу, что для хранения паролей и логина предусмотрен Ansible Vault, доступный по умолчанию. 

## Логин и пароль
**Данный пункт нужен, если необходимо поменять пароль, который Ansible запрашивает при запуске плейбука**
**Secrets.yml уже существует, для первого запуска пароль: asd**

Объявление secrets.yml (для логина и пароля): ```rm secrets.yml; ansible-vault create secrets.yml```
В нём прописываем переменные следующим образом:
```
vault_carx_password: "..."
vault_carx_login: "..."
```
Редактировать и посмотреть secrets.yml: ansible-vault edit secrets.yml
## Запуск
Запуск локально: ```ansible-playbook nginx_deploy.yaml -e "local=true" --ask-vault-pass```

# Дополнение
Сделан скрипт delete_nginx.sh для полного удаления nginx и его компонент из системы для тестирования
