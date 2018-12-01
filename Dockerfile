FROM ubuntu:bionic-20181112

RUN apt-get -y update && apt-get -y install curl gnupg

RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y install google-chrome-stable

COPY fonts/ /usr/local/share/fonts/
RUN fc-cache -svf

CMD ["/usr/bin/google-chrome", "--disable-gpu", "--headless", "--no-sandbox", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222", "--user-data-dir=/data", "--disable-dev-shm-usage"]
