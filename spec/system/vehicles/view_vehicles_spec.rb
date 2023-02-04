require 'rails_helper'

describe "View vehicles" do
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

      login_as(user)
    end

    it "visit page" do
      #Act
      visit root_path
      visit vehicles_path
      #Assert
      expect(current_path).to eq vehicles_path
    end

    it "successfully" do
      #Arrange
      Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
                  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)

      Mode.create!(name: "Super Pack", min_distance: 10, max_distance: 500, 
                  min_weight: 5, max_weight: 20, fixed_fee: 40, active: false)

      Mode.create!(name: "Mega Pack", min_distance: 10, max_distance: 300, 
                  min_weight: 10, max_weight: 40, fixed_fee: 60, active: true)

      Vehicle.create!(plate: "ABC-1001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
                      year: "2011", capacity: 100, status: 0, mode_id: 1)
      
      Vehicle.create!(plate: "ABC-1002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
                      year: "2012", capacity: 400, status: 5, mode_id: 2)
      
      Vehicle.create!(plate: "ABC-1003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
                      year: "2013", capacity: 1000, status: 10, mode_id: 3)

      #Act
      visit root_path
      visit vehicles_path
      #Assert
      within('div ul.nav li:nth-child(4)') do
        expect(page).to have_content 'Veículos'
      end
      within('section div div.page__top') do
        expect(page).to have_link 'Novo Veículo'
      end
      within('table thead tr:nth-child(1)') do
        expect(page).to have_content 'Placa'
        expect(page).to have_content 'Modelo'
        expect(page).to have_content 'Categoria'
        expect(page).to have_content 'Carga'
        expect(page).to have_content 'Modalidade'
        expect(page).to have_content 'Status'
      end
      within('table tbody tr:nth-child(1)') do
        expect(page).to have_content 'ABC-1001'
        expect(page).to have_content 'Gol 1.6'
        expect(page).to have_content 'Passeio'
        expect(page).to have_content '100'
        expect(page).to have_content 'Light Pack'
        expect(page).to have_content 'Em operação'
      end
      within('table tbody tr:nth-child(2)') do
        expect(page).to have_content 'ABC-1002'
        expect(page).to have_content 'Fiorino 1.6'
        expect(page).to have_content 'Carga Leve'
        expect(page).to have_content '400'
        expect(page).to have_content 'Super Pack'
        expect(page).to have_content 'Em trânsito'
      end
      within('table tbody tr:nth-child(3)') do
        expect(page).to have_content 'ABC-1003'
        expect(page).to have_content 'Furgão 4.0'
        expect(page).to have_content 'Carga Média'
        expect(page).to have_content '1000'
        expect(page).to have_content 'Mega Pack'
        expect(page).to have_content 'Em manutenção'
      end
    end

    it "no registered vehicles" do
      #Act
      visit root_path
      visit vehicles_path
      #Assert
      expect(page).to have_content 'Nenhum veículo cadastrado'
    end
  end
end