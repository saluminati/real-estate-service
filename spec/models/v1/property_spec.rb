require 'rails_helper'

RSpec.describe V1::Property, type: :model do
    before(:all) do
        @property = FactoryBot.build(:v1_property)
    end

    it 'creates a valid property' do
        @property.valid?
        expect(@property).to be_valid
    end

    it 'does not validate a property if user_id is not present' do
        @property.user_id = nil
        @property.valid?
        expect(@property.errors[:user_id]).to include("can't be blank")
    end

    it 'does not validate a property if user_id is not a valid integer' do
        @property.user_id = 'aasdasd'
        @property.valid?
        expect(@property.errors[:user_id]).to include("is not a number")
    end

    it 'does not validate a property if title is not present' do
        @property.title = nil
        @property.valid?
        expect(@property.errors[:title]).to include("can't be blank")
    end

    it 'does not validate a property if description is not present' do
        @property.description = nil
        @property.valid?
        expect(@property.errors[:description]).to include("can't be blank")
    end

    it 'does not validate a property if street_address is not present' do
        @property.street_address = nil
        @property.valid?
        expect(@property.errors[:street_address]).to include("can't be blank")
    end

    it 'does not validate a property if post_code is not present' do
        @property.post_code = nil
        @property.valid?
        expect(@property.errors[:post_code]).to include("can't be blank")
    end

    it 'does not validate a property if state is not present' do
        @property.state = nil
        @property.valid?
        expect(@property.errors[:state]).to include("can't be blank")
    end

    it 'does not validate a property if title length is shorter than minimum length' do
        @property.title = 'abc'
        @property.valid?
        expect(@property.errors[:title]).to include("is too short (minimum is 5 characters)")
    end

    it 'does not validate a property if title length is greater than minimum length' do
        @property.title = Faker::String.random(51)
        @property.valid?
        expect(@property.errors[:title]).to include("is too long (maximum is 50 characters)")
    end

    it 'does not validate a property if description length is shorter than minimum length' do
        @property.description = 'abc'
        @property.valid?
        expect(@property.errors[:description]).to include("is too short (minimum is 20 characters)")
    end

    it 'does not validate a property if description length is greater than minimum length' do
        @property.description = Faker::String.random(1001)
        @property.valid?
        expect(@property.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end

    it 'does not validate a property if street_address length is shorter than minimum length' do
        @property.street_address = 'abc'
        @property.valid?
        expect(@property.errors[:street_address]).to include("is too short (minimum is 10 characters)")
    end

    it 'does not validate a property if street_address length is greater than minimum length' do
        @property.street_address = Faker::String.random(250)
        @property.valid?
        expect(@property.errors[:street_address]).to include("is too long (maximum is 200 characters)")
    end

    it 'does not validate a property if state length is shorter than minimum length' do
        @property.state = 'vc'
        @property.valid?
        expect(@property.errors[:state]).to include("is too short (minimum is 3 characters)")
    end

    it 'does not validate a property if state length is greater than minimum length' do
        @property.state = Faker::String.random(21)
        @property.valid?
        expect(@property.errors[:state]).to include("is too long (maximum is 20 characters)")
    end

    it 'does not validate a property if post_code length is not exactly 4' do
        @property.state = '325'
        @property.valid?
        expect(@property.errors[:post_code]).to include("is the wrong length (should be 4 characters)")
    end


end
