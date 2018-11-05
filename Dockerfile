FROM python:2.7.15
ENV PYTHONUNBUFFERED 1
RUN mkdir /django-ribbit
WORKDIR /django-ribbit
ADD .  /django-ribbit
RUN pip install -r requirements.txt 
RUN python manage.py syncdb --noinput && python manage.py migrate ribbit_app
EXPOSE 8000
STOPSIGNAL SIGINT
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver","0.0.0.0:8000"]