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
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user")

      Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
                  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)

      Mode.create!(name: "Super Pack", min_distance: 10, max_distance: 500, 
                  min_weight: 5, max_weight: 20, fixed_fee: 40, active: false)

      Mode.create!(name: "Mega Pack", min_distance: 10, max_distance: 300, 
                  min_weight: 10, max_weight: 40, fixed_fee: 60, active: true)

      Price.create!(min_weight: 1, max_weight: 3, price_per_km: 0.11, mode_id: 1)
      Price.create!(min_weight: 5, max_weight: 10, price_per_km: 0.16, mode_id: 2)
      Price.create!(min_weight: 12, max_weight: 17, price_per_km: 0.22, mode_id: 3)

      login_as(user)
    end

    it "sucessfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(5)') do
        click_on 'Preços'
      end
      within('table tbody tr:nth-child(2)') do
        click_on 'Apagar'
      end
      #Assert
      expect(current_path).to eq prices_path
      within('div.notice') do
        expect(page).to have_content 'Preço excluído com sucesso'
      end
      within('table thead tr') do
        expect(page).to have_content 'Peso'
        expect(page).to have_content 'Preço por Km'
        expect(page).to have_content 'Modalidade'
        expect(page).to have_content 'Ações'
      end
      within('table tbody tr:nth-child(1)') do
        expect(page).to have_content '1 Kg'
        expect(page).to have_content '3 Kg'
        expect(page).to have_content 'R$ 0.11'
        expect(page).to have_content 'Light Pack'
        expect(page).to have_button 'Editar'
        expect(page).to have_button 'Apagar'
      end
      within('table tbody tr:nth-child(2)') do
        expect(page).to have_content '12 Kg'
        expect(page).to have_content '17 Kg'
        expect(page).to have_content 'R$ 0.22'
        expect(page).to have_content 'Mega Pack'
        expect(page).to have_button 'Editar'
        expect(page).to have_button 'Apagar'
      end
      expect(page).not_to have_content '5 Kg'
      expect(page).not_to have_content '10 Kg'
      expect(page).not_to have_content 'R$ 0.16'
      expect(page).not_to have_content 'Super Pack'
    end
  end
end