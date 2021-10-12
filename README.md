# Blog API

Ruby on Rails 6 course as API showing authentication via [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth).

This repository is part of the [Ruby on Rails 6 - Autenticação via API](https://www.youtube.com/watch?v=i6vul6MqylE&list=PLqsayW8DhUmsuvK17gwSI_rKbAlmxFIw5) on YouTube.

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      3.0.2
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.3.1
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      PostgreSQL
    </td>
  </tr>
</table>

## Configuration

```bash
git clone https://github.com/peimelo/blog_api.git
cd blog_api

# installation of dependencies
bundle install

# creation of database and tables
rails db:create
rails db:migrate
rails db:migrate RAILS_ENV=test

# run the project
rails s
```

The backend is available at `http://localhost:3000`.

## Configuration for Production

```bash
# delete the config/credentials.yml.enc file
rm config/credentials.yml.enc

# run the command to create credentials and master key (replace 'code' if you don't use VS Code)
EDITOR="code --wait" bin/rails credentials:edit
```

Add the information below in the [credentials](https://guides.rubyonrails.org/security.html#custom-credentials) to configure the email used by the Devise
gem (replace with the values ​​you want):

```yml
# ... your content above

gmail:
  user_name: your@email.com
  password: your_password
```

Save and close the `config/credentials.yml.enc` file.

If you want to use another email provider, change it in the file
`config/environments/production.rb`.

To configure `default_confirm_success_url`, change it in the file
`config/initializers/devise_token_auth.rb`.

To configure [CORS](https://github.com/cyu/rack-cors) `origins`, change it in the file
`config/initializers/cors.rb`.

## Tests

![Tests](https://github.com/peimelo/blog_api/actions/workflows/ruby.yml/badge.svg)

To run the tests:

```bash
bundle exec rspec
```
