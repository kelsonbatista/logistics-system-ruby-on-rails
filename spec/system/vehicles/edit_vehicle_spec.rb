require 'rails_helper'

describe "Edit vehicle" do
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

  it "view page and form" do
    #Act
    visit root_path
    click_on "Veículos"
    click_on "ABC-1231"
    click_on "Editar"
    #Assert
    expect(current_path).to eq edit_vehicle_path(1)
    expect(page).to have_content "Editar Veículo"
    expect(page).to have_content "Placa"
    expect(page).to have_content "Marca"
    expect(page).to have_content "Modelo"
    expect(page).to have_content "Categoria"
    expect(page).to have_content "Ano"
    expect(page).to have_content "Capacidade"
    expect(page).to have_content "Status"
  end

  it "successfully" do
    #Act
    visit root_path
    click_on "Veículos"
    click_on "ABC-1231"
    click_on "Editar"
    select "Modalidade 3", from: "Modalidade"
    fill_in "Placa",	with: "ABC-9999" 
    fill_in "Marca",	with: "Marca 9999"
    fill_in "Modelo",	with: "Modelo 9999"
    fill_in "Categoria",	with: "Categoria 9999"
    fill_in "Ano",	with: "2019"
    fill_in "Capacidade",	with: "9999"
    check "Status"
    click_on "Salvar"
    #Assert
    expect(current_path).to eq vehicle_path(1)
    expect(page).to have_content "Veículo"
    expect(page).to have_content "Placa ABC-9999"
    expect(page).to have_content "Marca Marca 9999"
    expect(page).to have_content "Modelo Modelo 9999"
    expect(page).to have_content "Categoria Categoria 9999"
    expect(page).to have_content "Ano 2019"
    expect(page).to have_content "Capacidade 9999"
    expect(page).to have_content "Status Em operação"
  end
end