require 'rails_helper'

describe "Create order" do
  context "user not authenticated" do
    it "click on section link" do
      visit root_path
      expect(current_path).not_to have_content 'Ordens de Entrega'
    end
    
    it "visit section directly" do
      visit new_order_path
      expect(current_path).to eq new_user_session_path
    end
  end

  context "user authenticated" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user" )
      login_as(user)
    end

    it "view page and form" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('section div div.page__top') do
        click_on 'Nova Ordem de Entrega'
      end
      #Assert
      expect(current_path).to eq new_order_path
      within('section div h1') do
        expect(page).to have_content 'Nova Ordem de Entrega'
      end
      within('section div.orders') do
        expect(page).to have_button 'Voltar'
      end
      within('div table') do
        expect(page).to have_field 'Distância'
      end
      within('div.orders__btn') do
        expect(page).to have_button 'Próximo'
      end
    end

    it "successfully" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('section div div.page__top') do
        click_on 'Nova Ordem de Entrega'
      end
      #Act - Distance
      within('div table') do
        fill_in "Distância",	with: '100'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Recipient Address
      within('div table') do
        fill_in "Endereço",	with: 'Av Atlântica, 2000'
        fill_in "Complemento",	with: 'Copacabana'
        fill_in "Cidade",	with: 'Rio de Janeiro'
        find('#address_state').find(:option, 'RJ').select_option
        fill_in "CEP",	with: '20000-200'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Sender Address
      within('div table') do
        fill_in "Endereço",	with: 'Av Paulista, 1000'
        fill_in "Complemento",	with: 'Bela Vista'
        fill_in "Cidade",	with: 'São Paulo'
        find('#address_state').find(:option, 'SP').select_option
        fill_in "CEP",	with: '10000-100'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Product
      within('div table') do
        find("#product_width").set('100')
        find("#product_height").set('200')
        find("#product_depth").set('50')
        find("#product_weight").set('500')
      end
      within('div.orders__btn') do
        click_on 'Salvar'
      end
      #Assert
      expect(current_path).to eq order_path(Order.last)
      within('div.notice') do
        expect(page).to have_content 'Ordem de entrega registrada com sucesso'
      end
      within('section div h1') do
        expect(page).to have_content "Ordem de Entrega #{Order.last.code}"
      end
      within('section div div.page__top') do
        expect(page).to have_button 'Voltar'
      end
      within('div.order__status h3') do
        expect(page).to have_content 'Status: Pendente'
      end
      within('div.order__block') do
        expect(page).to have_content 'Produto'
        within('table thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Largura (cm)'
          expect(page).to have_content 'Altura (cm)'
          expect(page).to have_content 'Profundidade (cm)'
          expect(page).to have_content 'Peso (Kg)'
        end
        within('table tbody tr:nth-child(1)') do
          expect(page).to have_content Product.last.code
          expect(page).to have_content '100 cm'
          expect(page).to have_content '200 cm'
          expect(page).to have_content '50 cm'
          expect(page).to have_content '500 Kg'
        end
      end

      within('div.order__block-flex div:nth-child(1)') do
        within('h3') do
          expect(page).to have_content 'Endereço de Retirada'
        end
        within('table tr:nth-child(1)') do
          expect(page).to have_content 'Endereço'
          expect(page).to have_content 'Av Paulista, 1000'
        end
        within('table tr:nth-child(2)') do
          expect(page).to have_content 'Complemento'
          expect(page).to have_content 'Bela Vista'
        end
        within('table tr:nth-child(3)') do
          expect(page).to have_content 'Cidade'
          expect(page).to have_content 'São Paulo-SP'
        end
        within('table tr:nth-child(4)') do
          expect(page).to have_content 'CEP'
          expect(page).to have_content '10000-100'
        end
      end

      within('div.order__block-flex div:nth-child(2)') do
        within('h3') do
          expect(page).to have_content 'Endereço de Entrega'
        end
        within('table tr:nth-child(1)') do
          expect(page).to have_content 'Endereço'
          expect(page).to have_content 'Av Atlântica, 2000'
        end
        within('table tr:nth-child(2)') do
          expect(page).to have_content 'Complemento'
          expect(page).to have_content 'Copacabana'
        end
        within('table tr:nth-child(3)') do
          expect(page).to have_content 'Cidade'
          expect(page).to have_content 'Rio de Janeiro-RJ'
        end
        within('table tr:nth-child(4)') do
          expect(page).to have_content 'CEP'
          expect(page).to have_content '20000-200'
        end
      end

      within('div table.orders__table tr') do
        expect(page).to have_content 'Distância'
        expect(page).to have_content '100 Km'
      end
    end

    it "not empty fields - distance" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('section div div.page__top') do
        click_on 'Nova Ordem de Entrega'
      end
      #Act - Distance
      within('div table') do
        fill_in "Distância",	with: ''
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Assert
      expect(page).to have_content 'Distância não pode ficar em branco'
    end

    it "not empty fields - sender address" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('section div div.page__top') do
        click_on 'Nova Ordem de Entrega'
      end
      #Act - Distance
      within('div table') do
        fill_in "Distância",	with: '100'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Sender Address
      within('div table') do
        fill_in "Endereço",	with: ''
        fill_in "Complemento",	with: ''
        fill_in "Cidade",	with: ''
        find('#address_state').find(:option, '').select_option
        fill_in "CEP",	with: ''
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Assert
      within('div.messages ul') do
        expect(page).to have_content 'Endereço não pode ficar em branco'
        expect(page).to have_content 'Cidade não pode ficar em branco'
        expect(page).to have_content 'Estado não pode ficar em branco'
        expect(page).to have_content 'CEP não pode ficar em branco'
      end
    end

    it "not empty fields - sender address" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('section div div.page__top') do
        click_on 'Nova Ordem de Entrega'
      end
      #Act - Distance
      within('div table') do
        fill_in "Distância",	with: '100'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Sender Address
      within('div table') do
        fill_in "Endereço",	with: 'Av Paulista, 1000'
        fill_in "Complemento",	with: 'Bela Vista'
        fill_in "Cidade",	with: 'São Paulo'
        find('#address_state').find(:option, 'SP').select_option
        fill_in "CEP",	with: '10000-100'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Recipient Address
      within('div table') do
        fill_in "Endereço",	with: ''
        fill_in "Complemento",	with: ''
        fill_in "Cidade",	with: ''
        find('#address_state').find(:option, '').select_option
        fill_in "CEP",	with: ''
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Assert
      within('div.messages ul') do
        expect(page).to have_content 'Endereço não pode ficar em branco'
        expect(page).to have_content 'Cidade não pode ficar em branco'
        expect(page).to have_content 'Estado não pode ficar em branco'
        expect(page).to have_content 'CEP não pode ficar em branco'
      end
    end

    it "not empty fields - sender address" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('section div div.page__top') do
        click_on 'Nova Ordem de Entrega'
      end
      #Act - Distance
      within('div table') do
        fill_in "Distância",	with: '100'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Sender Address
      within('div table') do
        fill_in "Endereço",	with: 'Av Paulista, 1000'
        fill_in "Complemento",	with: 'Bela Vista'
        fill_in "Cidade",	with: 'São Paulo'
        find('#address_state').find(:option, 'SP').select_option
        fill_in "CEP",	with: '10000-100'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Recipient Address
      within('div table') do
        fill_in "Endereço",	with: 'Av Atlântica, 2000'
        fill_in "Complemento",	with: 'Copacabana'
        fill_in "Cidade",	with: 'Rio de Janeiro'
        find('#address_state').find(:option, 'RJ').select_option
        fill_in "CEP",	with: '20000-200'
      end
      within('div.orders__btn') do
        click_on 'Próximo'
      end
      #Act - Product
      within('div table') do
        find("#product_width").set('')
        find("#product_height").set('')
        find("#product_depth").set('')
        find("#product_weight").set('')
      end
      within('div.orders__btn') do
        click_on 'Salvar'
      end
      #Assert
      within('div.messages ul') do
        expect(page).to have_content 'Largura não pode ficar em branco'
        expect(page).to have_content 'Altura não pode ficar em branco'
        expect(page).to have_content 'Profundidade não pode ficar em branco'
        expect(page).to have_content 'Peso não pode ficar em branco'
      end
    end
  end
end