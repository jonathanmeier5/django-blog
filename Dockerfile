FROM python:3.7
MAINTAINER Jonathan Meier <jonathan.w.meier@gmail.com>

ENV PROJECT_ROOT=/usr/local/src/django-blog/
ENV APP_DIR ${PROJECT_ROOT}/src

RUN pip install poetry

WORKDIR ${PROJECT_ROOT}

COPY pyproject.toml poetry.lock ${PROJECT_ROOT}/

RUN poetry config virtualenvs.create false
RUN poetry install

COPY files/ /
RUN chmod +x /usr/local/bin/*

COPY ./src/ ${APP_DIR}/

WORKDIR ${APP_DIR}

ENV PYTHONUNBUFFERED=1

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
