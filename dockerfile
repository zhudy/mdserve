FROM python:3.8-slim
RUN sed -i "s@http://deb.debian.org@https://mirrors.163.com@g" /etc/apt/sources.list
RUN apt-get update && apt-get install git gcc -y

# COPY ./startup.sh /usr/bin/startup.sh
# RUN chmod +x /usr/bin/startup.sh
RUN pip install --upgrade mdserve -i https://pypi.org/simple/
# ENV GIT_URL=https://github.com/openjw/open.git
# RUN git clone ${GIT_URL}
RUN mkdir -p /usr/share/mdserve
WORKDIR /usr/share/mdserve
EXPOSE 8080 8080
CMD ["mdserve"]
