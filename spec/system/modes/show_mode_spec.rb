require 'rails_helper'

describe "Show modes" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Modalidades'
    end
    
    it "visit section directly" do
      visit mode_path(1)
      expect(current_path).to eq new_user_session_path
    end
  end

  context "user authenticated" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user")

      Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
                  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)

      login_as(user)
    end

    it "successfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(3)') do
        click_on 'Modalidades'
      end
      within('table tbody tr td:nth-child(1)') do
        click_on 'Light Pack'
      end
      #Assert
      within('section div h1') do
        expect(page).to have_content 'Modalidade'
      end
      within('section div div') do
        expect(page).to have_button 'Voltar'
      end
      within('div table') do
        expect(page).to have_content 'Nome Light Pack'
        expect(page).to have_content 'Distância Mínima 1 Km'
        expect(page).to have_content 'Distância Máxima 1000 Km'
        expect(page).to have_content 'Peso Mínimo 1 Kg'
        expect(page).to have_content 'Peso Máximo 10 Kg'
        expect(page).to have_content 'Taxa fixa R$ 20'
        expect(page).to have_content 'Status Ativo'
      end
      within('div.modes__btn-bottom') do
        expect(page).to have_button 'Editar'
        expect(page).to have_button 'Apagar'
      end
    end

    it "returns to modes page" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(3)') do
        click_on 'Modalidades'
      end
      within('table tbody tr td:nth-child(1)') do
        click_on 'Light Pack'
      end
      within('section div div') do
        click_on 'Voltar'
      end
      #Assert
      expect(current_path).to eq modes_path
    end
  end
end