FROM alpine

RUN apk add --no-cache openssh-client

EXPOSE 3306

CMD "rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && ssh -o StrictHostKeyChecking=no -vv -i /root/ssh/key -L 3306:$TABLE.analytics.db.svc.eqiad.wmflabs:3306 tools-dev.wmflabs.org"
