# Описание решения
В качестве инструмента был выбран Kind (Kubernetes in Docker), даёт доступ к Kubernetes API

Dockerfile в текущей директории относится к приложению, Dockerfile в nginx - к прокси

app-deployment.yaml - манифест для приложения, nginx-deployment.yaml - для прокси

Деплой можно произвести следующим образом:

1. Скачать kind и kubectl:
    ``` sudo apt update && upgrade -y; sudo apt install kind; sudo snap install kubectl ```
2. Создать кластер и соответствующий неймспейс:
    ``` kind create cluster --name nginx-cluster; kind create namespace nginx-cluster ```
3. Создать образа самого приложения (далее app) и nginx:
    ``` docker build -t helloworld-js:v1 .; docker build -t nginx-proxy:v1 nginx/ ```
4. Импорт образов в кластер:
    ``` kind load docker-image helloworld-js:v1 --name nginx-cluster; kind load docker-image nginx-proxy:v1 --name nginx-cluster ```
5. Применение манифестов:
    ``` kubectl apply -f app-deployment.yaml; kubectl apply -f nginx-deployment.yaml ```
# Дополнение
Сделаны небольшие скрипты для быстрой сборки (build.sh) и удаления (erase.sh) кластера на случай тестирования
