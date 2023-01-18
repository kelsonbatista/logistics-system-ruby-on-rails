require 'rails_helper'

describe "Delete mode" do
  before(:each) do
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
  end

  it "sucessfully" do
    #Act
    visit root_path
    click_on "Modalidades"
    click_on "Modalidade 1"
    click_on "Apagar"
    #Assert
    expect(current_path).to eq modes_path
    expect(page).to have_content "Modalidades"
    expect(page).to have_content "Nome"
    expect(page).to have_content "Distância Mínima (Km)"
    expect(page).to have_content "Distância Máxima (Km)"
    expect(page).to have_content "Status"
    expect(page).to have_content "Modalidade 2"
    expect(page).to have_content "Modalidade 3"
    expect(page).not_to have_content "Modalidade 1"
  end
end