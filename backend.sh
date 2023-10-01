log_file=/tmp/expense.log

echo install NodeJS repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash >>$log_file

echo install NodeJS
dnf install nodejs -y >>$log_file

echo copy Backend service file
cp backend.service /etc/systemd/system/backend.service >>$log_file


echo add application user
useradd expense >>$log_file

echo clean app content
rm-rf /app >>$log_file
mkdir /app

echo Downlaod App Content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >>$log_file
cd /app

echo extract app content
unzip /tmp/backend.zip >>$log_file
cd /app

echo download dependencies
npm install >>$log_file

echo start backend service
systemctl daemon-reload >>$log_file
systemctl enable backend >>$log_file
systemctl start backend >>$log_file

echo install mysql client
dnf install mysql -y >>$log_file

echo load schema
mysql -h m1.tanvi12online.net -uroot -pExpenseApp@1 < /app/schema/backend.sql >>$log_file