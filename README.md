## Пример работы с Dockerfile файлом 

 - Следует обратить внимание, что используется зеркало (dockerhub.timeweb.cloud), чтобы получить образ. Основной сайт временно недоступен.
 - После запуска выполняется  

### Сборка проекта 

 - переходим в окружение
```
source .venv/bin/activate
```

 - собираем образ из Dockerfile в текущей директории
```
docker build -t my-python-app .
```

 - запускаем контейнер
```
docker run --name dummy-web-server  -p 8083:8000 -d my-python-app:latest
```

 - выясняем, какой ID у контейнера dummy-web-server
```
docker ps 
```

 - подключаемся внутрь контроллера (указан ID=1d053871d539 из предыдущего шага)

```
docker exec -it 1d053871d539 bash
```


### Теперь внутри контейнера выполняем команды

 
 - Выполняем POST-запрос    
```
curl -d "foo=bar&bin=baz" http://localhost:8000
```
 - Получаем ответ указанный ниже 
``` html
<html><body><h1>POST!</h1></body></html>
```

 - Выполняем запрос шапки (HEAD) 

``` h
curl -I http://localhost:8000
```

 - Получаем ответ указанный ниже

``` html
HTTP/1.0 200 OK
Server: BaseHTTP/0.6 Python/3.14.0a7
Date: Sat, 19 Apr 2025 18:15:42 GMT
Content-type: text/html
```
