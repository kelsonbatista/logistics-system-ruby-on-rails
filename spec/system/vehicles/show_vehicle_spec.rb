require 'rails_helper'

describe "Show vehicle" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Veículos'
    end
    
    it "visit section directly" do
      visit vehicle_path(1)
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
          name: "Mode #{i}",
          min_distance: 10 * i,
          max_distance: 100 * i,
          min_weight: 1 * i,
          max_weight: 100 * i,
          fixed_fee: 50 * i,
          active: true
        )
      end

      for i in 1..3 do
        Vehicle.create!(
          plate: "ABC-123#{i}",
          brand: "Marca #{i}",
          model: "Modelo #{i}",
          category: "Categoria #{i}",
          year: "201#{i}",
          capacity: 100 * i,
          status: "operational",
          mode_id: 1
        )
      end

      login_as(user)
    end

    it "sucessfully" do
      #Act
      visit root_path
      click_on "Veículos"
      click_on "ABC-1231"
      #Assert
      expect(current_path).to eq vehicle_path(1)
      expect(page).to have_content "Placa ABC-1231"
      expect(page).to have_content "Marca Marca 1"
      expect(page).to have_content "Modelo Modelo 1"
      expect(page).to have_content "Categoria Categoria 1"
      expect(page).to have_content "Ano 2011"
      expect(page).to have_content "Capacidade 100 Kg"
      expect(page).to have_content "Status Em operação"
    end

    it "return to vehicles page" do
      #Act
      visit root_path
      click_on "Veículos"
      click_on "ABC-1232"
      click_on "Voltar"
      #Assert
      expect(current_path).to eq vehicles_path
    end
  end
end