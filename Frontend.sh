source common.sh
component=frontend


echo installing Nginx
dnf install nginx -y &>>$log_file


if [$? -eq 0];then
echo SUCCESS
else
  echo FAIL
fi
echo placing expense confif file in Ngnix
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
if [$? -eq 0];then
echo SUCCESS
else
  echo FAIL
fi


echo removing old Nginx content
rm -rf /usr/share/nginx/html/* &>>$log_file
if [$? -eq 0];then
echo SUCCESS
else
  echo FAIL
fi
cd /usr/share/nginx/html
download_and_extract
if [$? -eq 0];then
echo SUCCESS
else
  echo FAILED
fi
echo starting Ngnix service
systemctl enable nginx &>>$log_file
if [$? -eq 0];then
echo SUCCESS
else
  echo FAIL
fi
systemctl restart nginx &>>$log_file

if [$? -eq 0];then
echo SUCCESS
else
  echo FAIL
fi