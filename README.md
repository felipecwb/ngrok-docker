# felipecwb/ngrok

Checkout on [docker hub](https://hub.docker.com/r/felipecwb/ngrok).  

Export your internal applications with [ngrok](https://ngrok.com).  

You can read more on [ngrok docs](https://ngrok.com/docs)  

This docker image uses ngrok user as default user.  

The configuration file is encountered: `/home/ngrok/.ngrok2/ngrok.yml`  
You just need to overwrite to get the new configurations.  

The entrypoint is the `ngrok` binary.  


### Examples:

**`docker run`:**
```sh
docker run --rm -it --link app -p 4040:4040 felipecwb/ngrok:latest http app:80
```

**`docker-compose.yml`:**
```yml
version: "3.7"

services:
    app:
        image: myself/myapp:latest
        ports:
            - 80:8080

    ngrok:
        image: felipecwb/ngrok:latest
        command: 'http app:8080'
        ports:
            - 4040:4040
```

