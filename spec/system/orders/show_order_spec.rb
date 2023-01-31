require 'rails_helper'

describe "Show order" do
  context "user not authenticated" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user" )

      Address.create!(person: "sender", address_one: "Av Atlântica, 2002", address_two: "Copacabana", 
                      city: "Rio de Janeiro", state: "RJ", zip: "20000-202")
      Address.create!(person: "recipient", address_one: "Av Paulista, 1001", address_two: "Bela Vista", 
                      city: "São Paulo", state: "SP", zip: "10000-101")

      @order = Order.create!(distance: 100)

      OrderAddress.create!(order_id: 1, address_id: 1)
      OrderAddress.create!(order_id: 1, address_id: 2)

      Product.create!(width: 50, height: 30, depth: 10, weight: 100)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)

      OrderProduct.create!(order_id: 1, product_id: 1)
      OrderProduct.create!(order_id: 1, product_id: 2)
      OrderProduct.create!(order_id: 1, product_id: 3)
    end

    it "click on section link" do
      #Act
      visit root_path
      click_on 'Ordens de Entrega'
      click_on @order.code
      #Assert
      expect(current_path).to eq order_path(@order.id)
      expect(page).to have_button 'Voltar'
    end
    
    it "visit section directly" do
      visit order_path(@order.id)
      expect(current_path).to eq order_path(@order.id)
    end

    it "successfully" do
      #Act
      visit root_path
      click_on 'Ordens de Entrega'
      click_on @order.code
      #Assert 
      expect(page).to have_content "Ordem de Entrega #{Order.last.code}"
      expect(page).to have_button 'Voltar'
      within('div.orders__status h3') do
        expect(page).to have_content 'Status: Aberto'
      end
      within('div.orders__products') do
        within('h3') do
          expect(page).to have_content 'Produto'
        end
        within('table thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Largura (cm)'
          expect(page).to have_content 'Altura (cm)'
          expect(page).to have_content 'Profundidade (cm)'
          expect(page).to have_content 'Peso (Kg)'
        end
        within('table tbody tr:nth-child(1)') do
          expect(page).to have_content Product.first.code
          expect(page).to have_content '50 cm'
          expect(page).to have_content '30 cm'
          expect(page).to have_content '10 cm'
          expect(page).to have_content '100 Kg'
        end
      end

      within('div.orders__addresses div:nth-child(1)') do
        within('h3') do
          expect(page).to have_content 'Endereço de Retirada'
        end
        within('table tr:nth-child(1)') do
          expect(page).to have_content 'Endereço Av Atlântica, 2002'
        end
        within('table tr:nth-child(2)') do
          expect(page).to have_content 'Complemento Copacabana'
        end
        within('table tr:nth-child(3)') do
          expect(page).to have_content 'Cidade Rio de Janeiro-RJ'
        end
        within('table tr:nth-child(4)') do
          expect(page).to have_content 'CEP 20000-202'
        end
      end

      within('div.orders__addresses div:nth-child(2)') do
        within('h3') do
          expect(page).to have_content 'Endereço de Entrega'
        end
        within('table tr:nth-child(1)') do
          expect(page).to have_content 'Endereço Av Paulista, 1001'
        end
        within('table tr:nth-child(2)') do
          expect(page).to have_content 'Complemento Bela Vista'
        end
        within('table tr:nth-child(3)') do
          expect(page).to have_content 'Cidade São Paulo-SP'
        end
        within('table tr:nth-child(4)') do
          expect(page).to have_content 'CEP 10000-101'
        end
      end

      within('div table.orders__table tr') do
        expect(page).to have_content 'Distância'
        expect(page).to have_content '100 Km'
      end
    end

    it "returns to orders page" do
      #Act
      visit root_path
      click_on 'Ordens de Entrega'
      click_on @order.code
      click_on 'Voltar'
      #Assert
      expect(current_path).to eq orders_path
    end
  end

  context "user authenticated" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user" )

      Address.create!(person: "sender", address_one: "Av Atlântica, 2002", address_two: "Copacabana", 
                      city: "Rio de Janeiro", state: "RJ", zip: "20000-202")
      Address.create!(person: "recipient", address_one: "Av Paulista, 1001", address_two: "Bela Vista", 
                      city: "São Paulo", state: "SP", zip: "10000-101")

      @order = Order.create!(distance: 100)

      OrderAddress.create!(order_id: 1, address_id: 1)
      OrderAddress.create!(order_id: 1, address_id: 2)

      Product.create!(width: 50, height: 30, depth: 10, weight: 100)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)

      OrderProduct.create!(order_id: 1, product_id: 1)
      OrderProduct.create!(order_id: 1, product_id: 2)
      OrderProduct.create!(order_id: 1, product_id: 3)
      login_as(user)
    end

    it "successfully" do
      #Act
      visit root_path
      click_on 'Ordens de Entrega'
      click_on @order.code
      #Assert 
      expect(page).to have_content "Ordem de Entrega #{Order.last.code}"
      expect(page).to have_button 'Voltar'
      within('div.orders__status h3') do
        expect(page).to have_content 'Status: Aberto'
      end
      within('div.orders__products') do
        within('h3') do
          expect(page).to have_content 'Produto'
        end
        within('table thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Largura (cm)'
          expect(page).to have_content 'Altura (cm)'
          expect(page).to have_content 'Profundidade (cm)'
          expect(page).to have_content 'Peso (Kg)'
        end
        within('table tbody tr:nth-child(1)') do
          expect(page).to have_content Product.first.code
          expect(page).to have_content '50 cm'
          expect(page).to have_content '30 cm'
          expect(page).to have_content '10 cm'
          expect(page).to have_content '100 Kg'
        end
      end

      within('div.orders__addresses div:nth-child(1)') do
        within('h3') do
          expect(page).to have_content 'Endereço de Retirada'
        end
        within('table tr:nth-child(1)') do
          expect(page).to have_content 'Endereço Av Atlântica, 2002'
        end
        within('table tr:nth-child(2)') do
          expect(page).to have_content 'Complemento Copacabana'
        end
        within('table tr:nth-child(3)') do
          expect(page).to have_content 'Cidade Rio de Janeiro-RJ'
        end
        within('table tr:nth-child(4)') do
          expect(page).to have_content 'CEP 20000-202'
        end
      end

      within('div.orders__addresses div:nth-child(2)') do
        within('h3') do
          expect(page).to have_content 'Endereço de Entrega'
        end
        within('table tr:nth-child(1)') do
          expect(page).to have_content 'Endereço Av Paulista, 1001'
        end
        within('table tr:nth-child(2)') do
          expect(page).to have_content 'Complemento Bela Vista'
        end
        within('table tr:nth-child(3)') do
          expect(page).to have_content 'Cidade São Paulo-SP'
        end
        within('table tr:nth-child(4)') do
          expect(page).to have_content 'CEP 10000-101'
        end
      end

      within('div table.orders__table tr') do
        expect(page).to have_content 'Distância'
        expect(page).to have_content '100 Km'
      end
    end

    it "returns to orders page" do
      #Act
      visit root_path
      click_on 'Ordens de Entrega'
      click_on @order.code
      click_on 'Voltar'
      #Assert
      expect(current_path).to eq orders_path
    end
  end
end