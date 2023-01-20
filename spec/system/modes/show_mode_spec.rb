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
      user = User.create!(
        name: "Usuario 1",
        email: "usuario1@email.com",
        password: '123456',
        role: "user"
      )

      Mode.create!(
        name: "Modalidade 1",
        min_distance: 1,
        max_distance: 20,
        min_weight: 1,
        max_weight: 20,
        fixed_fee: 5,
        active: true
      )

      login_as(user)
    end

    it "successfully" do
      #Act
      visit root_path
      click_on 'Modalidades'
      click_on 'Modalidade 1'
      #Assert
      expect(page).to have_content 'Nome Modalidade 1'
      expect(page).to have_content 'Distância Mínima 1 Km'
      expect(page).to have_content 'Distância Máxima 20 Km'
      expect(page).to have_content 'Peso Mínimo 1 Kg'
      expect(page).to have_content 'Peso Máximo 20 Kg'
      expect(page).to have_content 'Taxa fixa R$ 5'
      expect(page).to have_content 'Status Ativo'
    end

    it "returns to modes page" do
      #Act
      visit root_path
      click_on 'Modalidades'
      click_on 'Modalidade 1'
      click_on 'Voltar'
      #Assert
      expect(current_path).to eq modes_path
    end
  end
end