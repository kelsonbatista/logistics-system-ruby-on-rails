require 'rails_helper'

describe "Delete price" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Preços'
    end
    
    it "visit section directly" do
      visit prices_path
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

      for i in 1..2 do
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

      for i in 1..2 do
        Price.create!(
          min_weight: 3 * i,
          max_weight: 8 * i,
          price_per_km: 0.11 * i,
          mode_id: 1
        )
        Price.create!(
          min_weight: 7 * i,
          max_weight: 12 * i,
          price_per_km: 0.16 * i,
          mode_id: 2
        )
      end

      login_as(user)
    end

    it "sucessfully" do
      #Act
      visit root_path
      click_on "Preços"
      page.all('button.btn-danger')[1].click
      #Assert
      expect(current_path).to eq prices_path
      expect(page).to have_content 'Peso'
      expect(page).to have_content 'Preço por Km'
      expect(page).to have_content 'Modalidade'
      expect(page).to have_content 'Ações'
      expect(page).to have_content 'Editar'
      expect(page).to have_content 'Apagar'
      expect(page).to have_content '3 Kg'
      expect(page).to have_content '8 Kg'
      expect(page).to have_content 'R$ 0.11'
      expect(page).to have_content 'Modalidade 1'
      expect(page).to have_content '6 Kg'
      expect(page).to have_content '16 Kg'
      expect(page).to have_content 'R$ 0.22'
      expect(page).to have_content '14 Kg'
      expect(page).to have_content '24 Kg'
      expect(page).to have_content 'R$ 0.32'
      expect(page).not_to have_content '7 Kg'
      expect(page).not_to have_content '12 Kg'
      expect(page).not_to have_content 'R$ 0.16'
    end
  end
end