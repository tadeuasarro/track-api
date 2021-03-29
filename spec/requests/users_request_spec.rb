require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe 'Users', type: :request do
  describe 'request a single user' do
    DatabaseCleaner.clean
    let(:test_user) { User.create(username: 'Maria', target: 3000) }

    it 'expects to return 200' do
      get '/users/Maria'
      expect(response.status).to equal(404)
    end
  end

  describe 'create a user' do
    DatabaseCleaner.clean

    it 'expects to return 200' do
      post '/users', params: { user: { username: 'Tadeu', target: 1000 } }
      expect(response.status).to equal(200)
    end

    it 'expects not to return 200 1' do
      post '/users', params: { user: { username: 'Tadeu' } }
      expect(response.status).not_to equal(200)
    end

    it 'expects not to return 200 2' do
      post '/users', params: { user: { target: 1000 } }
      expect(response.status).not_to equal(200)
    end
  end

  describe 'update a user' do
    DatabaseCleaner.clean
    user = User.new(username: 'Rogerio', target: 3000)
    user.save

    it 'expects to return 200' do
      put '/users/1', params: { target: 1000 }
      expect(response.status).to equal(200)
    end
  end
end
