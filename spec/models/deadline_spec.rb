require 'rails_helper'

RSpec.describe Deadline, type: :model do  
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

      it "false if minimum distance is empty" do
        #Arrange
        deadline = Deadline.new(
          min_distance: '',
          max_distance: 10,
          deadline: 11,
          mode_id: 2
        )
        #Act
        result = deadline.valid?
        #Assert
        expect(result).to eq(false)
      end
      
      it "false if maximum distance is empty" do
        #Arrange
        deadline = Deadline.new(
          min_distance: 5,
          max_distance: '',
          deadline: 11,
          mode_id: 2
        )
        #Act
        result = deadline.valid?
        #Assert
        expect(result).to eq(false)
      end
      
      it "false if deadline per km is empty" do
        #Arrange
        deadline = Deadline.new(
          min_distance: 5,
          max_distance: 10,
          deadline: '',
          mode_id: 2
        )
        #Act
        result = deadline.valid?
        #Assert
        expect(result).to eq(false)
      end
      
      it "false if min distance is empty" do
        #Arrange
        deadline = Deadline.new(
          min_distance: 5,
          max_distance: 10,
          deadline: 11,
          mode_id: ''
        )
        #Act
        result = deadline.valid?
        #Assert
        expect(result).to eq(false)
      end
    end
  end
end