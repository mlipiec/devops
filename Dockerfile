FROM python:3

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}

USER appuser

ADD ./ ${APP_ROOT}
RUN chown -R appuser:appuser ${APP_ROOT}

RUN apt-get install curl && \
  curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
  && python3 get-pip.py

RUN pip3 install pipenv && \
    pipenv install --deploy --system

CMD [ "python", "./aplikacja.py" ]
