require 'rails_helper'

describe "View orders" do
  context "user not authenticated" do
    it "visit section directly" do
      visit orders_path
      expect(current_path).to eq new_user_session_path
    end

    it "try visit page" do
      visit root_path
      expect(current_path).not_to have_content 'Ordens de Entrega'
    end
  end

  context "user authenticated - registered orders" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user" )

      Address.create!(person: "recipient", address_one: "Av Paulista, 1001", address_two: "Bela Vista", 
                      city: "São Paulo", state: "SP", zip: "10000-101")
      Address.create!(person: "sender", address_one: "Av Atlântica, 2002", address_two: "Copacabana", 
                      city: "Rio de Janeiro", state: "RJ", zip: "20000-202")

      @order_open = Order.create!(distance: 100, status: 'open')
      @order_pending = Order.create!(distance: 100, status: 'pending')
      @order_sent = Order.create!(distance: 100, status: 'sent')
      @order_delivered = Order.create!(distance: 100, status: 'delivered')
      @order_canceled = Order.create!(distance: 100, status: 'canceled')
      @order_returned = Order.create!(distance: 100, status: 'returned')

      OrderAddress.create!(order_id: 1, address_id: 1)
      OrderAddress.create!(order_id: 1, address_id: 2)
      OrderAddress.create!(order_id: 2, address_id: 1)
      OrderAddress.create!(order_id: 2, address_id: 2)
      OrderAddress.create!(order_id: 3, address_id: 1)
      OrderAddress.create!(order_id: 3, address_id: 2)
      OrderAddress.create!(order_id: 4, address_id: 1)
      OrderAddress.create!(order_id: 4, address_id: 2)
      OrderAddress.create!(order_id: 5, address_id: 1)
      OrderAddress.create!(order_id: 5, address_id: 2)
      OrderAddress.create!(order_id: 6, address_id: 1)
      OrderAddress.create!(order_id: 6, address_id: 2)

      Product.create!(width: 50, height: 30, depth: 10, weight: 100)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 200)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 300)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 400)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 500)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 600)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)

      OrderProduct.create!(order_id: 1, product_id: 1)
      OrderProduct.create!(order_id: 1, product_id: 2)
      OrderProduct.create!(order_id: 1, product_id: 3)
      OrderProduct.create!(order_id: 2, product_id: 4)
      OrderProduct.create!(order_id: 2, product_id: 5)
      OrderProduct.create!(order_id: 2, product_id: 6)
      OrderProduct.create!(order_id: 3, product_id: 7)
      OrderProduct.create!(order_id: 3, product_id: 8)
      OrderProduct.create!(order_id: 3, product_id: 9)
      OrderProduct.create!(order_id: 4, product_id: 10)
      OrderProduct.create!(order_id: 4, product_id: 11)
      OrderProduct.create!(order_id: 4, product_id: 12)
      OrderProduct.create!(order_id: 5, product_id: 13)
      OrderProduct.create!(order_id: 5, product_id: 14)
      OrderProduct.create!(order_id: 5, product_id: 15)
      OrderProduct.create!(order_id: 6, product_id: 16)
      OrderProduct.create!(order_id: 6, product_id: 17)
      OrderProduct.create!(order_id: 6, product_id: 18)

      Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
                  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)
      
      Mode.create!(name: "Super Pack", min_distance: 10, max_distance: 500, 
                  min_weight: 5, max_weight: 20, fixed_fee: 40, active: true)
      
      Mode.create!(name: "Mega Pack", min_distance: 10, max_distance: 300, 
                  min_weight: 10, max_weight: 40, fixed_fee: 60, active: true)

      Vehicle.create!(plate: "ABC-1001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
                      year: "2011", capacity: 100, status: 0, mode_id: 1)
  
      Vehicle.create!(plate: "ABC-1002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
                      year: "2012", capacity: 400, status: 0, mode_id: 2)
      
      Vehicle.create!(plate: "ABC-1003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
                      year: "2013", capacity: 1000, status: 0, mode_id: 3)

      Price.create!(min_weight: 1, max_weight: 3, price_per_km: 0.11, mode_id: 1)
      Price.create!(min_weight: 5, max_weight: 10, price_per_km: 0.16, mode_id: 2)
      Price.create!(min_weight: 10, max_weight: 20, price_per_km: 0.20, mode_id: 3)

      Deadline.create!(min_distance: 1, max_distance: 100, deadline: 10, mode_id: 1)
      Deadline.create!(min_distance: 10, max_distance: 100, deadline: 5, mode_id: 2)
      Deadline.create!(min_distance: 10, max_distance: 100, deadline: 3, mode_id: 3)

      login_as(user)
    end

    it "visit section directly" do
      visit orders_path
      expect(current_path).to eq orders_path
    end

    it "visit page" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      #Assert
      expect(current_path).to eq orders_path
    end

    it "successfully - open" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(1)') do
        click_on 'Aberto'
      end
      #Assert
      within('div.orders__tabs') do
        within('table.open thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Data'
          expect(page).to have_content 'Volumes (un)'
          expect(page).to have_content 'Peso (Kg)'
          expect(page).to have_content 'Status'
        end
        within('table.open tbody tr:nth-child(1)') do
          expect(page).to have_content @order_open.code
          expect(page).to have_content Date.today.strftime("%d/%m/%Y")
          expect(page).to have_content '3'
          expect(page).to have_content '600'
          expect(page).to have_content 'Aberto'
        end
      end
    end

    it "successfully - pending" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(2)') do
        click_on 'Pendente'
      end
      #Assert
      within('div.orders__tabs') do
        within('table.pending thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Data'
          expect(page).to have_content 'Volumes (un)'
          expect(page).to have_content 'Peso (Kg)'
          expect(page).to have_content 'Status'
        end
        within('table.pending tbody tr:nth-child(1)') do
          expect(page).to have_content @order_pending.code
          expect(page).to have_content Date.today.strftime("%d/%m/%Y")
          expect(page).to have_content '3'
          expect(page).to have_content '700'
          expect(page).to have_content 'Pendente'
        end
      end
    end

    it "successfully - sent" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(3)') do
        click_on 'Enviado'
      end
      #Assert
      within('div.orders__tabs') do
        within('table.sent thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Data'
          expect(page).to have_content 'Volumes (un)'
          expect(page).to have_content 'Peso (Kg)'
          expect(page).to have_content 'Status'
        end
        within('table.sent tbody tr:nth-child(1)') do
          expect(page).to have_content @order_sent.code
          expect(page).to have_content Date.today.strftime("%d/%m/%Y")
          expect(page).to have_content '3'
          expect(page).to have_content '800'
          expect(page).to have_content 'Enviado'
        end
      end
    end

    it "successfully - delivered" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(4)') do
        click_on 'Entregue'
      end
      #Assert
      within('div.orders__tabs') do
        within('table.delivered thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Data'
          expect(page).to have_content 'Volumes (un)'
          expect(page).to have_content 'Peso (Kg)'
          expect(page).to have_content 'Status'
        end
        within('table.delivered tbody tr:nth-child(1)') do
          expect(page).to have_content @order_delivered.code
          expect(page).to have_content Date.today.strftime("%d/%m/%Y")
          expect(page).to have_content '3'
          expect(page).to have_content '900'
          expect(page).to have_content 'Entregue'
        end
      end
    end

    it "successfully - canceled" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(5)') do
        click_on 'Cancelado'
      end
      #Assert
      within('div.orders__tabs') do
        within('table.canceled thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Data'
          expect(page).to have_content 'Volumes (un)'
          expect(page).to have_content 'Peso (Kg)'
          expect(page).to have_content 'Status'
        end
        within('table.canceled tbody tr:nth-child(1)') do
          expect(page).to have_content @order_canceled.code
          expect(page).to have_content Date.today.strftime("%d/%m/%Y")
          expect(page).to have_content '3'
          expect(page).to have_content '1000'
          expect(page).to have_content 'Cancelado'
        end
      end
    end

    it "successfully - returned" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(6)') do
        click_on 'Retornado'
      end
      #Assert
      within('div.orders__tabs') do
        within('table.returned thead tr:nth-child(1)') do
          expect(page).to have_content 'Código'
          expect(page).to have_content 'Data'
          expect(page).to have_content 'Volumes (un)'
          expect(page).to have_content 'Peso (Kg)'
          expect(page).to have_content 'Status'
        end
        within('table.returned tbody tr:nth-child(1)') do
          expect(page).to have_content @order_returned.code
          expect(page).to have_content Date.today.strftime("%d/%m/%Y")
          expect(page).to have_content '3'
          expect(page).to have_content '1100'
          expect(page).to have_content 'Retornado'
        end
      end
    end
  end

  context "user authenticated - no registered orders" do
    before(:each) do
      #Arrange
      user = User.create!(name: "Jose Silva", email: "jose@email.com", password: '123456', role: "user" )

      Address.create!(person: "recipient", address_one: "Av Paulista, 1001", address_two: "Bela Vista", 
                      city: "São Paulo", state: "SP", zip: "10000-101")
      Address.create!(person: "sender", address_one: "Av Atlântica, 2002", address_two: "Copacabana", 
                      city: "Rio de Janeiro", state: "RJ", zip: "20000-202")

      Product.create!(width: 50, height: 30, depth: 10, weight: 100)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 200)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 300)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 400)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 500)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)
      Product.create!(width: 50, height: 30, depth: 10, weight: 600)
      Product.create!(width: 70, height: 50, depth: 40, weight: 200)
      Product.create!(width: 90, height: 70, depth: 80, weight: 300)

      Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
                  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)
      
      Mode.create!(name: "Super Pack", min_distance: 10, max_distance: 500, 
                  min_weight: 5, max_weight: 20, fixed_fee: 40, active: true)
      
      Mode.create!(name: "Mega Pack", min_distance: 10, max_distance: 300, 
                  min_weight: 10, max_weight: 40, fixed_fee: 60, active: true)

      Vehicle.create!(plate: "ABC-1001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
                      year: "2011", capacity: 100, status: 0, mode_id: 1)
  
      Vehicle.create!(plate: "ABC-1002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
                      year: "2012", capacity: 400, status: 0, mode_id: 2)
      
      Vehicle.create!(plate: "ABC-1003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
                      year: "2013", capacity: 1000, status: 0, mode_id: 3)

      Price.create!(min_weight: 1, max_weight: 3, price_per_km: 0.11, mode_id: 1)
      Price.create!(min_weight: 5, max_weight: 10, price_per_km: 0.16, mode_id: 2)
      Price.create!(min_weight: 10, max_weight: 20, price_per_km: 0.20, mode_id: 3)

      Deadline.create!(min_distance: 1, max_distance: 100, deadline: 10, mode_id: 1)
      Deadline.create!(min_distance: 10, max_distance: 100, deadline: 5, mode_id: 2)
      Deadline.create!(min_distance: 10, max_distance: 100, deadline: 3, mode_id: 3)

      login_as(user)
    end
    
    it "no registered orders - open" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(1)') do
        click_on 'Aberto'
      end
      #Assert
      expect(page).to have_content 'Nenhuma ordem de entrega aberta'
    end

    it "no registered orders - pending" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(2)') do
        click_on 'Pendente'
      end
      #Assert
      expect(page).to have_content 'Nenhuma ordem de entrega pendente'
    end

    it "no registered orders - sent" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(3)') do
        click_on 'Enviado'
      end
      #Assert
      expect(page).to have_content 'Nenhuma ordem de entrega enviada'
    end

    it "no registered orders - delivered" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(4)') do
        click_on 'Entregue'
      end
      #Assert
      expect(page).to have_content 'Nenhuma ordem de entrega entregue'
    end

    it "no registered orders - canceled" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(5)') do
        click_on 'Cancelado'
      end
      #Assert
      expect(page).to have_content 'Nenhuma ordem de entrega cancelada'
    end

    it "no registered orders - returned" do
      #Act
      visit root_path
      within('div ul.nav li:nth-child(2)') do
        click_on 'Ordens de Entrega'
      end
      within('div.orders__tabs ul.nav li:nth-child(6)') do
        click_on 'Retornado'
      end
      #Assert
      expect(page).to have_content 'Nenhuma ordem de entrega retornada'
    end
  end
end