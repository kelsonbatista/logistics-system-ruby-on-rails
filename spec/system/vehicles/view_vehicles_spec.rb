require 'rails_helper'

describe "View vehicles" do
  it "visit page" do
    #Act
    visit root_path
    visit vehicles_path
    #Assert
    expect(current_path).to eq vehicles_path
  end

  it "successfully" do
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
    #Act
    visit root_path
    visit vehicles_path
    #Assert
    expect(page).to have_content 'Veículos'
    expect(page).to have_content 'Modelo'
    expect(page).to have_content 'Placa'
    expect(page).to have_content 'Categoria'
    expect(page).to have_content 'Status'
    expect(page).to have_content 'Modelo 1'
    expect(page).to have_content 'ABC-1231'
    expect(page).to have_content 'Categoria 1'
    expect(page).to have_content 'Modelo 2'
    expect(page).to have_content 'ABC-1232'
    expect(page).to have_content 'Categoria 2'
    expect(page).to have_content 'Modelo 3'
    expect(page).to have_content 'ABC-1233'
    expect(page).to have_content 'Categoria 3'
    expect(page).to have_content 'Em operação'
  end

  it "no registered vehicles" do
    #Act
    visit root_path
    visit vehicles_path
    #Assert
    expect(page).to have_content 'Nenhum veículo cadastrado'
  end
end