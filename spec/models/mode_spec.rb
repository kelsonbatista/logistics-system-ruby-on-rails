require 'rails_helper'

RSpec.describe Mode, type: :model do  
  describe "#valid?" do
    context 'presence' do
      it "false if name is empty" do
        #Arrange
        mode = Mode.new(
          name: '',
          min_distance: 1,
          max_distance: 20,
          min_weight: 1,
          max_weight: 20,
          fixed_fee: 5,
          active: true
        ) 
        #Act
        result = mode.valid?
        #Assert
        expect(result).to eq(false)
      end
      it "false if min distance is empty" do
        #Arrange
        mode = Mode.new(
          name: 'Modalidade 1',
          min_distance: '',
          max_distance: 20,
          min_weight: 1,
          max_weight: 20,
          fixed_fee: 5,
          active: true
        ) 
        #Act
        result = mode.valid?
        #Assert
        expect(result).to eq(false)
      end
      it "false if max distance is empty" do
        #Arrange
        mode = Mode.new(
          name: 'Modalidade 1',
          min_distance: 1,
          max_distance: '',
          min_weight: 1,
          max_weight: 20,
          fixed_fee: 5,
          active: true
        ) 
        #Act
        result = mode.valid?
        #Assert
        expect(result).to eq(false)
      end
      it "false if min weight is empty" do
        #Arrange
        mode = Mode.new(
          name: 'Modalidade 1',
          min_distance: 1,
          max_distance: 20,
          min_weight: '',
          max_weight: 20,
          fixed_fee: 5,
          active: true
        ) 
        #Act
        result = mode.valid?
        #Assert
        expect(result).to eq(false)
      end
      it "false if max weight is empty" do
        #Arrange
        mode = Mode.new(
          name: 'Modalidade 1',
          min_distance: 1,
          max_distance: 20,
          min_weight: 1,
          max_weight: '',
          fixed_fee: 5,
          active: true
        ) 
        #Act
        result = mode.valid?
        #Assert
        expect(result).to eq(false)
      end
      it "false if fixed fee is empty" do
        #Arrange
        mode = Mode.new(
          name: 'Modalidade 1',
          min_distance: 1,
          max_distance: 20,
          min_weight: 1,
          max_weight: 20,
          fixed_fee: '',
          active: true
        ) 
        #Act
        result = mode.valid?
        #Assert
        expect(result).to eq(false)
      end
    end

    context 'uniqueness' do
      # obs teste abaixo primeiro CRIA e depois apenas new na memoria
      it "false if name already exist" do
        #Arrange
        mode1 = Mode.create!(
          name: 'Modalidade 5',
          min_distance: 1,
          max_distance: 20,
          min_weight: 1,
          max_weight: 20,
          fixed_fee: 5,
          active: true
        ) 
        mode2 = Mode.new(
          name: 'Modalidade 5',
          min_distance: 1,
          max_distance: 20,
          min_weight: 1,
          max_weight: 20,
          fixed_fee: 5,
          active: true
        ) 
        #Act
        result = mode2.valid?
        #Assert
        expect(result).to eq(false)
      end
    end
  end
end