# create database for wordpress
echo "mysql login test ..."
echo "please your mysql's root username (default is 'root') ..."
read ROOT_USERNAME

echo "please your mysql's root password"
MYSQL="mysql -u ${ROOT_USERNAME} -p${PASSWD}"
$MYSQL << EOF
\s;
EOF

echo "create databases..."
echo "please name of new database\n"
read NEW_DATABASE_NAME

echo "please username of ${NEW_DATABASE_NAME}\n"
read NEW_DATABASE_USER

echo "please password of ${NEW_DATABASE_USER}\n"
read NEW_DATABASE_PASSWD

echo "please once more your mysql's root password"
$MYSQL << EOF
create database ${NEW_DATABASE_NAME};
grant all privileges on ${NEW_DATABASE_NAME}.* to ${NEW_DATABASE_USER}@localhost identified by '${NEW_DATABASE_PASSWD}';
flush privileges;
EOF


# check new use and new database
echo "\n\n"
echo "test new mysql user and new database"
echo "please check 'Current user'"
mysql -u ${NEW_DATABASE_USER} -p${NEW_DATABASE_PASSWD} -e 'status'

echo "please check new database user have ${NEW_DATABASE_NAME}"
mysql -u ${NEW_DATABASE_USER} -p${NEW_DATABASE_PASSWD} -e 'show databases;'


echo "\n\nALL wordpress setting is complete!"
echo "please access your host."
