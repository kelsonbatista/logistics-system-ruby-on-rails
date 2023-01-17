require 'rails_helper'

describe "Show vehicle" do
  before(:each) do
    #Arrange
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