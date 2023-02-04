require 'rails_helper'

describe "Create price" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Preços'
    end
    
    it "visit section directly" do
      visit new_price_path
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
      within('div ul.nav li:nth-child(5)') do
        click_on 'Preços'
      end
      within('section div div') do
        click_on 'Novo Preço'
      end
      #Assert
      within('section div h1') do
        expect(page).to have_content 'Novo Preço'
      end
      within('section div div.page__top') do
        expect(page).to have_button 'Voltar'
      end
      within('div table') do
        expect(page).to have_field 'Peso Mínimo (Kg)'
        expect(page).to have_field 'Peso Máximo (Kg)'
        expect(page).to have_field 'Preço por Km (R$)'
        expect(page).to have_field 'Modalidade'
      end
      within('div.prices__btn') do
        expect(page).to have_button 'Salvar'
      end
    end

    it "successfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(5)') do
        click_on 'Preços'
      end
      within('section div div') do
        click_on 'Novo Preço'
      end
      within('div table') do
        fill_in "Peso Mínimo (Kg)",	with: '11'
        fill_in "Peso Máximo (Kg)",	with: '20'
        fill_in "Preço por Km (R$)",	with: "0.55"
        select "Super Pack", from: "Modalidade"
      end
      within('div.prices__btn') do
        click_on 'Salvar'
      end
      #Assert
      within('div.notice') do
        expect(page).to have_content 'Preço cadastrado com sucesso'
      end
      within('table thead tr') do
        expect(page).to have_content 'Peso'
        expect(page).to have_content 'Preço por Km'
        expect(page).to have_content 'Modalidade'
        expect(page).to have_content 'Ações'
      end
      within('table tbody tr') do
        expect(page).to have_content '11 Kg'
        expect(page).to have_content '20 Kg'
        expect(page).to have_content 'R$ 0.55'
        expect(page).to have_content 'Super Pack'
        expect(page).to have_button 'Editar'
        expect(page).to have_button 'Apagar'
      end
    end

    it "not empty fields" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(5)') do
        click_on 'Preços'
      end
      within('section div div') do
        click_on 'Novo Preço'
      end
      within('div table') do
        fill_in "Peso Mínimo (Kg)",	with: ''
        fill_in "Peso Máximo (Kg)",	with: ''
        fill_in "Preço por Km (R$)",	with: ""
        select "", from: "Modalidade"
      end
      within('div.prices__btn') do
        click_on 'Salvar'
      end
      #Assert
      within('div.notice') do
        expect(page).to have_content 'Erro ao cadastrar preço'
      end
      within('div.messages ul') do
        expect(page).to have_content 'Modalidade é obrigatório(a)'
        expect(page).to have_content 'Peso Mínimo não pode ficar em branco'
        expect(page).to have_content 'Peso Máximo não pode ficar em branco'
        expect(page).to have_content 'Preço por Km não pode ficar em branco'
        expect(page).to have_content 'Mode não pode ficar em branco'
      end
    end
  end
end