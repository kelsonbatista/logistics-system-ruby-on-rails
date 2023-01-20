require 'rails_helper'

describe "Create deadline" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Prazos'
    end
    
    it "visit section directly" do
      visit new_deadline_path
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
      click_on 'Prazos'
      click_on 'Novo Prazo'
      #Assert
      expect(page).to have_content 'Novo Prazo'
      expect(page).to have_field 'Distância Mínima (Km)'
      expect(page).to have_field 'Distância Máxima (Km)'
      expect(page).to have_field 'Prazo (hs)'
      expect(page).to have_field 'Modalidade'
      expect(page).to have_button 'Salvar'
    end

    it "successfully" do
      #Act
      visit root_path
      click_on 'Prazos'
      click_on 'Novo Prazo'
      fill_in "Distância Mínima (Km)",	with: '11'
      fill_in "Distância Máxima (Km)",	with: '20'
      fill_in "Prazo (hs)",	with: "55"
      select "Modalidade 2", from: "Modalidade"
      click_on 'Salvar'
      #Assert
      expect(current_path).to eq deadlines_path
      expect(page).to have_content 'Prazo cadastrado com sucesso'  
      expect(page).to have_content 'Distância'
      expect(page).to have_content 'Prazo'
      expect(page).to have_content 'Modalidade'
      expect(page).to have_content 'Ações'
      expect(page).to have_content '11 Km'
      expect(page).to have_content '20 Km'
      expect(page).to have_content '55 hs'
      expect(page).to have_content 'Modalidade 2'
      expect(page).to have_content 'Editar'
      expect(page).to have_content 'Apagar'
    end

    it "not empty fields" do
      #Act
      visit root_path
      click_on 'Prazos'
      click_on 'Novo Prazo'
      fill_in "Distância Mínima (Km)",	with: ''
      fill_in "Distância Máxima (Km)",	with: ''
      fill_in "Prazo (hs)",	with: ''
      select "Modalidade 2", from: "Modalidade"
      click_on 'Salvar'
      #Assert
      expect(page).to have_content 'Erro ao cadastrar prazo'
      expect(page).to have_content 'Distância Mínima não pode ficar em branco'
      expect(page).to have_content 'Distância Máxima não pode ficar em branco'
      expect(page).to have_content 'Prazo não pode ficar em branco'
    end
  end
end