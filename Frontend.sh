source common.sh



echo installing Nginx
dnf install nginx -y >>$log_file

echo placing expense confif file in Ngnix
cp expense.conf /etc/nginx/default.d/expense.conf >>$log_file



echo removing old Nginx content
rm -rf /usr/share/nginx/html/* >>$log_file


download_and_extract
echo starting Ngnix service
systemctl enable nginx >>$log_file
systemctl restart nginx >>$log_file