log_file=/tmp/expense.log

download_and_extract() {
  echo download $component code
  curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >>$log_file
  echo $?

  echo extracting Frontend code
  unzip /tmp/$component.zip >>$log_file

  echo $?
}


stat_check() {
  if [$? -eq 0];then
   echo -e "\e[32mSUCCESS\e[0m"
  else
   echo -e "\e[31mFAILURE\e[0m”
  fi
}
