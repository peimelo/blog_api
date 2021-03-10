# Blog API

Ruby on Rails 6 course as API showing authentication via [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth).

This repository is part of the [Ruby on Rails 6 - Autenticação via API](https://www.youtube.com/watch?v=i6vul6MqylE&list=PLqsayW8DhUmsuvK17gwSI_rKbAlmxFIw5) on YouTube.

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      3.0.0
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.3
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      PostgreSQL
    </td>
  </tr>
</table>

## Initial settings to run the project

```bash
# clone the project
git clone https://github.com/peimelo/blog_api.git

# enter the cloned directory
cd blog_api

# install Ruby on Rails dependencies
bundle install

# create the development and test databases
rails db:create

# create the tables
rails db:migrate

# run the project
rails s
```

The backend is available at `http://localhost:3000`.
