FROM python:3.9-slim-buster
# add a user t tighten security around the image
RUN useradd -u 1000 flask
# create the work directory
RUN mkdir -p /home/app
# move to the work directory
WORKDIR /home/app
# copy the requirements.txt to the work directory 
COPY requirements.txt /home/app/requirements.txt

WORKDIR /home/app
# create a virtual environment for dependencies and activate it

RUN  python3.9 -m pip install -r requirements.txt
# install dependencies
#RUN python3 -m pip install -r requirements.txt
# expose port 8000 as it is in the app.py file
EXPOSE 8000
# copy the secrets to a directory called secrets in the image
COPY smooth /home/smooth
COPY smooth /home/app/smooth
# copy all other content from the host working directory
COPY . /home/app
# switch to the newly created user
# USER flask
ENV FLASK_RUN_HOST=0.0.0.0
# run the application
CMD [ "python3.9", "app.py" ]