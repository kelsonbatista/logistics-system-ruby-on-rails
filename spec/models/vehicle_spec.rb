require 'rails_helper'

RSpec.describe Vehicle, type: :model do  
  fdescribe "#valid?" do
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

      it "false if plate is empty" do
        #Arrange
        vehicle = Vehicle.new(
          plate: "",
          brand: "Marca 1",
          model: "Modelo 1",
          category: "Categoria 1",
          year: "2011",
          capacity: 100,
          status: true,
          mode_id: 1
        )
        #Act
        result = vehicle.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if brand is empty" do
        #Arrange
        vehicle = Vehicle.new(
          plate: "ABC-1231",
          brand: "",
          model: "Modelo 1",
          category: "Categoria 1",
          year: "2011",
          capacity: 100,
          status: true,
          mode_id: 1
        )
        #Act
        result = vehicle.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if model is empty" do
        #Arrange
        vehicle = Vehicle.new(
          plate: "ABC-1231",
          brand: "Marca 1",
          model: "",
          category: "Categoria 1",
          year: "2011",
          capacity: 100,
          status: true,
          mode_id: 1
        )
        #Act
        result = vehicle.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if category is empty" do
        #Arrange
        vehicle = Vehicle.new(
          plate: "ABC-1231",
          brand: "Marca 1",
          model: "Modelo 1",
          category: "",
          year: "2011",
          capacity: 100,
          status: true,
          mode_id: 1
        )
        #Act
        result = vehicle.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if year is empty" do
        #Arrange
        vehicle = Vehicle.new(
          plate: "ABC-1231",
          brand: "Marca 1",
          model: "Modelo 1",
          category: "Categoria 1",
          year: "",
          capacity: 100,
          status: true,
          mode_id: 1
        )
        #Act
        result = vehicle.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if capacity is empty" do
        #Arrange
        vehicle = Vehicle.new(
          plate: "ABC-1231",
          brand: "Marca 1",
          model: "Modelo 1",
          category: "Categoria 1",
          year: "2011",
          capacity: '',
          status: true,
          mode_id: 1
        )
        #Act
        result = vehicle.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if mode is empty" do
        #Arrange
        vehicle = Vehicle.new(
          plate: "ABC-1231",
          brand: "Marca 1",
          model: "Modelo 1",
          category: "Categoria 1",
          year: "2011",
          capacity: 100,
          status: true,
          mode_id: ''
        )
        #Act
        result = vehicle.valid?
        #Assert
        expect(result).to eq(false)
      end
    end
  end
end