require 'rails_helper'

fdescribe "View orders" do
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
      ############ ADDRESS #############
      for i in 1..3 do
        Address.create!(
          person: "recipient",
          address_one: "Av Paulista, 100#{i}",
          address_two: "Bela Vista",
          city: "São Paulo",
          state: "SP",
          zip: "10000-10#{i}"
        )
        Address.create!(
          person: "sender",
          address_one: "Av Atlântica, 200#{i}",
          address_two: "Copacabana",
          city: "Rio de Janeiro",
          state: "RJ",
          zip: "20000-20#{i}"
        )
      end

      ############ ORDERS #############
      for i in 1..5 do
        Order.create!(
          code: "LOG700#{i}",
          distance: 100 * i,
          status: i
        )
      end

      ############ PRODUCTS #############
      for i in 1..3 do
        Product.create!(
          code: "ABC100#{i}",
          width: 50 * i,
          height: 30 * i,
          depth: 10 * i,
          weight: 100 * i,
          order_id: i
        )
        Product.create!(
          code: "ABC200#{i}",
          width: 40 * i,
          height: 20 * i,
          depth: 5 * i,
          weight: 50 * i,
          order_id: i + 1
        )
        Product.create!(
          code: "ABC300#{i}",
          width: 70 * i,
          height: 50 * i,
          depth: 30 * i,
          weight: 150 * i,
          order_id: i + 2
        )
      end

      #Act
      visit root_path
      click_on 'Pedidos'
      #Assert
      expect(page).to have_content 'Código'
      expect(page).to have_content 'Data'
      expect(page).to have_content 'Volumes (un)'
      expect(page).to have_content 'Peso (Kg)'
      expect(page).to have_content 'Distância (Km)'
      expect(page).to have_content 'Status'
      expect(page).to have_content 'LOG7001'
      expect(page).to have_content 'LOG7002'
      expect(page).to have_content 'LOG7003'
      expect(page).to have_content 'LOG7004'  
      expect(page).to have_content 'LOG7005'
      expect(page).to have_content Date.today.strftime("%d/%m/%Y")
      expect(page).to have_content '100'
      expect(page).to have_content '300'
      expect(page).to have_content '500'
      expect(page).to have_content '550'
      expect(page).to have_content 'Aguardando'
      expect(page).to have_content 'Enviado'
      expect(page).to have_content 'Entregue'
      expect(page).to have_content 'Cancelado'
      expect(page).to have_content 'Retornado'
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
      user = User.create!(
        name: "Usuario 1",
        email: "usuario1@email.com",
        password: '123456',
        role: "user"
      )

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
      ############ ADDRESS #############
      for i in 1..3 do
        Address.create!(
          person: "recipient",
          address_one: "Av Paulista, 100#{i}",
          address_two: "Bela Vista",
          city: "São Paulo",
          state: "SP",
          zip: "10000-10#{i}"
        )
        Address.create!(
          person: "sender",
          address_one: "Av Atlântica, 200#{i}",
          address_two: "Copacabana",
          city: "Rio de Janeiro",
          state: "RJ",
          zip: "20000-20#{i}"
        )
      end

      ############ ORDERS #############
      for i in 1..5 do
        Order.create!(
          code: "LOG700#{i}",
          distance: 100 * i,
          status: i
        )
      end

      ############ PRODUCTS #############
      for i in 1..3 do
        Product.create!(
          code: "ABC100#{i}",
          width: 50 * i,
          height: 30 * i,
          depth: 10 * i,
          weight: 100 * i,
          order_id: i
        )
        Product.create!(
          code: "ABC200#{i}",
          width: 40 * i,
          height: 20 * i,
          depth: 5 * i,
          weight: 50 * i,
          order_id: i + 1
        )
        Product.create!(
          code: "ABC300#{i}",
          width: 70 * i,
          height: 50 * i,
          depth: 30 * i,
          weight: 150 * i,
          order_id: i + 2
        )
      end

      #Act
      visit root_path
      click_on 'Pedidos'
      #Assert
      expect(page).to have_content 'Código'
      expect(page).to have_content 'Data'
      expect(page).to have_content 'Volumes (un)'
      expect(page).to have_content 'Peso (Kg)'
      expect(page).to have_content 'Distância (Km)'
      expect(page).to have_content 'Status'
      expect(page).to have_content 'LOG7001'
      expect(page).to have_content 'LOG7002'
      expect(page).to have_content 'LOG7003'
      expect(page).to have_content 'LOG7004'  
      expect(page).to have_content 'LOG7005'
      expect(page).to have_content Date.today.strftime("%d/%m/%Y")
      expect(page).to have_content '100'
      expect(page).to have_content '300'
      expect(page).to have_content '500'
      expect(page).to have_content '550'
      expect(page).to have_content 'Aguardando'
      expect(page).to have_content 'Enviado'
      expect(page).to have_content 'Entregue'
      expect(page).to have_content 'Cancelado'
      expect(page).to have_content 'Retornado'
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