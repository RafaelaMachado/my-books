# MyBooks

Um sistema onde posso gerenciar minha própria biblioteca e disponibilizar uma listagem dos meus livros para todos vizualizarem.

Esta aplicação foi feita usando Ruby on Rails 6 com algumas gems legais!

Para verificar o aplicativo: (add link do heroku)

# Pré-requisitos

Utilizamos Docker :)

Docker é uma tecnologia de software que fornece contêineres que fornece uma camada adicional de abstração e automação de virtualização de nível de sistema operacional no Windows e no Linux.

Instalação do Docker

https://docs.docker.com/install/linux/docker-ce/ubuntu/

Instalação do docker-compose

https://docs.docker.com/compose/install/


## Rodando ambiente com Docker

Acesse o diretório em que o repositório foi clonado através do terminal e
execute os comandos:
 - `docker-compose build` para compilar imagens, criar containers etc.
 - `docker-compose up` para instalar as `gemas`, criar banco de dados e inicializar
 o servidor

 ## Populando o banco de dados para os dados iniciais

 `docker-compose run --rm app bundle exec rails db:seed`

### Iniciando e finalizando containers
Para inicializar execute o comando `docker-compose start` e
para finalizar `docker-compose stop`

### Acessando o container rails

Execute o comando `docker-compose run --rm app`

### Acessando o console

Execute o comando `docker-compose run --rm app bundle exec rails c`

### Acessando o terminal do container

Execute o comando `docker-compose exec app bash`

### Visualizando o log do servidor

Execute o comando `docker-compose logs -f --tail=100 rails`

### Se quiser rodar outros comandos
Será necessário executar o comando completo `bundle exec ...`


## Uma breve lista das ferramentas utilizadas:

* Ruby 2.7

* Rails 6

* Bootstrap

* Rubocop

* Postgresql

* FriendlyId é um add-on para o Active Record do Ruby que permite substituir ids em seus URLs por strings

* Ransack é uma gem para facilitar a criação de formulários de busca, neste projeto ela nos ajuda com a ordenação e pesquisa nas listagens.

* Responders, um conjunto de modulos que nos ajuda a enxugar a app, removendo por exemplo, coisas como definições de flash messages dos controllers

* Devise

* Rubocop


## Meus próximos passos

* Melhorar arquitetura de dados

* Melhorar UI e UX

* Adicionar cobertura de testes Automatizados

* Refatorar aplicação, até o momento existem muitas views com trechos de códigos repetidos

* Github Actions / CicleCI

* Implementar tratamento de erros

* Permitir que apenas Admins possam criam novos usuários Admins

* Implementar busca de livros a partir do nome do autor
