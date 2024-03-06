FROM python:3.10 
# Install pipenv 
RUN pip3 install poetry 
# Setting the working directory 
WORKDIR /app 
# Install pipenv dependencies 
COPY pyproject.toml ./ 
RUN poetry install --no-root 
# Copying our application into the container 
COPY todo todo 
# Running our application 
CMD ["poetry run flask --app todo run --host 0.0.0.0 --port 6400"]