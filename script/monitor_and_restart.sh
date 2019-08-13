#!/system/bin/sh


PATH=`pwd`/../src
cd $PATH
MAIL_RECIVER='395592722@qq.com'
MAIL_THEME='News-Reader Warning'
MAIL_CONTENT='The news-reader process has benn off-line just now.'

function send_mail()
{
	echo $MAIL_CONTENT | mail -s $MAIL_THEME $MAIL_RECIVER
}


while true
do
  pid=$( ps -ef | grep './app' | grep -v grep | awk '{print $2}')
  if [ -z $pid ]
    then
	if [ -f "./app" ]
	then
	    nohup ./app &
		send_mail
    fi
  fi
  sleep 120
done
