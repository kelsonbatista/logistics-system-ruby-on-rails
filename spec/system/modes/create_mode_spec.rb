require 'rails_helper'

describe "Create mode" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Modalidades'
    end
    
    it "visit section directly" do
      visit new_mode_path
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

      login_as(user)
    end

    it "view page and form" do
      #Act
      visit root_path
      click_on 'Modalidades'
      click_on 'Nova Modalidade'
      #Assert
      expect(page).to have_content 'Nova Modalidade'
      expect(page).to have_field 'Nome'
      expect(page).to have_field 'Distância Mínima (Km)'
      expect(page).to have_field 'Distância Máxima (Km)'
      expect(page).to have_field 'Peso Mínimo (Kg)'
      expect(page).to have_field 'Peso Máximo (Kg)'
      expect(page).to have_field 'Taxa fixa (R$)'
      expect(page).to have_field 'Status'
    end

    it "successfully" do
      #Act
      visit root_path
      click_on 'Modalidades'
      click_on 'Nova Modalidade'
      fill_in "Nome",	with: "Modalidade 1"
      fill_in "Distância Mínima (Km)",	with: '1'
      fill_in "Distância Máxima (Km)",	with: '20'
      fill_in "Peso Mínimo (Kg)",	with: '1'
      fill_in "Peso Máximo (Kg)",	with: '20'
      fill_in "Taxa fixa (R$)",	with: '5'
      check "Status"
      click_on 'Salvar'
      #Assert
      expect(page).to have_content 'Modalidade criada com sucesso'  
      expect(page).to have_content 'Modalidade 1'
    end

    it "not empty fields" do
      #Act
      visit root_path
      click_on 'Modalidades'
      click_on 'Nova Modalidade'
      fill_in "Nome",	with: ''
      fill_in "Distância Mínima (Km)",	with: ''
      fill_in "Distância Máxima (Km)",	with: ''
      fill_in "Peso Mínimo (Kg)",	with: ''
      fill_in "Peso Máximo (Kg)",	with: ''
      fill_in "Taxa fixa (R$)",	with: ''
      check "Status"
      click_on 'Salvar'
      #Assert
      expect(page).to have_content 'Erro ao criar a modalidade'
      expect(page).to have_content 'Nome não pode ficar em branco'
      expect(page).to have_content 'Distância Mínima não pode ficar em branco'
      expect(page).to have_content 'Distância Máxima não pode ficar em branco'
      expect(page).to have_content 'Peso Mínimo não pode ficar em branco'
      expect(page).to have_content 'Peso Máximo não pode ficar em branco'
      expect(page).to have_content 'Taxa fixa não pode ficar em branco'
    end
  end
end