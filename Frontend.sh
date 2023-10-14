source common.sh
component=frontend


echo installing Nginx
dnf install nginx -y &>>$log_file


stat_check()
echo placing expense confif file in Ngnix
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
stat_check()

echo removing old Nginx content
rm -rf /usr/share/nginx/html/* &>>$log_file
stat_check()
cd /usr/share/nginx/html
download_and_extract
stat_check()
echo starting Ngnix service
systemctl enable nginx &>>$log_file
stat_check()
systemctl restart nginx &>>$log_file

stat_check()