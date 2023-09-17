FROM python:3.8

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==2.3.3 uWSGI==2.0.15 requests==2.5.1 redis==4.3.4
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]