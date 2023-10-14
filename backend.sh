log_file=/tmp/expense.log

component=backend
echo install NodeJS repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
stat_check()

echo install NodeJS
dnf install nodejs -y &>>$log_file
stat_check()
echo copy Backend service file
cp backend.service /etc/systemd/system/backend.service &>>$log_file
stat_check()

echo add application user
if expense &>>log_file

if [ $? -ne 0 ];then

useradd expense &>>$log_file

fi
echo clean app content
rm-rf /app &>>$log_file
mkdir /app
cd /app

download_and_extract
stat_check()

echo download dependencies
npm install &>>$log_file
stat_check()


echo start backend service
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file

stat_check()

echo install mysql client
dnf install mysql -y &>>$log_file
stat_check()

echo load schema
mysql -h m1.tanvi12online.net -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
stat_check()