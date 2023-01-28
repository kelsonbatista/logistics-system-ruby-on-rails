require 'rails_helper'

describe "View orders" do
  context "user not authenticated" do
    it "visit section directly" do
      visit orders_path
      expect(current_path).to eq orders_path
    end

    it "visit page" do
      #Act
      visit root_path
      click_on 'Pedidos'
      #Assert
      expect(current_path).to eq orders_path
    end

    it "successfully" do
      #Arrange
      Address.create!(person: "recipient", address_one: "Av Paulista, 1001", address_two: "Bela Vista", 
                      city: "São Paulo", state: "SP", zip: "10000-101")
      Address.create!(person: "sender", address_one: "Av Atlântica, 2002", address_two: "Copacabana", 
                      city: "Rio de Janeiro", state: "RJ", zip: "20000-202")

      order = Order.create!(distance: 100)

      OrderAddress.create!(order_id: 1, address_id: 1)
      OrderAddress.create!(order_id: 1, address_id: 2)

      Product.create!(width: 50, height: 30, depth: 10, weight: 100)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)

      OrderProduct.create!(order_id: 1, product_id: 1)
      OrderProduct.create!(order_id: 1, product_id: 2)
      OrderProduct.create!(order_id: 1, product_id: 3)

      #Act
      visit root_path
      click_on 'Pedidos'
      #Assert
      within('div.orders__products') do
        within('table thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Data'
          expect(page).to have_content 'Volumes (un)'
          expect(page).to have_content 'Peso (Kg)'
          expect(page).to have_content 'Status'
        end
        within('table tbody tr:nth-child(1)') do
          expect(page).to have_content order.code
          expect(page).to have_content Date.today.strftime("%d/%m/%Y")
          expect(page).to have_content '3'
          expect(page).to have_content '600'
          expect(page).to have_content 'Pendente'
        end
      end
    end

    it "no registered orders" do
      #Act
      visit root_path
      click_on 'Pedidos'
      #Assert
      expect(page).to have_content 'Nenhum pedido registrado'
    end
  end

  context "user authenticated" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user" )
      login_as(user)
    end

    it "visit section directly" do
      visit orders_path
      expect(current_path).to eq orders_path
    end

    it "visit page" do
      #Act
      visit root_path
      click_on 'Pedidos'
      #Assert
      expect(current_path).to eq orders_path
    end

    it "successfully" do
      #Arrange
      Address.create!(person: "recipient", address_one: "Av Paulista, 1001", address_two: "Bela Vista", 
                      city: "São Paulo", state: "SP", zip: "10000-101")
      Address.create!(person: "sender", address_one: "Av Atlântica, 2002", address_two: "Copacabana", 
                      city: "Rio de Janeiro", state: "RJ", zip: "20000-202")

      order = Order.create!(distance: 100)

      OrderAddress.create!(order_id: 1, address_id: 1)
      OrderAddress.create!(order_id: 1, address_id: 2)

      Product.create!(width: 50, height: 30, depth: 10, weight: 100)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)

      OrderProduct.create!(order_id: 1, product_id: 1)
      OrderProduct.create!(order_id: 1, product_id: 2)
      OrderProduct.create!(order_id: 1, product_id: 3)

      #Act
      visit root_path
      click_on 'Pedidos'
      #Assert
      within('div.orders__products') do
        within('table thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Data'
          expect(page).to have_content 'Volumes (un)'
          expect(page).to have_content 'Peso (Kg)'
          expect(page).to have_content 'Status'
        end
        within('table tbody tr:nth-child(1)') do
          expect(page).to have_content order.code
          expect(page).to have_content Date.today.strftime("%d/%m/%Y")
          expect(page).to have_content '3'
          expect(page).to have_content '600'
          expect(page).to have_content 'Pendente'
        end
      end
    end

    it "no registered orders" do
      #Act
      visit root_path
      click_on 'Pedidos'
      #Assert
      expect(page).to have_content 'Nenhum pedido registrado'
    end
  end
end