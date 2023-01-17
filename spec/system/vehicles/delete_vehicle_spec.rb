require 'rails_helper'

describe "Delete vehicle" do
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

    for i in 1..3 do
      Vehicle.create!(
        plate: "ABC-123#{i}",
        brand: "Marca #{i}",
        model: "Modelo #{i}",
        category: "Categoria #{i}",
        year: "201#{i}",
        capacity: 100 * i,
        status: true,
        mode_id: 1
      )
    end
  end

  it "sucessfully" do
    #Act
    visit root_path
    click_on "Veículos"
    click_on "ABC-1231"
    click_on "Apagar"
    #Assert
    expect(current_path).to eq vehicles_path
    expect(page).to have_content "Veículos"
    expect(page).to have_content "Placa"
    expect(page).to have_content "Modelo"
    expect(page).to have_content "Categoria"
    expect(page).to have_content "Status"
    expect(page).to have_content "ABC-1232"
    expect(page).to have_content "ABC-1233"
    expect(page).not_to have_content "ABC-1231"
  end
end