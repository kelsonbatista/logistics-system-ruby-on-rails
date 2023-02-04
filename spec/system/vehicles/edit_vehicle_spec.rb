require 'rails_helper'

describe "Edit vehicle" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Veículos'
    end
    
    it "visit section directly" do
      visit edit_vehicle_path(1)
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

    it "view page and form" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(4)') do
        click_on 'Veículos'
      end
      within('table tbody tr:nth-child(2) td:nth-child(1)') do
        click_on 'ABC-1002'
      end
      within('div.vehicles__btn-bottom') do
        click_on "Editar"
      end
      #Assert
      expect(current_path).to eq edit_vehicle_path(2)
      within('section div h1') do
        expect(page).to have_content 'Editar Veículo'
      end
      within('section div button') do
        expect(page).to have_content 'Voltar'
      end
      within('div table') do
        expect(page).to have_field "Placa"
        expect(page).to have_field "Marca"
        expect(page).to have_field "Modelo"
        expect(page).to have_field "Categoria"
        expect(page).to have_field "Ano"
        expect(page).to have_field "Capacidade"
        expect(page).to have_field "Status"
      end
    end

    it "successfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(4)') do
        click_on 'Veículos'
      end
      within('table tbody tr:nth-child(2) td:nth-child(1)') do
        click_on 'ABC-1002'
      end
      within('div.vehicles__btn-bottom') do
        click_on "Editar"
      end
      within('div table') do
        select "Mega Pack", from: "Modalidade"
        fill_in "Placa",	with: "ABC-9999" 
        fill_in "Marca",	with: "Marca 9999"
        fill_in "Modelo",	with: "Modelo 9999"
        fill_in "Categoria",	with: "Categoria 9999"
        fill_in "Ano",	with: "2019"
        fill_in "Capacidade",	with: "9999"
        select "operational", from: "Status"
      end
      within('div.vehicles__btn') do
        click_on 'Salvar'
      end

      #Assert
      expect(current_path).to eq vehicle_path(2)
      within('section div h1') do
        expect(page).to have_content 'Veículo'
      end
      within('section div button.back__btn') do
        expect(page).to have_content 'Voltar'
      end
      within('div table') do
        expect(page).to have_content "Placa ABC-9999"
        expect(page).to have_content "Marca Marca 9999"
        expect(page).to have_content "Modelo Modelo 9999"
        expect(page).to have_content "Categoria Categoria 9999"
        expect(page).to have_content "Ano 2019"
        expect(page).to have_content "Capacidade 9999"
        expect(page).to have_content "Status Em operação"
      end      
    end
  end
end