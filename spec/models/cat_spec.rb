require 'rails_helper'

RSpec.describe Cat, type: :model do
    it "should validate name" do
        cat = Cat.create 
        expect(cat.errors[:name]).to_not be_empty
    end

    it "should validate age" do
    cat = Cat.create name: 'jake', enjoys: 'sleeping'
    expect(cat.errors[:age]).to_not be_empty
    end
    
    it "should validate enjoys" do
        cat = Cat.create name: 'suzan', age: '99', enjoys: 'unsure'
        expect(cat.errors[:enjoys]).to_not be_empty
    end
end 

