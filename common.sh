log_file=/tmp/expense.log

download_and_extract() {
  echo download frontend code
  curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>$log_file
  cd /usr/share/nginx/html

  echo extracting Frontend code
  unzip /tmp/frontend.zip >>$log_file
}