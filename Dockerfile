# Set the base image to vivek77/jenkinsbot
FROM vivek77/jenkins_slack_bot

# File Author / Maintainer
MAINTAINER Vivek

# Update the repository sources list
RUN apt-get -yqq update

WORKDIR /root/bot

ENV SLACK_BOT_TOKEN xoxb-255729536196-532234696608-xLamTaFx1q5a0sqyBBjJsYuf
ENV CHATBOT_NAME jenkinsbot
ENV APPROVER_SLACK_NAME AFPRFCFPH
ENV JENKINS_URL http://jenkins.devops3.vlocity.xom.vloc-dev.com

COPY jenkins_bot_pickledb.py slack_cmd_process.py slack_message.py slackbot.py start_app.py start_bot.sh /root/bot/

RUN chmod -R 755 /root/bot

RUN pip3.5 install tinydb

RUN rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/apk/*

ENV PYTHONUNBUFFERED=0
CMD sh /root/bot/start_bot.sh