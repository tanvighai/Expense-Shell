echo installing Nginx
dnf install nginx -y >>/tmp/expense.log

echo placing expense confif file in Ngnix
cp expense.conf /etc/nginx/default.d/expense.conf >>/tmp/expense.log



echo removing old Nginx content
rm -rf /usr/share/nginx/html/* >>/tmp/expense.log

echo download frontend code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>/tmp/expense.log
cd /usr/share/nginx/html

echo extracting Frontend code
unzip /tmp/frontend.zip >>/tmp/expense.log

echo starting Ngnix service
systemctl enable nginx >>/tmp/expense.log
systemctl restart nginx >>/tmp/expense.log