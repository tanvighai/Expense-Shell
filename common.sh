log_file=/tmp/expense.log

download_and_extract() {
  echo download $component code
  curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >>$log_file


  echo extracting Frontend code
  unzip /tmp/$component.zip >>$log_file
}