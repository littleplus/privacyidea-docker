# Privacyidea Docker容器化部署
## 制作镜像
```
docker build . -t priacyidea:v3.9.1
```

## 运行
```
docker run --name privacyidea -it -d -v /etc/privacyidea:/etc/privacyidea -p 8080:8080 priacyidea:v3.9.1
# you may need to create admin after initialize
docker exec -it privacyidea ./pi-manage admin add <username>
```
