# Muffin Rails

Muffin est un site destiné aux étudiants de 42 afin d'améliorer les échanges, l'organisation et le partage au sein de la communauté.
Muffin Rails est une nouvelle fournée pour encore plus de saveur.

## Ruby on Rails

Cette application requiert:

- Ruby 2.1.3
- Rails 4.1.6
- Postgresql
- RVM (Recommandé)

En savoir plus sur
- [L'installation de Rails](http://railsapps.github.io/installing-rails.html)
- [L'installation de Postgresql](http://www.postgresql.org/download/)
- [L'installation de RVM](http://rvm.io/rvm/install)

## Getting Started

Pour faire fonctionner l'application, il est nécessaire que vous possédiez `database.yml` et `secrets.yml`.

### Installation

- Ouvrez votre Terminal.

- Clônez le dépôt sur votre machine.
```bash
$ git clone https://github.com/WeAreMuffin/Muffin-rails.git
$ cd Muffin-rails
```

> $ à gauche représente le prompt

- Installez les dépendances avec `bundle`.
```bash
$ bundle install
```

- Créez votre `database.yml`
```yml
development:
  adapter:  postgresql
  host:     localhost
  encoding: unicode
  database: <database_name>
  pool:     5
  username: <username>
  password: <password>
  template: template0

test:
  adapter:  postgresql
  host:     localhost
  encoding: unicode
  database: <database_name>
  pool:     5
  username: <username>
  password: <password>
  template: template0

staging:
  adapter:  postgresql
  host:     localhost
  encoding: unicode
  database: <database_name>
  pool:     5
  username: <username>
  password: <password>
  template: template0

production:
  adapter:  postgresql
  host:     localhost
  encoding: unicode
  database: <database_name>
  pool:     5
  username: <username>
  password: <password>
  template: template0

```

> Remplacez `<database_name>`, `<username>` et `<password>` respectivement par votre username postgres et votre mot de passe postgres.

- Créez votre `secrets.yml`

```yml
development:
  admin_first_name: <user_firstname>
  admin_last_name: <user_lastname>
  admin_email: <user_email>
  admin_password: <user_password>
  email_provider_username: <%= ENV["gmail_username"] %>
  email_provider_password: <%= ENV["gmail_password"] %>
  domain_name: example.com
  secret_key_base: <secret_key>

test:
  domain_name: example.com
  secret_key_base: <secret_key>

staging:
  admin_first_name: <%= ENV['admin_first_name_staging'] %>
  admin_last_name: <%= ENV['admin_last_name_staging'] %>
  admin_email: <%= ENV['admin_email_staging'] %>
  admin_password: <%= ENV['admin_password_staging'] %>
  email_provider_username: <%= ENV['email_username_staging'] %>
  email_provider_password: <%= ENV['email_password_staging'] %>
  domain_name: <%= ENV['domain_name_staging'] %>
  secret_key_base: <%= ENV['secret_key_base_staging'] %>

production:
  admin_first_name: <%= ENV["admin_first_name"] %>
  admin_last_name: <%= ENV["admin_last_name"] %>
  admin_email: <%= ENV["admin_email"] %>
  admin_password: <%= ENV["admin_password"] %>
  email_provider_username: <%= ENV["email_username"] %>
  email_provider_password: <%= ENV["email_password"] %>
  domain_name: <%= ENV["domain_name"] %>
  secret_key_base: <%= ENV["secret_key_base"] %>

```

> Remplacez les champs par les valeurs que vous souhaitez.
> Pour générer une `secret_key`, il vous suffit de faire `$ rake secret` et de copier le resultat à la place de `<secret_key>`.

- Le projet utilise la gem `Figaro` vous pouvez donc définir des variables d'environnement pour chaque environnement dans `application.yml`
```yml
development:
  gmail_username: <gmail_email>
  gmail_password: <gmail_password>

staging:
  admin_first_name_staging: <admin_user_first_name_for_staging>
  admin_last_name_staging: <admin_user_last_name_for_staging>
  admin_email_staging: <admin_email_for_staging>
  admin_password_staging: <admin_password_for_staging>
  email_username_staging: <email_username_for_staging>
  email_password_staging: <email_password_for_staging>
  domain_name_staging: <domain_name_for_staging>
  secret_key_base_staging: <secret_key_for_staging>

production:
  admin_first_name: <admin_user_first_name_for_production>
  admin_last_name: <admin_user_last_name_for_production>
  admin_email: <admin_email_for_production>
  admin_password: <admin_password_for_production>
  email_username: <email_username_for_production>
  email_password: <email_password_for_production>
  domain_name: <domain_name_for_production>
  secret_key_base: <secret_key_for_production>
```

- Créez la base de données
```bash
$ rake db:create db:migrate db:seed
```

- Pour finir, il vous suffit de lancer le serveur
```bash
$ rails s
```

##### Remarques

- Les fichiers de configuration (*.yml) ne doivent pas être présent sur le dépôt pour des raisons de sécurité.
-  C'est pourquoi des exemples vous sont proposés ci-dessus.
- Lorsque vous souhaitez modifier les fichiers de configuration (*.yml), il faudra stopper votre serveur rails puis
spring `$ spring stop` et relancez le serveur.

> Pensez à copier `database.yml`, `secrets.yml` et `application.yml` en dehors de votre clone pour ne pas avoir à les
refaire.

## Test unitaire

### Guard

## Configuration serveur

### Paquets nécessaires
- curl               - Utilitaire HTTP, utliser pour installer rvm par exemple
- git                - Besoin de git pour le déploiement
- postgresql         - Base de données utilisée pour le projet
- postgresql-contrib - Requis par la gem postgres
- libpq-dev          - Header pour la gem postgres
- build-essential    - Requis pour compiler des gems natives
- zlib1g-dev         - Gzip
- libssl-dev         - Si vous souhaitez utiliser le protocole SSL
- libreadline-dev    - Dépendance Rails
- libyaml-dev        - YAML support
- libxml2-dev        - XML support
- libxslt1-dev       - XML support extension
- nodejs             - JS
- nginx              - Serveur

### Nginx

### Unicorn

### Capistrano

## Déploiement

## Contribution

## Credits

Cette application a été générée avec [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
crée par [RailsApps Project](http://railsapps.github.io/).

## License
