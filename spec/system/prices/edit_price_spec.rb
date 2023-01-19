require 'rails_helper'

describe "Edit price" do
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
      Price.create!(
        min_weight: 5 * i,
        max_weight: 10 * i,
        price_per_km: 0.11 * i,
        mode_id: 1
      )
      Price.create!(
        min_weight: 7 * i,
        max_weight: 12 * i,
        price_per_km: 0.16 * i,
        mode_id: 2
      )
    end
  end

  it "view page and form" do
    #Act
    visit root_path
    click_on "Preços"
    page.all('button.btn-warning')[1].click
    #Assert
    expect(current_path).to eq edit_price_path(2)
    expect(page).to have_field 'Peso Mínimo (Kg)'
    expect(page).to have_field 'Peso Máximo (Kg)'
    expect(page).to have_field 'Preço por Km (R$)'
    expect(page).to have_field 'Modalidade'
  end

  it "successfully" do
    #Act
    visit root_path
    click_on "Preços"
    page.all('button.btn-warning')[1].click
    fill_in "Peso Mínimo (Kg)",	with: "99"
    fill_in "Peso Máximo (Kg)",	with: "199"
    fill_in "Preço por Km (R$)",	with: "0.99"
    select "Modalidade 3", from: "Modalidade"
    click_on "Salvar"
    #Assert
    expect(page).to have_content 'Peso'
    expect(page).to have_content 'Preço por Km'
    expect(page).to have_content 'Modalidade'
    expect(page).to have_content 'Ações'
    expect(page).to have_content 'Editar'
    expect(page).to have_content 'Apagar'
    expect(page).to have_content '5 Kg'
    expect(page).to have_content '10 Kg'
    expect(page).to have_content 'R$ 0.11'
    expect(page).to have_content 'Modalidade 1'
    expect(page).to have_content '99 Kg'
    expect(page).to have_content '199 Kg'
    expect(page).to have_content 'R$ 0.99'
    expect(page).to have_content 'Modalidade 3'
  end
end