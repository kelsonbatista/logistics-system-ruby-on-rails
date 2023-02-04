require 'rails_helper'

describe "View deadlines" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Prazos'
    end
    
    it "visit section directly" do
      visit deadlines_path
      expect(current_path).to eq new_user_session_path
    end
  end

  context "user authenticated" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user")

      login_as(user)
    end

    it "visit page" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(6)') do
        click_on 'Prazos'
      end
      #Assert
      expect(current_path).to eq deadlines_path
    end

    it "successfully" do
      #Arrange
      Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
                  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)

      Mode.create!(name: "Super Pack", min_distance: 10, max_distance: 500, 
                  min_weight: 5, max_weight: 20, fixed_fee: 40, active: false)

      Mode.create!(name: "Mega Pack", min_distance: 10, max_distance: 300, 
                  min_weight: 10, max_weight: 40, fixed_fee: 60, active: true)

      Deadline.create!(min_distance: 1, max_distance: 100, deadline: 10, mode_id: 1)
      Deadline.create!(min_distance: 15, max_distance: 200, deadline: 5, mode_id: 2)
      Deadline.create!(min_distance: 22, max_distance: 300, deadline: 7, mode_id: 3)
      #Act
      visit root_path
      within('div ul.nav li:nth-child(6)') do
        click_on 'Prazos'
      end
      #Assert
      within('table thead tr') do
        expect(page).to have_content 'Distância'
        expect(page).to have_content 'Prazo'
        expect(page).to have_content 'Modalidade'
        expect(page).to have_content 'Ações'
      end
      within('table tbody tr:nth-child(1)') do
        expect(page).to have_content '1 Km'
        expect(page).to have_content '100 Km'
        expect(page).to have_content '10 hs'
        expect(page).to have_content 'Light Pack'
        expect(page).to have_button 'Editar'
        expect(page).to have_button 'Apagar'
      end
      within('table tbody tr:nth-child(2)') do
        expect(page).to have_content '15 Km'
        expect(page).to have_content '200 Km'
        expect(page).to have_content '5 hs'
        expect(page).to have_content 'Super Pack'
        expect(page).to have_button 'Editar'
        expect(page).to have_button 'Apagar'
      end
      within('table tbody tr:nth-child(3)') do
        expect(page).to have_content '22 Km'
        expect(page).to have_content '300 Km'
        expect(page).to have_content '7 hs'
        expect(page).to have_content 'Mega Pack'
        expect(page).to have_button 'Editar'
        expect(page).to have_button 'Apagar'
      end
    end

    it "no registered deadlines" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(6)') do
        click_on 'Prazos'
      end
      #Assert
      expect(page).to have_content 'Nenhum prazo cadastrado'
    end
  end
end