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
      user = User.create!(
        name: "Usuario 1",
        email: "usuario1@email.com",
        password: '123456',
        role: "user"
      )

      for i in 1..3 do
        Mode.create!(
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

    it "view page and form" do
      #Act
      visit root_path
      click_on 'Veículos'
      click_on 'Novo Veículo'
      #Assert
      expect(page).to have_content 'Novo Veículo'
      expect(page).to have_field 'Modalidade'
      expect(page).to have_field 'Placa'
      expect(page).to have_field 'Marca'
      expect(page).to have_field 'Modelo'
      expect(page).to have_field 'Categoria'
      expect(page).to have_field 'Ano'
      expect(page).to have_field 'Capacidade'
      expect(page).to have_field 'Status'
    end

    it "successfully" do
      #Act
      visit root_path
      click_on 'Veículos'
      click_on 'Novo Veículo'
      select 'Modalidade 2', from: 'Modalidade'
      fill_in "Placa",	with: 'ABC-1231'
      fill_in "Marca",	with: 'Marca 1'
      fill_in "Modelo",	with: 'Modelo 1'
      fill_in "Categoria",	with: 'Categoria 1'
      fill_in "Ano",	with: '2011'
      fill_in "Capacidade",	with: '100'
      check "Status"
      click_on 'Salvar'
      #Assert
      expect(current_path).to eq vehicles_path
      expect(page).to have_content 'Veículo criado com sucesso'  
      expect(page).to have_content 'Modelo 1'
    end

    it "not empty fields" do
      #Act
      visit root_path
      click_on 'Veículos'
      click_on 'Novo Veículo'
      select 'Modalidade 2', from: 'Modalidade'
      fill_in "Placa",	with: ''
      fill_in "Marca",	with: ''
      fill_in "Modelo",	with: ''
      fill_in "Categoria",	with: ''
      fill_in "Ano",	with: ''
      fill_in "Capacidade",	with: ''
      check "Status"
      click_on 'Salvar'
      #Assert
      expect(page).to have_content 'Erro ao criar o veículo'
      expect(page).to have_content 'Placa não pode ficar em branco'
      expect(page).to have_content 'Marca não pode ficar em branco'
      expect(page).to have_content 'Modelo não pode ficar em branco'
      expect(page).to have_content 'Categoria não pode ficar em branco'
      expect(page).to have_content 'Ano não pode ficar em branco'
      expect(page).to have_content 'Capacidade não pode ficar em branco'
    end
  end
end