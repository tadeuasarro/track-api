require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe 'Expenditures', type: :request do
  DatabaseCleaner.clean

  describe 'request all of the expenditures' do
    it 'expects to return 200' do
      get '/expenditures'
      expect(response.status).to equal(200)
    end
  end

  describe 'create a expenditure' do
    DatabaseCleaner.clean

    let(:expense) { Expense.create(name: 'Grocery') }

    it 'expects to return 200' do
      post '/users', params: { user: { username: 'Maurício', target: 3000 } }
      expect(response.status).to equal(200)

      post '/expenditures',
           params: {
             expenditure: {
               category: 1,
               value: 1000,
               date: '2020/03/01',
               description: 'This is just some string',
               user_id: 1
             }
           }
      expect(response.status).to equal(200)
    end
  end
end
