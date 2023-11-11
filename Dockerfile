FROM ubuntu:jammy-20230916

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
RUN apt update && apt install python3 python3-distutils libpython3.10 -y
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN apt install curl git -y
RUN echo '[global]' > /etc/pip.conf && echo 'index-url = https://mirrors.ustc.edu.cn/pypi/web/simple' >> /etc/pip.conf
RUN curl http://dl.few.gs/scripts/get-pip.py > get-pip.py && python3 get-pip.py

WORKDIR /root/privacyidea
RUN git clone https://github.com/privacyidea/privacyidea.git .
RUN git checkout tags/v3.9.1
RUN pip3 install -r requirements.txt

ADD uwsgi_py310_ubuntu_jammy_amd64 uwsgi.ini start.sh ./
RUN git submodule update --init --recursive
CMD ./start.sh
