require 'rails_helper'

describe "Create vehicle" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Veículos'
    end
    
    it "visit section directly" do
      visit new_vehicle_path
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

    it "view page and form" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(4)') do
        click_on 'Veículos'
      end
      within('section div div.page__top') do
        click_on 'Novo Veículo'
      end
      #Assert
      within('section div h1') do
        expect(page).to have_content 'Novo Veículo'
      end
      within('section div div.page__top') do
        expect(page).to have_button 'Voltar'
      end
      within('div table') do
        expect(page).to have_field 'Modalidade'
        expect(page).to have_field 'Placa'
        expect(page).to have_field 'Marca'
        expect(page).to have_field 'Modelo'
        expect(page).to have_field 'Categoria'
        expect(page).to have_field 'Ano'
        expect(page).to have_field 'Capacidade'
        expect(page).to have_field 'Status'
      end
      within('div.vehicles__btn') do
        expect(page).to have_button 'Salvar'
      end
    end

    it "successfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(4)') do
        click_on 'Veículos'
      end
      within('section div div.page__top') do
        click_on 'Novo Veículo'
      end
      within('div table') do
        select 'Super Pack', from: 'Modalidade'
        fill_in "Placa",	with: 'ABC-1231'
        fill_in "Marca",	with: 'Volkswagen'
        fill_in "Modelo",	with: 'Gol 1.6'
        fill_in "Categoria",	with: 'Leve'
        fill_in "Ano",	with: '2011'
        fill_in "Capacidade",	with: '100'
        select 'operational', from: 'Status'
      end
      within('div.vehicles__btn') do
        click_on 'Salvar'
      end
      #Assert
      expect(current_path).to eq vehicles_path
      within('div.notice') do
        expect(page).to have_content 'Veículo criado com sucesso'
      end
      within('table thead tr') do
        expect(page).to have_content 'Placa'
        expect(page).to have_content 'Modelo'
        expect(page).to have_content 'Categoria'
        expect(page).to have_content 'Carga'
        expect(page).to have_content 'Modalidade'
        expect(page).to have_content 'Status'
      end
      within('table tbody tr') do
        expect(page).to have_content 'ABC-1231'
        expect(page).to have_content 'Gol 1.6'
        expect(page).to have_content 'Leve'
        expect(page).to have_content '100'
        expect(page).to have_content 'Super Pack'
        expect(page).to have_content 'Em operação'
      end
    end

    it "not empty fields" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(4)') do
        click_on 'Veículos'
      end
      within('section div div.page__top') do
        click_on 'Novo Veículo'
      end
      within('div table') do
        select '', from: 'Modalidade'
        fill_in "Placa",	with: ''
        fill_in "Marca",	with: ''
        fill_in "Modelo",	with: ''
        fill_in "Categoria",	with: ''
        fill_in "Ano",	with: ''
        fill_in "Capacidade",	with: ''
      end
      within('div.vehicles__btn') do
        click_on 'Salvar'
      end
      #Assert
      within('div.notice') do
        expect(page).to have_content 'Erro ao criar o veículo'
      end
      within('div.messages ul') do
        expect(page).to have_content 'Placa não pode ficar em branco'
        expect(page).to have_content 'Marca não pode ficar em branco'
        expect(page).to have_content 'Modelo não pode ficar em branco'
        expect(page).to have_content 'Categoria não pode ficar em branco'
        expect(page).to have_content 'Ano não pode ficar em branco'
        expect(page).to have_content 'Capacidade não pode ficar em branco'
      end
    end
  end
end