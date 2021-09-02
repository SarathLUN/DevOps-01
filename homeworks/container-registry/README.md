# Homework:

- build and push image to AWS ECR
- Deploy Nexus and push your docker images

---

# My Solutions:

- create AWS ECR

![ECR](Screen%20Shot%202021-09-02%20at%2011.03.30%20PM.png)

- login to registry via create a login script

```shell
AWS_ACCOUNT_ID="977529743287"
AWS_REGION="ap-southeast-1"

aws --region ${AWS_REGION} ecr get-login-password | docker login --password-stdin --username AWS "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"

```

- execute login script

```shell
./ECR-Login.sh
```

- output:

```shell
Login Succeeded
```

- tag our image to AWS ECR

```shell
docker build -t 977529743287.dkr.ecr.ap-southeast-1.amazonaws.com/my-golang-app .
```

- output:

```shell
[+] Building 1.9s (11/11) FINISHED
 => [internal] load build definition from Dockerfile                                           0.0s
 => => transferring dockerfile: 36B                                                            0.0s
 => [internal] load .dockerignore                                                              0.0s
 => => transferring context: 2B                                                                0.0s
 => [internal] load metadata for docker.io/library/golang:alpine                               0.0s
 => [internal] load build context                                                              0.0s
 => => transferring context: 4.64kB                                                            0.0s
 => [1/6] FROM docker.io/library/golang:alpine                                                 0.0s
 => CACHED [2/6] WORKDIR /go/src/app                                                           0.0s
 => [3/6] COPY . .                                                                             0.0s
 => [4/6] RUN go mod init                                                                      0.2s
 => [5/6] RUN go get -d -v ./...                                                               0.6s
 => [6/6] RUN go install -v ./...                                                              0.9s
 => exporting to image                                                                         0.0s
 => => exporting layers                                                                        0.0s
 => => writing image sha256:b2b468557e03fa33ab4d9506fb10d3e8af93e768366a048e711c9190bde5c53e   0.0s
 => => naming to 977529743287.dkr.ecr.ap-southeast-1.amazonaws.com/my-golang-app               0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

- list docker images

```shell
docker images
```

- output:

```shell
REPOSITORY                                                        TAG       IMAGE ID       CREATED              SIZE
977529743287.dkr.ecr.ap-southeast-1.amazonaws.com/my-golang-app   latest    b2b468557e03   About a minute ago   321MB
```

- push docker image to AWS ECR

```shell
docker push 977529743287.dkr.ecr.ap-southeast-1.amazonaws.com/my-golang-app
```

- output:

```shell
Using default tag: latest
The push refers to repository [977529743287.dkr.ecr.ap-southeast-1.amazonaws.com/my-golang-app]
6f7bf62d365a: Pushing [===========================================>       ]   5.31MB/6.138MB
70d8951d589f: Pushed
d1fbc79fd6d8: Pushed
633dd2d26011: Pushed
7bbbeff6a292: Pushed
b03670a74ef4: Pushed
e41a1e885e53: Pushing [==>                                                ]  12.69MB/309.1MB
c0ed5374a14a: Pushed
6d0c7e68c043: Pushed
bc276c40b172: Pushing [=================================>                 ]  3.699MB/5.595MB

```

- after push completed, we can check on ECR

![ECR image detail](Screen%20Shot%202021-09-03%20at%2012.53.15%20AM.png)
