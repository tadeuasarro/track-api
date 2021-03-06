# Final Capstone

#### Hello there! Welcome to Personal Expenses, your personal expenses managing API. The purpose of this project is to help people managing their expenses and achieving their personal financial goals.

##### This is a back-end API, which provides data to [this application](https://github.com/tadeuasarro/track-app/tree/milestone7) that I developed.

#### Features
- Index all expenditures
- Create new expenditures
- Create users
- Login with a user username
- Update the user target
- Delete expenditures

#### URL for HTTP requests
- [Heroku](https://enigmatic-everglades-24941.herokuapp.com/)

## Built With
- [Rails](https://rubyonrails.org/)

## Gems
- [Bullet](https://rubygems.org/gems/bullet)
- [Byebug](https://rubygems.org/gems/byebug)
- [Capybara](https://rubygems.org/gems/capybara)
- [Database-cleaner](https://rubygems.org/gems/database_cleaner)
- [PG](https://rubygems.org/gems/pg)
- [Rack-cors](https://rubygems.org/gems/rack-cors)
- [Rails-controller-testing](https://rubygems.org/gems/rails-controller-testing)
- [RSpec-rails](https://rubygems.org/gems/rspec-rails)
- [Rubocop](https://rubygems.org/gems/rubocop)
- [Shoulda-matchers](https://rubygems.org/gems/shoulda-matchers)

## Getting started

### Setup

Clone the repo with

```
  https://github.com/tadeuasarro/track-api.git
```

Then run

```
  bundle install
```

Start server with:

```
  rails server
```

Follow the instructions in [this repo](https://github.com/tadeuasarro/track-app/tree/milestone7) to get started with the React application.

### Run tests

```
  rspec
```

### Using | Requests examples using JS

##### Create Expenditure
const url = `https://enigmatic-everglades-24941.herokuapp.com/expenditures`
const config = `{ mode: 'cors', method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ value: 1000, date: '2020/03/10', description: 'This is just some string', user_id: 1, expense_id: 1 }) }`

##### Index Expenditures
const url = `https://enigmatic-everglades-24941.herokuapp.com/expenditures?user_id=${user_id}`
const config = `{ mode: 'cors', method: 'GET', headers: { 'Content-Type': 'application/json' } }`

##### Delete Expenditure
const url = `https://enigmatic-everglades-24941.herokuapp.com/expenditures/${id}`
const config = `{ mode: 'cors', method: 'DELETE', headers: { 'Content-Type': 'application/json' } }`

##### Create Session
const url = `https://enigmatic-everglades-24941.herokuapp.com/users/${username}`
const config = `{ mode: 'cors', method: 'GET', headers: { 'Content-Type': 'application/json' } }`

##### Create User
const url = `https://enigmatic-everglades-24941.herokuapp.com/users`
const config = `{ mode: 'cors', method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ ${username} }) }`

##### Update User
const url = `https://enigmatic-everglades-24941.herokuapp.com/users/${id}`
const config = `{ mode: 'cors', method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ ${target} }) }`

##### Then just
fetch(url, config)

### Authors

👤 This is me:

- [Tadeu A Sarro](https://tadeuasarro.me)


### Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/tadeuasarro/track-api/issues)


### Show your support

Give a star if you like this project!

### Acknowledgments

- [Track-APP](https://github.com/tadeuasarro/track-app/tree/milestone7)
- [Microverse](https://www.microverse.org/)

### 📝 License

This project is MIT licensed.