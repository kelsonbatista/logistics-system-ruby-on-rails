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
      user = User.create!(
        name: "Usuario 1",
        email: "usuario1@email.com",
        password: '123456',
        role: "user"
      )

      login_as(user)
    end

    it "visit page" do
      #Act
      visit root_path
      click_on 'Prazos'
      #Assert
      expect(current_path).to eq deadlines_path
    end

    it "successfully" do
      #Arrange
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

      for i in 1..3 do
        Deadline.create!(
          min_distance: 5 * i,
          max_distance: 10 * i,
          deadline: 15 * i,
          mode_id: 1
        )
        Deadline.create!(
          min_distance: 8 * i,
          max_distance: 14 * i,
          deadline: 18 * i,
          mode_id: 2
        )
      end

      #Act
      visit root_path
      click_on 'Prazos'
      #Assert
      expect(page).to have_content 'Distância'
      expect(page).to have_content 'Prazo'
      expect(page).to have_content 'Modalidade'
      expect(page).to have_content 'Ações'
      expect(page).to have_content 'Editar'
      expect(page).to have_content 'Apagar'
      expect(page).to have_content '5 Km'
      expect(page).to have_content '10 Km'
      expect(page).to have_content '15 hs'
      expect(page).to have_content 'Modalidade 1'
      expect(page).to have_content '8 Km'
      expect(page).to have_content '14 Km'
      expect(page).to have_content '18 hs'
      expect(page).to have_content 'Modalidade 2'
    end

    it "no registered deadlines" do
      #Act
      visit root_path
      click_on 'Prazos'
      #Assert
      expect(page).to have_content 'Nenhum prazo cadastrado'
    end
  end
end