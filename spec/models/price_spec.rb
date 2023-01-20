require 'rails_helper'

RSpec.describe Price, type: :model do  
  describe "#valid?" do
    context 'presence' do
      before(:each) do
        #Arrange
        user = User.create!(
          name: "Usuario 1",
          email: "usuario1@email.com",
          password: '123456',
          role: "user"
        )
        
        for i in 1..3 do
          mode = Mode.create!(
            name: "Modalidade #{i}",
            min_distance: 10 * i,
            max_distance: 100 * i,
            min_weight: 1 * i,
            max_weight: 100 * i,
            fixed_fee: 50 * i,
            active: true
          )
        end
  
        login_as(user)
      end

      it "false if minimum weight is empty" do
        #Arrange
        price = Price.new(
          min_weight: '',
          max_weight: 10,
          price_per_km: 0.11,
          mode_id: 2
        )
        #Act
        result = price.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if maximum weight is empty" do
        #Arrange
        price = Price.new(
          min_weight: 5,
          max_weight: '',
          price_per_km: 0.11,
          mode_id: 2
        )
        #Act
        result = price.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if price per km is empty" do
        #Arrange
        price = Price.new(
          min_weight: 5,
          max_weight: 10,
          price_per_km: '',
          mode_id: 2
        )
        #Act
        result = price.valid?
        #Assert
        expect(result).to eq(false)
      end
      
      it "false if min weight is empty" do
        #Arrange
        price = Price.new(
          min_weight: 5,
          max_weight: 10,
          price_per_km: 0.11,
          mode_id: ''
        )
        #Act
        result = price.valid?
        #Assert
        expect(result).to eq(false)
      end
    end
  end
end