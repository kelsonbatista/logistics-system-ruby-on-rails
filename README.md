# About the project / *Sobre o projeto*

This is a delivery fleet management application for a carrier company, where the authorized user is able to register different modes of transport and corresponding vehicles, as well as a price list and deadlines. The application allows the user to request a freight quote according to the chosen mode, where the system calculates and returns the value with the delivery time. The system also allows the user to consult the status of quotations made, with no need to be authenticated in this case. Full stack app developed with Ruby on Rails technology, ORM Active Record and SQLite database, with numerous unit and system tests with RSPec and Capybara to ensure code quality.

---

*Este é um aplicativo de gerenciamento de frota de entrega de uma transportadora, onde o usuário autorizado é capaz de cadastrar diversas modalidades de transporte e veículos correspondentes, assim como tabela de preços e prazos. A aplicação permite ao usuário solicitar uma cotação de frete de acordo com a modalidade escolhida, onde o sistema calcula e retorna o valor com o prazo de entrega. O sistema também permite ao usuário consultar o status de cotações realizadas, não havendo necessidade de estar autenticado nesse caso. App full stack desenvolvido com a tecnologia Ruby on Rails, ORM Active Record e banco de dados SQLite, com inúmeros testes unitários e de sistema feito com RSpect e Capybara para garantir a qualidade do código.*

---
# Skills / *Habilidades*

  - Full Stack development / *Desenvolvimento Full Stack*
  - Ruby on Rails
  - ORM Active Record
  - User validation with Devise / *Validação de usuário com Devise*
  - Bootstrap
  - SQLite database / *Banco de dados SQLite*
  - RSpec / Capybara (tests)

---
# Layout

<img src="intro.gif" alt="Logistics App" />

---
# Resources and Technologies / *Recursos e Tecnologias*

  - Ruby 3.1.1
  - Rails 7.0.4
  - SQLite 1.4
  - Puma 5.0
  - Rails-i18n
  - Devise
  - Chartkick
  - Bootstrap (link)
  - Font Awesome 6.2.1
  - RSpect-rails
  - Capybara

---
# Running tests / *Executando testes*

- All tests - command:        rspec -f d
- Transport modes - command:  rspec -f d ./spec/system/modes
- Vehicles - command:         rspec -f d ./spec/system/vehicles
- Prices - command:           rspec -f d ./spec/system/prices
- Deadlines - command:        rspec -f d ./spec/system/deadlines

---
# Installation / *Instalação*

  1. Clone the respository / *Clone o repositório*
  ```bash
  git clone git@github.com:kelsonbatista/logistics-system-ruby-on-rails.git
  ```
  2. Install dependencies / *Instale as dependências*
  ```bash
  bundle install
  ```
  3. Run migrations / *Execute as migrações*
  ```bash
  rails db:migrate
  ```
  4. Run seeds / *Execute os seeds*
  ```bash
  rails db:seed
  ```
  5. Initialize server / *Inicie o servidor*
  ```bash
  rails s
  ```
  6. Access the system / *Acesse o sistema*
  ```bash
  http://localhost:3000
  ```
  ---
