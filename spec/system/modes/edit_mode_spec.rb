require 'rails_helper'

describe "Edit mode" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Modalidades'
    end
    
    it "visit section directly" do
      visit edit_mode_path(1)
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
      within('div ul.nav li:nth-child(3)') do
        click_on 'Modalidades'
      end
      within('table tbody tr:nth-child(1) td:nth-child(1)') do
        click_on 'Light Pack'
      end
      within('div.modes__btn-bottom') do
        click_on "Editar"
      end
      #Assert
      within('section div h1') do
        expect(page).to have_content 'Editar Modalidade'
      end
      within('section div button') do
        expect(page).to have_content 'Voltar'
      end
      within('div table') do
        expect(page).to have_field 'Nome'
        expect(page).to have_field 'Distância Mínima (Km)'
        expect(page).to have_field 'Distância Máxima (Km)'
        expect(page).to have_field 'Peso Mínimo (Kg)'
        expect(page).to have_field 'Peso Máximo (Kg)'
        expect(page).to have_field 'Taxa fixa (R$)'
        expect(page).to have_field 'Status'
      end
      within('div.modes__btn') do
        expect(page).to have_button 'Salvar'
      end
    end

    it "successfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(3)') do
        click_on 'Modalidades'
      end
      within('table tbody tr:nth-child(1) td:nth-child(1)') do
        click_on 'Light Pack'
      end
      within('div.modes__btn-bottom') do
        click_on "Editar"
      end
      within('div table') do
        fill_in "Nome",	with: "Modalidade 1"
        fill_in "Distância Mínima (Km)",	with: '1'
        fill_in "Distância Máxima (Km)",	with: '20'
        fill_in "Peso Mínimo (Kg)",	with: '1'
        fill_in "Peso Máximo (Kg)",	with: '20'
        fill_in "Taxa fixa (R$)",	with: '5'
        check "Status"
      end
      click_on 'Salvar'
      #Assert
      within('div.notice') do
        expect(page).to have_content 'Modalidade atualizada com sucesso'
      end
      within('section div h1') do
        expect(page).to have_content 'Modalidade'
      end
      within('section div div') do
        expect(page).to have_button 'Voltar'
      end
      within('div table') do
        expect(page).to have_content 'Nome Modalidade 1'
        expect(page).to have_content 'Distância Mínima 1 Km'
        expect(page).to have_content 'Distância Máxima 20 Km'
        expect(page).to have_content 'Peso Mínimo 1 Kg'
        expect(page).to have_content 'Peso Máximo 20 Kg'
        expect(page).to have_content 'Taxa fixa R$ 5'
        expect(page).to have_content 'Status Ativo'
      end
      within('div.modes__btn-bottom') do
        expect(page).to have_button 'Editar'
        expect(page).to have_button 'Apagar'
      end
    end
  end
end