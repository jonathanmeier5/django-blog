FROM python:3.7
MAINTAINER Jonathan Meier <jonathan.w.meier@gmail.com>

ENV PROJECT_ROOT=/usr/local/src/django-blog/

RUN pip install poetry

WORKDIR ${PROJECT_ROOT}

COPY pyproject.toml poetry.lock ${PROJECT_ROOT}/

RUN poetry config virtualenvs.create false
RUN poetry install
 
WORKDIR ${PROJECT_ROOT}/src

ENV PYTHONUNBUFFERED=1

CMD ["/bin/bash"]
