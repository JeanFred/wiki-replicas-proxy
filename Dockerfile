FROM alpine

RUN apk add --no-cache openssh-client bash

CMD rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && \
ssh \
-v \
-o StrictHostKeyChecking=no \
-N $TUNNEL_HOST \
-L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
&& while true; do sleep 30; done;

EXPOSE 1-65535
