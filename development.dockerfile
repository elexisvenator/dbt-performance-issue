FROM python:3.6

RUN apt-get update



RUN apt-get install -y python-pip netcat
RUN apt-get install -y python-dev python3-dev

RUN pip install --upgrade pip

RUN pip3 --no-cache-dir install dbt==0.11.0 

#Create a user for PageUpDataPipeline and assume this user.
RUN useradd -ms /bin/bash local


RUN mkdir -p /home/local/.dbt
COPY ./container_assets/profiles.yml /home/local/.dbt


COPY ./container_assets/*.sh /home/local/
RUN chmod +x /home/local/*.sh 


#Grant user permissions and switch to that user
RUN chown -R  local /home/local
USER local
WORKDIR /home/local
