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
    expect(page).to have_content 'Modalidade: Modalidade 1'
    expect(page).to have_content 'Distância: de 1 até 20'
    expect(page).to have_content 'Peso: de 1 até 20'
    expect(page).to have_content 'Taxa fixa: R$ 5'
    expect(page).to have_content 'Ativo: true'
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