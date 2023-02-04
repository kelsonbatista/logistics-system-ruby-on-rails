require 'rails_helper'

describe "Show vehicle" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Veículos'
    end
    
    it "visit section directly" do
      visit vehicle_path(1)
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

      Vehicle.create!(plate: "ABC-1001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
                      year: "2011", capacity: 100, status: 0, mode_id: 1)
      
      Vehicle.create!(plate: "ABC-1002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
                      year: "2012", capacity: 400, status: 0, mode_id: 1)
      
      Vehicle.create!(plate: "ABC-1003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
                      year: "2013", capacity: 1000, status: 0, mode_id: 1)

      login_as(user)
    end

    it "sucessfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(4)') do
        click_on 'Veículos'
      end
      within('table tbody tr:nth-child(2) td:nth-child(1)') do
        click_on 'ABC-1002'
      end
      #Assert
      expect(current_path).to eq vehicle_path(2)
      within('div table') do
        expect(page).to have_content "Placa ABC-1002"
        expect(page).to have_content "Marca Fiat"
        expect(page).to have_content "Modelo Fiorino 1.6"
        expect(page).to have_content "Categoria Carga Leve"
        expect(page).to have_content "Ano 2012"
        expect(page).to have_content "Capacidade 400 Kg"
        expect(page).to have_content "Status Em operação"
      end
    end

    it "return to vehicles page" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(4)') do
        click_on 'Veículos'
      end
      within('table tbody tr:nth-child(2) td:nth-child(1)') do
        click_on 'ABC-1002'
      end
      within('section div div.page__top') do
        click_on 'Voltar'
      end
      #Assert
      expect(current_path).to eq vehicles_path
    end
  end
end