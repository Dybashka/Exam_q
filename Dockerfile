FROM ubuntu

COPY . /home/ex
WORKDIR /home/ex

ENV VIRTUAL_ENV=/opt/venv
RUN apt-get update && apt-get install -y python3 && apt install -y python3.10-venv && python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip3 install -r requirements.txt
RUN flake8 --exit-zero app.py && bandit --exit-zero  my_app.py

CMD ["python3", "my_app.py"]
