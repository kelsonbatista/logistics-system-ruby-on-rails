require 'rails_helper'

fdescribe "Edit mode" do
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

  it "view page and form" do
    #Act
    visit root_path
    click_on "Modalidades"
    click_on "Modalidade 1"
    click_on "Editar"
    #Assert
    expect(current_path).to eq edit_mode_path(1)
    expect(page).to have_content "Nome"
    expect(page).to have_content "Distância Mínima (Km)"
    expect(page).to have_content "Distância Máxima (Km)"
    expect(page).to have_content "Peso Mínimo (Kg)"
    expect(page).to have_content "Peso Máximo (Kg)"
    expect(page).to have_content "Taxa fixa (R$)"
    expect(page).to have_content "Status"
  end

  it "successfully" do
    #Act
    visit root_path
    click_on "Modalidades"
    click_on "Modalidade 1"
    click_on "Editar"
    fill_in "Nome",	with: "Modalidade 5" 
    fill_in "Distância Mínima", with: "15"
    fill_in "Distância Máxima (Km)", with: "50"
    fill_in "Peso Mínimo (Kg)",	with: "10"
    fill_in "Peso Máximo (Kg)",	with: "100"
    fill_in "Taxa fixa (R$)",	with: "500"
    check "Status"
    click_on "Salvar"
    #Assert
    expect(current_path).to eq mode_path(1)
    expect(page).to have_content "Nome Modalidade 5"
    expect(page).to have_content "Distância Mínima 15 Km"
    expect(page).to have_content "Distância Máxima 50 Km"
    expect(page).to have_content "Peso Mínimo 10 Kg"
    expect(page).to have_content "Peso Máximo 100 Kg"
    expect(page).to have_content "Taxa fixa R$ 500"
    expect(page).to have_content "Status Ativo"
  end
end