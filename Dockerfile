FROM anasty17/mltb:latest

WORKDIR /usr/warish/app
RUN chmod 777 /usr/warish/app

RUN apt-get -qq update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -qq install -y tzdata aria2 python3 python3-pip \
    locales python3-lxml \
    curl pv jq \
    wget git zip unzip \
    p7zip-full p7zip-rar

RUN chmod +x aria.sh
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .

CMD ["bash", "start.sh"]
