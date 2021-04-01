FROM danjellz/http-server

# set the timezone
RUN apk add tzdata
ENV TZ="America/Los_Angeles"
RUN ls /usr/share/zoneinfo && \
  cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
  echo "America/New_York" > /etc/timezone

# this hack invalidates the cache (see https://github.com/caprover/caprover/issues/381)
ADD https://www.google.com /time.now

WORKDIR /extremetoaster
COPY index.html node_modules /extremetoaster/

EXPOSE 8080

CMD [ "http-server", "/extremetoaster", "-p", "8080" ]