log_file=/tmp/expense.log



echo installing Nginx
dnf install nginx -y >>log_file
echo placing expense confif file in Ngnix
cp expense.conf /etc/nginx/default.d/expense.conf >>log_file



echo removing old Nginx content
rm -rf /usr/share/nginx/html/* >>log_file

echo download frontend code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>log_file
cd /usr/share/nginx/html

echo extracting Frontend code
unzip /tmp/frontend.zip >>log_file

echo starting Ngnix service
systemctl enable nginx >>log_file
systemctl restart nginx >>log_file