# Near Places Mesa

[![Build Status](https://travis-ci.org/Jaicke/near-places-mesa.svg?branch=master)](https://travis-ci.org/Jaicke/near-places-mesa)

## Aplicação

Aplicação desenvolvida com a finalidade de listar locais cadastrados pelos usuários por ordem alfabética ou lugares próximos.

## Ferramentas utilizadas

- [Geolocation](https://github.com/alexreisner/geocoder)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://github.com/docker/compose)
- [Travis CI](https://travis-ci.org/)
- [Heroku](https://www.heroku.com/)
- [Postman](https://www.postman.com/)

## Documentação
Veja [documentação](https://www.postman.com/) para informações de funcionamento.

## Testando aplicação

### Pré-requisitos
- Docker instalado, veja como instalar [aqui](https://docs.docker.com/).
- Docker compose instalado, veja como instalar [aqui](https://docs.docker.com/compose/install/).

#### Variável de ambiente

Para que o serviço de geolocalização funcione, deve-se primeiro adicionar a [API key](https://developers.google.com/maps/documentation/geolocation/get-api-key?hl=pt-br) às variáveis de ambiente. Então adicione um arquivo ```.env``` na raiz do projeto e a adicione da seguinte maneira:
```
GEOCODING_API_KEY=SUA_API_KEY
```
### Preparando aplicação

- ``` docker-compose build ```
- ``` docker-compose run web rails db:create ```
- ``` docker-compose run web rails db:migrate ```

### Executando testes

- ``` docker-compose run web rspec ```

### Executando servidor da aplicação

- ``` docker-compose up ```

Dessa forma é possivel acessar a aplicação em ```localhost:3000```



