require 'rails_helper'

fdescribe "Create price" do
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
    click_on 'Preços'
    click_on 'Novo Preço'
    #Assert
    expect(page).to have_content 'Novo Preço'
    expect(page).to have_field 'Peso Mínimo (Kg)'
    expect(page).to have_field 'Peso Máximo (Kg)'
    expect(page).to have_field 'Preço (R$)'
    expect(page).to have_field 'Modalidade'
    expect(page).to have_button 'Salvar'
  end

  it "successfully" do
    #Act
    visit root_path
    click_on 'Preços'
    click_on 'Novo Preço'
    fill_in "Peso Mínimo (Kg)",	with: '11'
    fill_in "Peso Máximo (Kg)",	with: '20'
    fill_in "Preço (R$)",	with: "0.55"
    select "Modalidade 2", from: "Modalidade"
    click_on 'Salvar'
    #Assert
    expect(current_path).to eq prices_path
    expect(page).to have_content 'Preço cadastrado com sucesso'  
    expect(page).to have_content 'Peso'
    expect(page).to have_content 'Preço por Km'
    expect(page).to have_content 'Modalidade'
    expect(page).to have_content 'Ações'
    expect(page).to have_content '11 Kg'
    expect(page).to have_content '20 Kg'
    expect(page).to have_content 'R$ 0.55'
    expect(page).to have_content 'Modalidade 2'
    expect(page).to have_content 'Editar'
    expect(page).to have_content 'Apagar'
  end

  it "not empty fields" do
    #Act
    visit root_path
    click_on 'Preços'
    click_on 'Novo Preço'
    fill_in "Peso Mínimo (Kg)",	with: ''
    fill_in "Peso Máximo (Kg)",	with: ''
    fill_in "Preço (R$)",	with: ''
    select "Modalidade 2", from: "Modalidade"
    click_on 'Salvar'
    #Assert
    expect(page).to have_content 'Erro ao cadastrar preço'
    expect(page).to have_content 'Peso Mínimo não pode ficar em branco'
    expect(page).to have_content 'Peso Máximo não pode ficar em branco'
    expect(page).to have_content 'Preço por Km não pode ficar em branco'
  end
end