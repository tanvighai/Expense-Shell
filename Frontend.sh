source common.sh
component=frontend


echo installing Nginx
dnf install nginx -y &>>$log_file
echo$?
echo placing expense confif file in Ngnix
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
echo$?


echo removing old Nginx content
rm -rf /usr/share/nginx/html/* &>>$log_file
echo$?
cd /usr/share/nginx/html
download_and_extract
echo$?
echo starting Ngnix service
systemctl enable nginx &>>$log_file
echo$?
systemctl restart nginx &>>$log_file
echo$?