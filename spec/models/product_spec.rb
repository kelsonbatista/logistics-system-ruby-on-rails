require 'rails_helper'

RSpec.describe Product, type: :model do  
  describe "#valid?" do
    context 'presence' do
      it "false if width is empty" do
        #Arrange
        product = Product.new(width: '', height: 30, depth: 10, weight: 100)
        #Act
        result = product.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if height is empty" do
        #Arrange
        product = Product.new(width: 50, height: '', depth: 10, weight: 100)
        #Act
        result = product.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if depth is empty" do
        #Arrange
        product = Product.new(width: 50, height: 30, depth: '', weight: 100)
        #Act
        result = product.valid?
        #Assert
        expect(result).to eq(false)
      end

      it "false if weight is empty" do
        #Arrange
        product = Product.new(width: 50, height: 30, depth: 10, weight: '')
        #Act
        result = product.valid?
        #Assert
        expect(result).to eq(false)
      end
    end
  end
end