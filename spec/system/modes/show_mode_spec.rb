require 'rails_helper'

describe "Show modes" do
  before(:each) do
    #Arrange
    Mode.create!(
      name: "Modalidade 1",
      min_distance: 1,
      max_distance: 20,
      min_weight: 1,
      max_weight: 20,
      fixed_fee: 5,
      active: true
    )
  end

  it "successfully" do
    #Act
    visit root_path
    click_on 'Modalidades'
    click_on 'Modalidade 1'
    #Assert
    expect(page).to have_content 'Nome Modalidade 1'
    expect(page).to have_content 'Distância Mínima 1 Km'
    expect(page).to have_content 'Distância Máxima 20 Km'
    expect(page).to have_content 'Peso Mínimo 1 Kg'
    expect(page).to have_content 'Peso Máximo 20 Kg'
    expect(page).to have_content 'Taxa fixa R$ 5'
    expect(page).to have_content 'Status Ativo'
  end

  it "returns to modes page" do
    #Act
    visit root_path
    click_on 'Modalidades'
    click_on 'Modalidade 1'
    click_on 'Voltar'
    #Assert
    expect(current_path).to eq modes_path
  end
end