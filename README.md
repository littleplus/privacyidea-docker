## Build
```
docker build . -t priacyidea:v3.9.1
```

## Run
```
docker run -it -v /etc/privacyidea:/etc/privacyidea -p 8080:8080 priacyidea:v3.9.1
```
