Обновляем пакеты sudo apt update
Устанавливаем sudo apt install -y openvpn; -y это аргумент команды apt, который обозначает "yes" или "да" в ответ на все запросы подтверждения.


Easy-RSA - это набор сценариев (скриптов) для управления инфраструктурой открытых ключей (PKI), который облегчает генерацию и управление сертификатами и ключами для протоколов шифрования, таких как SSL/TLS.

В контексте задачи, о которой мы говорили ранее (настройка VPN с использованием OpenVPN), Easy-RSA используется для генерации сертификатов и ключей, необходимых для обеспечения безопасной аутентификации и шифрования между клиентами и сервером VPN.

Вот почему Easy-RSA полезен в данной задаче:

Генерация Сертификатов и Ключей: Easy-RSA позволяет сгенерировать необходимые сертификаты и ключи для сервера и клиентов. Эти сертификаты играют важную роль в обеспечении безопасности коммуникаций через VPN.

Управление PKI: С Easy-RSA вы можете создать собственную PKI. Это включает в себя создание корневого сертификата, промежуточных сертификатов и конечных пользовательских сертификатов. Эта структура обеспечивает иерархию доверия в сети.

Обновление и Отзыв Сертификатов: Easy-RSA позволяет легко обновлять и отзывать сертификаты, что может понадобиться в случае компрометации или смены конфигурации сети.

Простота В Использовании: Как следует из названия, Easy-RSA предоставляет простой и интуитивно понятный интерфейс для выполнения операций с сертификатами и ключами.

Поддержка Публичных и Закрытых Ключей: Easy-RSA поддерживает различные алгоритмы шифрования и типы ключей, включая RSA и ECDSA.

Совместимость с Различными Протоколами: Easy-RSA не ограничивается только OpenVPN. Его можно использовать с другими протоколами, такими как IPsec, SSL/TLS и другими, которые требуют управление ключами PKI.

В контексте вашей подготовки к позиции DevOps инженера и созданию собственного курса, знание и умение использовать Easy-RSA будет полезным, так как это часто используется в задачах, связанных с сетевой безопасностью и шифрованием.

sudo apt update
sudo apt install git

git clone https://github.com/OpenVPN/easy-rsa.git

sudo cp -r easy-rsa /etc/openvpn/

cd /etc/openvpn/easy-rsa/easyrsa3

sudo mv vars.example vars

set_var EASYRSA_REQ_COUNTRY     "RU"
set_var EASYRSA_REQ_PROVINCE    "Stavropol"
set_var EASYRSA_REQ_CITY        "Stavropol"
set_var EASYRSA_REQ_ORG         "SudoLabs"
set_var EASYRSA_REQ_EMAIL       "exzvor@gmail.com"
set_var EASYRSA_REQ_OU          "IT"

создание инфраструктуры центра сертификации
sudo ./easyrsa init-pki

Notice
------
'init-pki' complete; you may now create a CA or requests.

Your newly created PKI dir is:
* /etc/openvpn/easy-rsa/easyrsa3/pki

Using Easy-RSA configuration:
* undefined

генерация ключей (открытый/закрытый) sudo ./easyrsa build-ca nopass

запросит Common Name (eg: your user, host, or server name) [Easy-RSA CA]:   жмем enter


создаем приватный/публичный ключ для openvpn сервера
sudo ./easyrsa build-server-full server nopass

генерируем приватный/публичный ключи для клиентов 
sudo ./easyrsa build-client-full client1 nopass

Генерация дополнительных ключей. Генерация ключа Диффи-Хеллмана
sudo ./easyrsa gen-dh

Генерация ключа аутентификации TLS
sudo openvpn --genkey secret pki/tls.key

перемещаем сертификаты и ключи в каталог openvpn mkdir /etc/openvpn/keys
cp /etc/openvpn/easy-rsa/easyrsa3/pki/ca.crt /etc/openvpn/keys/
cp /etc/openvpn/easy-rsa/easyrsa3/pki/dh.pem /etc/openvpn/keys/
cp /etc/openvpn/easy-rsa/easyrsa3/pki/tls.key /etc/openvpn/keys/
cp /etc/openvpn/easy-rsa/easyrsa3/pki/private/ca.key /etc/openvpn/keys/

Содержимое папки с ключами
root@test:/etc/openvpn/keys# ls
ca.crt  dh.pem  server.crt  server.key  tls.key

Конфигурация openvpn сервера
Переходим в конфиг cd /usr/share/doc/openvpn/examples/sample-config-files/

Перемещаем конфиг
mv server.conf /etc/openvpn/

Конфигурация файла
nano /etc/openvpn/server.conf

Изменяем:
ca keys/ca.crt
cert keys/server.crt
key keys/server.key  # This file should be kept secret

# Diffie hellman parameters.
# Generate your own with:
#   openssl dhparam -out dh2048.pem 2048
dh keys/dh.pem
server 172.16.1.0 255.255.255.0
push "route 192.168.1.0 255.255.255.0"
push "dhcp-option DNS 192.168.1.10"
tls-auth keys/tls.key 0 # This file is secret
comp-lzo
log         /var/log/openvpn/openvpn.log
log-append  /var/log/openvpn/openvpn.log

service openvpn@server start
systemctl status openvpn@server.service