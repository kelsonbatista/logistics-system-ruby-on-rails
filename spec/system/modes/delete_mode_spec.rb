require 'rails_helper'

describe "Delete mode" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Modalidades'
    end
    
    it "visit section directly" do
      visit modes_path
      expect(current_path).to eq new_user_session_path
    end
  end

  context "user authenticated" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user")

      Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
                  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)

      Mode.create!(name: "Super Pack", min_distance: 10, max_distance: 500, 
                  min_weight: 5, max_weight: 20, fixed_fee: 40, active: false)

      Mode.create!(name: "Mega Pack", min_distance: 10, max_distance: 300, 
                  min_weight: 10, max_weight: 40, fixed_fee: 60, active: true)

      login_as(user)
    end

    it "sucessfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(3)') do
        click_on 'Modalidades'
      end
      within('table tbody tr:nth-child(1) td:nth-child(1)') do
        click_on 'Light Pack'
      end
      within('div.modes__btn-bottom') do
        click_on "Apagar"
      end
      #Assert
      expect(current_path).to eq modes_path
      within('table thead tr') do
        expect(page).to have_content 'Nome'
        expect(page).to have_content 'Distância Mínima (Km)'
        expect(page).to have_content 'Distância Máxima (Km)'
        expect(page).to have_content 'Peso Mínimo (Kg)'
        expect(page).to have_content 'Peso Máximo (Kg)'
        expect(page).to have_content 'Status'
      end
      within('table tbody tr:nth-child(1)') do
        expect(page).to have_content 'Super Pack'
        expect(page).to have_content 10
        expect(page).to have_content 500
        expect(page).to have_content 5
        expect(page).to have_content 20
        expect(page).to have_content 'Inativo'
      end
      within('table tbody tr:nth-child(2)') do
        expect(page).to have_content 'Mega Pack'
        expect(page).to have_content 10
        expect(page).to have_content 300
        expect(page).to have_content 10
        expect(page).to have_content 40
        expect(page).to have_content 'Ativo'
      end
    end
  end
end