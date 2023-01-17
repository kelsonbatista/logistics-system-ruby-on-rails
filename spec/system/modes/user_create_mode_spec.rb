require 'rails_helper'

describe "Create mode" do
  it "view page and form" do
    #Act
    visit root_path
    click_on 'Modalidades'
    click_on 'Nova Modalidade'
    #Assert
    expect(page).to have_content 'Nova Modalidade'
    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Distância mínima'
    expect(page).to have_field 'Distância máxima'
    expect(page).to have_field 'Peso mínimo'
    expect(page).to have_field 'Peso máximo'
    expect(page).to have_field 'Taxa fixa'
    expect(page).to have_field 'Ativo'
  end

  it "successfully" do
    #Act
    visit root_path
    click_on 'Modalidades'
    click_on 'Nova Modalidade'
    fill_in "Nome",	with: "Modalidade 1"
    fill_in "Distância mínima",	with: '1'
    fill_in "Distância máxima",	with: '20'
    fill_in "Peso mínimo",	with: '1'
    fill_in "Peso máximo",	with: '20'
    fill_in "Taxa fixa",	with: '5'
    check "Ativo"
    click_on 'Salvar'
    #Assert
    expect(page).to have_content 'Modalidade criada com sucesso'  
    expect(page).to have_content 'Modalidade 1'
  end

  it "not empty fields" do
    #Act
    visit root_path
    click_on 'Modalidades'
    click_on 'Nova Modalidade'
    fill_in "Nome",	with: ''
    fill_in "Distância mínima",	with: ''
    fill_in "Distância máxima",	with: ''
    fill_in "Peso mínimo",	with: ''
    fill_in "Peso máximo",	with: ''
    fill_in "Taxa fixa",	with: ''
    check "Ativo"
    click_on 'Salvar'
    #Assert
    expect(page).to have_content 'Erro ao criar a modalidade'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Distância mínima não pode ficar em branco'
    expect(page).to have_content 'Distância máxima não pode ficar em branco'
    expect(page).to have_content 'Peso mínimo não pode ficar em branco'
    expect(page).to have_content 'Peso máximo não pode ficar em branco'
    expect(page).to have_content 'Taxa fixa não pode ficar em branco'
  end
end