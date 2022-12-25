require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe "with a proper Brewery" do
    let(:brewery1){ Brewery.create name:"Brewery 1", year: 2000}

    it "beer can be created with valid name, style and brewery" do
      beer = Beer.create name: 'testbeer', style: 'lager', brewery:brewery1

      expect(beer).to be_valid
      expect(Beer.count).to eq(1)
    end
    it "beer cant be created with invalid name" do
      beer = Beer.create style: 'lager', brewery:brewery1

      expect(beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end
    it "beer cant be create with invalid style" do
      beer = Beer.create name: 'testbeer', brewery:brewery1

      expect(beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end
  end
end
