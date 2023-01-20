require 'rails_helper'

describe "Edit deadline" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Prazos'
    end
    
    it "visit section directly" do
      visit edit_deadline_path(1)
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
        Deadline.create!(
          min_distance: 5 * i,
          max_distance: 10 * i,
          deadline: 15 * i,
          mode_id: 1
        )
        Deadline.create!(
          min_distance: 7 * i,
          max_distance: 13 * i,
          deadline: 17 * i,
          mode_id: 2
        )
      end

      login_as(user)
    end

    it "view page and form" do
      #Act
      visit root_path
      click_on "Prazos"
      page.all('button.btn-warning')[1].click
      #Assert
      expect(current_path).to eq edit_deadline_path(2)
      expect(page).to have_field 'Distância Mínima (Km)'
      expect(page).to have_field 'Distância Máxima (Km)'
      expect(page).to have_field 'Prazo (hs)'
      expect(page).to have_field 'Modalidade'
    end

    it "successfully" do
      #Act
      visit root_path
      click_on "Prazos"
      page.all('button.btn-warning')[1].click
      fill_in "Distância Mínima (Km)",	with: "99"
      fill_in "Distância Máxima (Km)",	with: "199"
      fill_in "Prazo (hs)",	with: "24"
      select "Modalidade 3", from: "Modalidade"
      click_on "Salvar"
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
      expect(page).to have_content '99 Km'
      expect(page).to have_content '199 Km'
      expect(page).to have_content '24 hs'
      expect(page).to have_content 'Modalidade 2'
      expect(page).to have_content 'Modalidade 3'
      expect(page).not_to have_content '7 Km'
      expect(page).not_to have_content '13 Km'
      expect(page).not_to have_content '17 hs'
    end
  end
end