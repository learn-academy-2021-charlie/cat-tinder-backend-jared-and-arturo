require 'rails_helper'

RSpec.describe "Cats", type: :request do
  cat_params = {
    cat: {
      name: 'Buster',
      age: 4,
      enjoys: 'Meow Mix, and plenty of sunshine'
    }
  }

  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(name: "Felix", age: 2, enjoys: "Walks in the park")
      get '/cats'
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it 'creates a cat' do
      post '/cats', params: cat_params
      new_cat = Cat.first
      expect(response). to have_http_status(200)
      expect(new_cat.name).to eq 'Buster'
    end
  end

  describe "PATCH /update" do
    it "updates a cat" do
      post '/cats', params: cat_params
      cat = Cat.first
      updated_cat_params = {
        cat: {
          name: 'Buster',
          age: 5,
          enjoys: 'Meow Mix, and plenty of sunshine'
        }
      }
      patch "/cats/#{cat.id}", params: updated_cat_params
      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.age).to eq 5
    end
  end

  describe "DELETE /destroy" do
    it "deletes a cat" do
      post '/cats', params: cat_params
      cat = Cat.first
      delete "/cats/#{cat.id}"
      expect(response).to have_http_status(200)
      cats = Cat.all
      expect(cats).to be_empty
    end
  end
  describe "PUT /create" do
    it "doesn't create a cat without a name" do
      cat_params = {
      cat: {
        age: 2,
        enjoys: 'walks in the park'
      }
    }
    post '/cats', params: cat_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
    end
  end
end