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
      within('div ul.nav li:nth-child(6)') do
        click_on 'Prazos'
      end
      within('section div div') do
        click_on 'Novo Prazo'
      end
      #Assert
      within('section div h1') do
        expect(page).to have_content 'Novo Prazo'
      end
      within('section div div.page__top') do
        expect(page).to have_button 'Voltar'
      end
      within('div table') do
        expect(page).to have_field 'Distância Mínima (Km)'
        expect(page).to have_field 'Distância Máxima (Km)'
        expect(page).to have_field 'Prazo (hs)'
        expect(page).to have_field 'Modalidade'
      end
      within('div.deadlines__btn') do
        expect(page).to have_button 'Salvar'
      end
    end

    it "successfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(6)') do
        click_on 'Prazos'
      end
      within('section div div') do
        click_on 'Novo Prazo'
      end
      within('div table') do
        fill_in "Distância Mínima (Km)",	with: '11'
        fill_in "Distância Máxima (Km)",	with: '20'
        fill_in "Prazo (hs)",	with: "55"
        select "Super Pack", from: "Modalidade"
      end
      within('div.deadlines__btn') do
        click_on 'Salvar'
      end
      #Assert
      expect(current_path).to eq deadlines_path
      within('div.notice') do
        expect(page).to have_content 'Prazo cadastrado com sucesso'
      end
      within('table thead tr') do 
        expect(page).to have_content 'Distância'
        expect(page).to have_content 'Prazo'
        expect(page).to have_content 'Modalidade'
        expect(page).to have_content 'Ações'
      end
      within('table tbody tr') do
        expect(page).to have_content '11 Km'
        expect(page).to have_content '20 Km'
        expect(page).to have_content '55 hs'
        expect(page).to have_content 'Super Pack'
        expect(page).to have_content 'Editar'
        expect(page).to have_content 'Apagar'
      end
    end

    it "not empty fields" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(6)') do
        click_on 'Prazos'
      end
      within('section div div') do
        click_on 'Novo Prazo'
      end
      within('div table') do
        fill_in "Distância Mínima (Km)",	with: ''
        fill_in "Distância Máxima (Km)",	with: ''
        fill_in "Prazo (hs)",	with: ""
        select "", from: "Modalidade"
      end
      within('div.deadlines__btn') do
        click_on 'Salvar'
      end
      #Assert
      within('div.notice') do
        expect(page).to have_content 'Erro ao cadastrar prazo'
      end
      within('div.messages ul') do
        expect(page).to have_content 'Modalidade é obrigatório(a)'
        expect(page).to have_content 'Distância Mínima não pode ficar em branco'
        expect(page).to have_content 'Distância Máxima não pode ficar em branco'
        expect(page).to have_content 'Prazo não pode ficar em branco'
        expect(page).to have_content 'Mode não pode ficar em branco'
      end
    end
  end
end