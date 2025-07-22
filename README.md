# atividade_2

 Criar Serviço com Interface + Implementação em http
Objetivo: Trabalhar com boas práticas de injeção de dependência, abstração de serviços e consumo de API.
Descrição:
Criar um contrato (interface) IUserService com um método Future<List<User>> getUsers().

Criar uma implementação concreta chamada UserServiceHttp, usando o pacote http.

Buscar uma lista de usuários do JSONPlaceholder.
https://jsonplaceholder.typicode.com/users

Criar o modelo User ex: (Nao precisa adicionar os outros parametros) 	"id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",


Exibir essa lista na UI com Observer.

Obs: os dados nao precisam ficar armazenados em lugar nenhum
