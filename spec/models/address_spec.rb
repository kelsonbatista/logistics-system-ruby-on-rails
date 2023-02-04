require 'rails_helper'

RSpec.describe Address, type: :model do  
  describe "#valid?" do
    context 'presence' do
      it "false if address_one is empty" do
        #Arrange
        address = Address.new(person: "recipient", address_one: "", address_two: "Bela Vista", 
                                  city: "São Paulo", state: "SP", zip: "10000-101")
        #Act
        result = address.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if city is empty" do
        #Arrange
        address = Address.new(person: "recipient", address_one: "Av Paulista, 1000", address_two: "Bela Vista", 
                                  city: "", state: "SP", zip: "10000-101")
        #Act
        result = address.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if state is empty" do
        #Arrange
        address = Address.new(person: "recipient", address_one: "Av Paulista, 1000", address_two: "Bela Vista", 
                                  city: "São Paulo", state: "", zip: "10000-101")
        #Act
        result = address.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if cep is empty" do
        #Arrange
        address = Address.new(person: "recipient", address_one: "Av Paulista, 1000", address_two: "Bela Vista", 
                                  city: "São Paulo", state: "SP", zip: "")
        #Act
        result = address.valid?
        #Assert
        expect(result).to eq(false)
      end
    end
  end
end