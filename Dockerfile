FROM python:3.10
USER root

ENV USER egashira

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get -y install locales libpangocairo-1.0-0 libpango1.0-dev libsndfile1-dev ffmpeg\
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && pip install --upgrade pip \
    && pip install --upgrade setuptools

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

WORKDIR /home/${USER}/creative_ml
COPY my_requirements.txt ${PWD}
RUN pip install -r my_requirements.txt --no-dependencies
# USER ${USER}
