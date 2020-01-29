### Requirements - 
- docker (19.03.x)
- terreform (v0.12.x, provider.google v3.5.0)

## Craete frontend and redis clusters on gcp 

```
# .json file can be created from the service account from GCP
export GOOGLE_CLOUD_KEYFILE_JSON=/path/to/service/account/client-details.json
terraform plan
terraform apply
```

## Compose for frondend and redis
#Open
```
cd app
vim docker-compose.yml
```

#Change 
```
    - REDIS_HOST='host-ip'
    - REDIS_PORT='host-port'
```

#Run compose
```
docker-compose up --build
```
