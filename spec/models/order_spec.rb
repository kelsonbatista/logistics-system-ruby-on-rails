require 'rails_helper'

RSpec.describe Order, type: :model do  
  describe "#valid?" do
    context 'presence' do
      it "false if distance is empty" do
        #Arrange
        order = Order.new(distance: '')
        #Act
        result = order.valid?
        #Assert
        expect(result).to eq(false)
      end
    end
  end
end