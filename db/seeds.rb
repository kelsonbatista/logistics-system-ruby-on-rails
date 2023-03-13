User.create!(email: "usuario@email.com.br", password: "12345678")

Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)

Mode.create!(name: "Super Pack", min_distance: 10, max_distance: 500, 
  min_weight: 5, max_weight: 20, fixed_fee: 40, active: true)

Mode.create!(name: "Mega Pack", min_distance: 10, max_distance: 300, 
  min_weight: 10, max_weight: 40, fixed_fee: 60, active: true)

Mode.create!(name: "Ultra Pack", min_distance: 40, max_distance: 200, 
  min_weight: 20, max_weight: 50, fixed_fee: 80, active: true)

Mode.create!(name: "Star Pack", min_distance: 10, max_distance: 100, 
  min_weight: 30, max_weight: 60, fixed_fee: 100, active: true)

# **********************************************************************************************

Vehicle.create!(plate: "ABC-1001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 5, mode_id: 1)

Vehicle.create!(plate: "ABC-1002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 5, mode_id: 1)

Vehicle.create!(plate: "ABC-1003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 5, mode_id: 1)

Vehicle.create!(plate: "ABC-1004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 5, mode_id: 1)

Vehicle.create!(plate: "ABC-1006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1007", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1008", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 5, mode_id: 1)

Vehicle.create!(plate: "ABC-1009", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1010", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 1)

# **********************************************************************************************

Vehicle.create!(plate: "ABC-2001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 5, mode_id: 2)

Vehicle.create!(plate: "ABC-2002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 5, mode_id: 2)

Vehicle.create!(plate: "ABC-2003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 5, mode_id: 2)

Vehicle.create!(plate: "ABC-2004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 5, mode_id: 2)

Vehicle.create!(plate: "ABC-2005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2007", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 5, mode_id: 2)

Vehicle.create!(plate: "ABC-2008", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2009", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2010", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 2)

# **********************************************************************************************

Vehicle.create!(plate: "ABC-3001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 5, mode_id: 3)

Vehicle.create!(plate: "ABC-3002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 5, mode_id: 3)

Vehicle.create!(plate: "ABC-3003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3007", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 10, mode_id: 3)

Vehicle.create!(plate: "ABC-3008", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 10, mode_id: 3)

Vehicle.create!(plate: "ABC-3009", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3010", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 3)

# **********************************************************************************************

Vehicle.create!(plate: "ABC-4001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 5, mode_id: 4)

Vehicle.create!(plate: "ABC-4002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 5, mode_id: 4)

Vehicle.create!(plate: "ABC-4003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 5, mode_id: 4)

Vehicle.create!(plate: "ABC-4004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4007", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 10, mode_id: 4)

Vehicle.create!(plate: "ABC-4008", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4009", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4010", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 4)

# **********************************************************************************************

Vehicle.create!(plate: "ABC-5001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 5, mode_id: 5)

Vehicle.create!(plate: "ABC-5002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 5, mode_id: 5)

Vehicle.create!(plate: "ABC-5003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5007", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 10, mode_id: 5)

Vehicle.create!(plate: "ABC-5008", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5009", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5010", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 5)

# **********************************************************************************************

Price.create!(min_weight: 1, max_weight: 3, price_per_km: 0.11, mode_id: 1)
Price.create!(min_weight: 4, max_weight: 7, price_per_km: 0.22, mode_id: 1)
Price.create!(min_weight: 8, max_weight: 10, price_per_km: 0.33, mode_id: 1)

Price.create!(min_weight: 5, max_weight: 10, price_per_km: 0.16, mode_id: 2)
Price.create!(min_weight: 11, max_weight: 20, price_per_km: 0.32, mode_id: 2)
Price.create!(min_weight: 21, max_weight: 30, price_per_km: 0.48, mode_id: 2)
Price.create!(min_weight: 31, max_weight: 40, price_per_km: 0.64, mode_id: 2)
Price.create!(min_weight: 41, max_weight: 50, price_per_km: 0.80, mode_id: 2)

Price.create!(min_weight: 10, max_weight: 20, price_per_km: 0.20, mode_id: 3)
Price.create!(min_weight: 21, max_weight: 30, price_per_km: 0.40, mode_id: 3)
Price.create!(min_weight: 31, max_weight: 40, price_per_km: 0.60, mode_id: 3)

Price.create!(min_weight: 20, max_weight: 30, price_per_km: 0.30, mode_id: 4)
Price.create!(min_weight: 31, max_weight: 40, price_per_km: 0.50, mode_id: 4)
Price.create!(min_weight: 41, max_weight: 50, price_per_km: 0.70, mode_id: 4)

Price.create!(min_weight: 30, max_weight: 40, price_per_km: 0.40, mode_id: 5)
Price.create!(min_weight: 41, max_weight: 50, price_per_km: 0.60, mode_id: 5)
Price.create!(min_weight: 51, max_weight: 60, price_per_km: 0.80, mode_id: 5)

Deadline.create!(min_distance: 1, max_distance: 1000, deadline: 10, mode_id: 1)
Deadline.create!(min_distance: 50, max_distance: 1000, deadline: 15, mode_id: 1)
Deadline.create!(min_distance: 100, max_distance: 1000, deadline: 20, mode_id: 1)

Deadline.create!(min_distance: 10, max_distance: 1000, deadline: 5, mode_id: 2)
Deadline.create!(min_distance: 50, max_distance: 1000, deadline: 7, mode_id: 2)
Deadline.create!(min_distance: 101, max_distance: 1000, deadline: 10, mode_id: 2)

Deadline.create!(min_distance: 10, max_distance: 1000, deadline: 3, mode_id: 3)
Deadline.create!(min_distance: 101, max_distance: 1000, deadline: 5, mode_id: 3)
Deadline.create!(min_distance: 201, max_distance: 1000, deadline: 7, mode_id: 3)

Deadline.create!(min_distance: 40, max_distance: 1000, deadline: 2, mode_id: 4)
Deadline.create!(min_distance: 101, max_distance: 1000, deadline: 3, mode_id: 4)
Deadline.create!(min_distance: 151, max_distance: 1000, deadline: 4, mode_id: 4)

Deadline.create!(min_distance: 10, max_distance: 1000, deadline: 1, mode_id: 5)
Deadline.create!(min_distance: 31, max_distance: 1000, deadline: 2, mode_id: 5)
Deadline.create!(min_distance: 61, max_distance: 1000, deadline: 3, mode_id: 5)

Address.create!(person: "sender", address_one: "Av Atlântica, 2002", address_two: "Copacabana", 
      city: "Rio de Janeiro", state: "RJ", zip: "20000-202")
Address.create!(person: "recipient", address_one: "Av Paulista, 1001", address_two: "Bela Vista", 
      city: "São Paulo", state: "SP", zip: "10000-101")
Address.create!(person: "sender", address_one: "Av Nove de Julho, 3003", address_two: "Centro", 
      city: "Campinas", state: "SP", zip: "30000-303")
Address.create!(person: "recipient", address_one: "Av Padre Freitas, 4004", address_two: "Jardim Bonito", 
      city: "Recife", state: "PE", zip: "40000-404")
Address.create!(person: "sender", address_one: "Av Juscelino, 5005", address_two: "Vila Nova", 
      city: "Cuiabá", state: "MT", zip: "50000-505")
Address.create!(person: "recipient", address_one: "Av Dom Pedro, 6006", address_two: "Distrito Industrial", 
      city: "Porto Alegre", state: "RS", zip: "60000-606")

Order.create!(distance: 130, status: 'open')
Order.create!(distance: 290, status: 'open')
Order.create!(distance: 10, status: 'open')
Order.create!(distance: 180, status: 'open')
Order.create!(distance: 440, status: 'open')
Order.create!(distance: 320, status: 'open')
Order.create!(distance: 29, status: 'open')
Order.create!(distance: 100, status: 'open')
Order.create!(distance: 80, status: 'open')
Order.create!(distance: 500, status: 'open')
Order.create!(distance: 50, status: 'open')
Order.create!(distance: 29, status: 'pending')
Order.create!(distance: 100, status: 'pending')
Order.create!(distance: 80, status: 'pending')
Order.create!(distance: 500, status: 'pending')
Order.create!(distance: 50, status: 'pending')
Order.create!(distance: 130, status: 'pending')
Order.create!(distance: 290, status: 'pending')
Order.create!(distance: 10, status: 'pending')
Order.create!(distance: 180, status: 'pending')
Order.create!(distance: 440, status: 'pending')
Order.create!(distance: 44, status: 'sent')
Order.create!(distance: 77, status: 'sent')
Order.create!(distance: 55, status: 'sent')
Order.create!(distance: 220, status: 'sent')
Order.create!(distance: 130, status: 'sent')
Order.create!(distance: 290, status: 'sent')
Order.create!(distance: 10, status: 'sent')
Order.create!(distance: 130, status: 'sent')
Order.create!(distance: 290, status: 'sent')
Order.create!(distance: 10, status: 'sent')
Order.create!(distance: 180, status: 'sent')
Order.create!(distance: 440, status: 'sent')
Order.create!(distance: 320, status: 'sent')
Order.create!(distance: 29, status: 'sent')
Order.create!(distance: 100, status: 'sent')
Order.create!(distance: 80, status: 'sent')
Order.create!(distance: 500, status: 'sent')
Order.create!(distance: 180, status: 'delivered', condition: 'on_time')
Order.create!(distance: 440, status: 'delivered', condition: 'on_time')
Order.create!(distance: 320, status: 'delivered', condition: 'on_time')
Order.create!(distance: 29, status: 'delivered', condition: 'late', reason: 'Defeito no veículo')
Order.create!(distance: 100, status: 'delivered', condition: 'on_time')
Order.create!(distance: 80, status: 'delivered', condition: 'on_time')
Order.create!(distance: 500, status: 'delivered', condition: 'late', reason: 'Excesso de encomendas')
Order.create!(distance: 50, status: 'delivered', condition: 'late')
Order.create!(distance: 44, status: 'delivered', condition: 'on_time')
Order.create!(distance: 77, status: 'delivered', condition: 'on_time')
Order.create!(distance: 55, status: 'delivered', condition: 'on_time')
Order.create!(distance: 220, status: 'delivered', condition: 'on_time')
Order.create!(distance: 130, status: 'delivered', condition: 'on_time')
Order.create!(distance: 290, status: 'delivered', condition: 'late', reason: 'Chuvas na região')
Order.create!(distance: 10, status: 'delivered', condition: 'on_time')
Order.create!(distance: 180, status: 'delivered', condition: 'on_time')
Order.create!(distance: 440, status: 'delivered', condition: 'on_time')
Order.create!(distance: 320, status: 'delivered', condition: 'on_time')
Order.create!(distance: 29, status: 'delivered', condition: 'on_time')
Order.create!(distance: 100, status: 'delivered', condition: 'on_time')
Order.create!(distance: 80, status: 'delivered', condition: 'on_time')
Order.create!(distance: 500, status: 'delivered', condition: 'on_time')
Order.create!(distance: 50, status: 'delivered', condition: 'on_time')
Order.create!(distance: 44, status: 'delivered', condition: 'on_time')
Order.create!(distance: 77, status: 'delivered', condition: 'on_time')
Order.create!(distance: 55, status: 'delivered', condition: 'late', reason: 'Defeito no veículo')
Order.create!(distance: 220, status: 'delivered', condition: 'late', reason: 'O destinatário não estava no local')
Order.create!(distance: 130, status: 'delivered', condition: 'on_time')
Order.create!(distance: 290, status: 'delivered', condition: 'on_time')
Order.create!(distance: 10, status: 'delivered', condition: 'on_time')
Order.create!(distance: 15, status: 'delivered', condition: 'late', reason: 'Troca de veículo')
Order.create!(distance: 29, status: 'canceled')
Order.create!(distance: 100, status: 'canceled')
Order.create!(distance: 80, status: 'canceled')
Order.create!(distance: 500, status: 'canceled')
Order.create!(distance: 50, status: 'canceled')
Order.create!(distance: 44, status: 'canceled')

OrderAddress.create!(order_id: 11, address_id: 1)
OrderAddress.create!(order_id: 11, address_id: 2)
OrderAddress.create!(order_id: 12, address_id: 3)
OrderAddress.create!(order_id: 12, address_id: 4)
OrderAddress.create!(order_id: 13, address_id: 5)
OrderAddress.create!(order_id: 13, address_id: 6)
OrderAddress.create!(order_id: 14, address_id: 1)
OrderAddress.create!(order_id: 14, address_id: 4)
OrderAddress.create!(order_id: 15, address_id: 2)
OrderAddress.create!(order_id: 15, address_id: 5)
OrderAddress.create!(order_id: 16, address_id: 1)
OrderAddress.create!(order_id: 16, address_id: 2)
OrderAddress.create!(order_id: 17, address_id: 3)
OrderAddress.create!(order_id: 17, address_id: 4)
OrderAddress.create!(order_id: 18, address_id: 5)
OrderAddress.create!(order_id: 18, address_id: 6)
OrderAddress.create!(order_id: 19, address_id: 1)
OrderAddress.create!(order_id: 19, address_id: 4)
OrderAddress.create!(order_id: 20, address_id: 2)
OrderAddress.create!(order_id: 20, address_id: 5)
OrderAddress.create!(order_id: 21, address_id: 1)
OrderAddress.create!(order_id: 21, address_id: 2)
OrderAddress.create!(order_id: 22, address_id: 3)
OrderAddress.create!(order_id: 22, address_id: 4)
OrderAddress.create!(order_id: 23, address_id: 5)
OrderAddress.create!(order_id: 23, address_id: 6)
OrderAddress.create!(order_id: 24, address_id: 1)
OrderAddress.create!(order_id: 24, address_id: 4)
OrderAddress.create!(order_id: 25, address_id: 2)
OrderAddress.create!(order_id: 25, address_id: 5)
OrderAddress.create!(order_id: 26, address_id: 1)
OrderAddress.create!(order_id: 26, address_id: 2)
OrderAddress.create!(order_id: 27, address_id: 3)
OrderAddress.create!(order_id: 27, address_id: 4)
OrderAddress.create!(order_id: 28, address_id: 5)
OrderAddress.create!(order_id: 28, address_id: 6)
OrderAddress.create!(order_id: 29, address_id: 1)
OrderAddress.create!(order_id: 29, address_id: 4)
OrderAddress.create!(order_id: 30, address_id: 2)
OrderAddress.create!(order_id: 30, address_id: 5)
OrderAddress.create!(order_id: 31, address_id: 1)
OrderAddress.create!(order_id: 31, address_id: 2)
OrderAddress.create!(order_id: 32, address_id: 3)
OrderAddress.create!(order_id: 32, address_id: 4)
OrderAddress.create!(order_id: 33, address_id: 5)
OrderAddress.create!(order_id: 33, address_id: 6)
OrderAddress.create!(order_id: 34, address_id: 1)
OrderAddress.create!(order_id: 34, address_id: 4)
OrderAddress.create!(order_id: 35, address_id: 2)
OrderAddress.create!(order_id: 35, address_id: 5)
OrderAddress.create!(order_id: 36, address_id: 1)
OrderAddress.create!(order_id: 36, address_id: 2)
OrderAddress.create!(order_id: 37, address_id: 3)
OrderAddress.create!(order_id: 37, address_id: 4)
OrderAddress.create!(order_id: 38, address_id: 5)
OrderAddress.create!(order_id: 38, address_id: 6)
OrderAddress.create!(order_id: 39, address_id: 1)
OrderAddress.create!(order_id: 39, address_id: 4)
OrderAddress.create!(order_id: 40, address_id: 2)
OrderAddress.create!(order_id: 40, address_id: 5)
OrderAddress.create!(order_id: 41, address_id: 1)
OrderAddress.create!(order_id: 41, address_id: 2)
OrderAddress.create!(order_id: 42, address_id: 3)
OrderAddress.create!(order_id: 42, address_id: 4)
OrderAddress.create!(order_id: 43, address_id: 5)
OrderAddress.create!(order_id: 43, address_id: 6)
OrderAddress.create!(order_id: 44, address_id: 1)
OrderAddress.create!(order_id: 44, address_id: 4)
OrderAddress.create!(order_id: 45, address_id: 2)
OrderAddress.create!(order_id: 45, address_id: 5)
OrderAddress.create!(order_id: 46, address_id: 1)
OrderAddress.create!(order_id: 46, address_id: 2)
OrderAddress.create!(order_id: 47, address_id: 3)
OrderAddress.create!(order_id: 47, address_id: 4)
OrderAddress.create!(order_id: 48, address_id: 5)
OrderAddress.create!(order_id: 48, address_id: 6)
OrderAddress.create!(order_id: 49, address_id: 1)
OrderAddress.create!(order_id: 49, address_id: 4)
OrderAddress.create!(order_id: 50, address_id: 2)
OrderAddress.create!(order_id: 50, address_id: 5)
OrderAddress.create!(order_id: 51, address_id: 1)
OrderAddress.create!(order_id: 51, address_id: 2)
OrderAddress.create!(order_id: 52, address_id: 3)
OrderAddress.create!(order_id: 52, address_id: 4)
OrderAddress.create!(order_id: 53, address_id: 5)
OrderAddress.create!(order_id: 53, address_id: 6)
OrderAddress.create!(order_id: 54, address_id: 1)
OrderAddress.create!(order_id: 54, address_id: 4)
OrderAddress.create!(order_id: 55, address_id: 2)
OrderAddress.create!(order_id: 55, address_id: 5)
OrderAddress.create!(order_id: 56, address_id: 1)
OrderAddress.create!(order_id: 56, address_id: 2)
OrderAddress.create!(order_id: 57, address_id: 3)
OrderAddress.create!(order_id: 57, address_id: 4)
OrderAddress.create!(order_id: 58, address_id: 5)
OrderAddress.create!(order_id: 58, address_id: 6)
OrderAddress.create!(order_id: 59, address_id: 1)
OrderAddress.create!(order_id: 59, address_id: 4)
OrderAddress.create!(order_id: 60, address_id: 2)
OrderAddress.create!(order_id: 60, address_id: 5)
OrderAddress.create!(order_id: 61, address_id: 1)
OrderAddress.create!(order_id: 61, address_id: 2)
OrderAddress.create!(order_id: 62, address_id: 3)
OrderAddress.create!(order_id: 62, address_id: 4)
OrderAddress.create!(order_id: 63, address_id: 5)
OrderAddress.create!(order_id: 63, address_id: 6)
OrderAddress.create!(order_id: 64, address_id: 1)
OrderAddress.create!(order_id: 64, address_id: 4)
OrderAddress.create!(order_id: 65, address_id: 2)
OrderAddress.create!(order_id: 65, address_id: 5)
OrderAddress.create!(order_id: 66, address_id: 1)
OrderAddress.create!(order_id: 66, address_id: 2)
OrderAddress.create!(order_id: 67, address_id: 3)
OrderAddress.create!(order_id: 67, address_id: 4)
OrderAddress.create!(order_id: 68, address_id: 5)
OrderAddress.create!(order_id: 68, address_id: 6)
OrderAddress.create!(order_id: 69, address_id: 1)
OrderAddress.create!(order_id: 69, address_id: 4)
OrderAddress.create!(order_id: 70, address_id: 2)
OrderAddress.create!(order_id: 70, address_id: 5)
OrderAddress.create!(order_id: 71, address_id: 1)
OrderAddress.create!(order_id: 71, address_id: 2)
OrderAddress.create!(order_id: 72, address_id: 3)
OrderAddress.create!(order_id: 72, address_id: 4)
OrderAddress.create!(order_id: 73, address_id: 5)
OrderAddress.create!(order_id: 73, address_id: 6)
OrderAddress.create!(order_id: 74, address_id: 1)
OrderAddress.create!(order_id: 74, address_id: 4)
OrderAddress.create!(order_id: 75, address_id: 2)
OrderAddress.create!(order_id: 75, address_id: 5)

Product.create!(width: 50, height: 30, depth: 10, weight: 3)
Product.create!(width: 70, height: 50, depth: 40, weight: 6)
Product.create!(width: 90, height: 70, depth: 80, weight: 4)
Product.create!(width: 50, height: 30, depth: 10, weight: 3)
Product.create!(width: 70, height: 50, depth: 40, weight: 8)
Product.create!(width: 90, height: 70, depth: 80, weight: 1)
Product.create!(width: 50, height: 30, depth: 10, weight: 1)
Product.create!(width: 70, height: 50, depth: 40, weight: 9)
Product.create!(width: 90, height: 70, depth: 80, weight: 12)

OrderProduct.create!(order_id: 1, product_id: 1)
OrderProduct.create!(order_id: 1, product_id: 2)
OrderProduct.create!(order_id: 1, product_id: 3)
OrderProduct.create!(order_id: 2, product_id: 4)
OrderProduct.create!(order_id: 2, product_id: 5)
OrderProduct.create!(order_id: 3, product_id: 6)
OrderProduct.create!(order_id: 3, product_id: 7)
OrderProduct.create!(order_id: 3, product_id: 8)
OrderProduct.create!(order_id: 3, product_id: 9)
OrderProduct.create!(order_id: 4, product_id: 2)
OrderProduct.create!(order_id: 4, product_id: 5)
OrderProduct.create!(order_id: 5, product_id: 1)
OrderProduct.create!(order_id: 5, product_id: 5)
OrderProduct.create!(order_id: 5, product_id: 9)
OrderProduct.create!(order_id: 11, product_id: 1)
OrderProduct.create!(order_id: 11, product_id: 2)
OrderProduct.create!(order_id: 12, product_id: 3)
OrderProduct.create!(order_id: 12, product_id: 4)
OrderProduct.create!(order_id: 13, product_id: 5)
OrderProduct.create!(order_id: 13, product_id: 6)
OrderProduct.create!(order_id: 14, product_id: 7)
OrderProduct.create!(order_id: 14, product_id: 8)
OrderProduct.create!(order_id: 15, product_id: 9)
OrderProduct.create!(order_id: 15, product_id: 2)
OrderProduct.create!(order_id: 16, product_id: 5)
OrderProduct.create!(order_id: 16, product_id: 1)
OrderProduct.create!(order_id: 17, product_id: 5)
OrderProduct.create!(order_id: 17, product_id: 9)
OrderProduct.create!(order_id: 18, product_id: 1)
OrderProduct.create!(order_id: 18, product_id: 2)
OrderProduct.create!(order_id: 19, product_id: 3)
OrderProduct.create!(order_id: 19, product_id: 4)
OrderProduct.create!(order_id: 20, product_id: 5)
OrderProduct.create!(order_id: 20, product_id: 6)
OrderProduct.create!(order_id: 21, product_id: 1)
OrderProduct.create!(order_id: 21, product_id: 2)
OrderProduct.create!(order_id: 22, product_id: 3)
OrderProduct.create!(order_id: 22, product_id: 4)
OrderProduct.create!(order_id: 23, product_id: 5)
OrderProduct.create!(order_id: 23, product_id: 6)
OrderProduct.create!(order_id: 24, product_id: 7)
OrderProduct.create!(order_id: 24, product_id: 8)
OrderProduct.create!(order_id: 25, product_id: 9)
OrderProduct.create!(order_id: 25, product_id: 2)
OrderProduct.create!(order_id: 26, product_id: 5)
OrderProduct.create!(order_id: 26, product_id: 1)
OrderProduct.create!(order_id: 27, product_id: 5)
OrderProduct.create!(order_id: 27, product_id: 9)
OrderProduct.create!(order_id: 28, product_id: 1)
OrderProduct.create!(order_id: 28, product_id: 2)
OrderProduct.create!(order_id: 29, product_id: 3)
OrderProduct.create!(order_id: 29, product_id: 4)
OrderProduct.create!(order_id: 30, product_id: 5)
OrderProduct.create!(order_id: 30, product_id: 6)
OrderProduct.create!(order_id: 31, product_id: 1)
OrderProduct.create!(order_id: 31, product_id: 2)
OrderProduct.create!(order_id: 32, product_id: 3)
OrderProduct.create!(order_id: 32, product_id: 4)
OrderProduct.create!(order_id: 33, product_id: 5)
OrderProduct.create!(order_id: 33, product_id: 6)
OrderProduct.create!(order_id: 34, product_id: 7)
OrderProduct.create!(order_id: 34, product_id: 8)
OrderProduct.create!(order_id: 35, product_id: 9)
OrderProduct.create!(order_id: 35, product_id: 2)
OrderProduct.create!(order_id: 36, product_id: 5)
OrderProduct.create!(order_id: 36, product_id: 1)
OrderProduct.create!(order_id: 37, product_id: 5)
OrderProduct.create!(order_id: 37, product_id: 9)
OrderProduct.create!(order_id: 38, product_id: 1)
OrderProduct.create!(order_id: 38, product_id: 2)
OrderProduct.create!(order_id: 39, product_id: 3)
OrderProduct.create!(order_id: 39, product_id: 4)
OrderProduct.create!(order_id: 40, product_id: 5)
OrderProduct.create!(order_id: 40, product_id: 6)
OrderProduct.create!(order_id: 41, product_id: 1)
OrderProduct.create!(order_id: 41, product_id: 2)
OrderProduct.create!(order_id: 42, product_id: 3)
OrderProduct.create!(order_id: 42, product_id: 4)
OrderProduct.create!(order_id: 43, product_id: 5)
OrderProduct.create!(order_id: 43, product_id: 6)
OrderProduct.create!(order_id: 44, product_id: 7)
OrderProduct.create!(order_id: 44, product_id: 8)
OrderProduct.create!(order_id: 45, product_id: 9)
OrderProduct.create!(order_id: 45, product_id: 2)
OrderProduct.create!(order_id: 46, product_id: 5)
OrderProduct.create!(order_id: 46, product_id: 1)
OrderProduct.create!(order_id: 47, product_id: 5)
OrderProduct.create!(order_id: 47, product_id: 9)
OrderProduct.create!(order_id: 48, product_id: 1)
OrderProduct.create!(order_id: 48, product_id: 2)
OrderProduct.create!(order_id: 49, product_id: 3)
OrderProduct.create!(order_id: 49, product_id: 4)
OrderProduct.create!(order_id: 50, product_id: 5)
OrderProduct.create!(order_id: 50, product_id: 6)
OrderProduct.create!(order_id: 51, product_id: 1)
OrderProduct.create!(order_id: 51, product_id: 2)
OrderProduct.create!(order_id: 52, product_id: 3)
OrderProduct.create!(order_id: 52, product_id: 4)
OrderProduct.create!(order_id: 53, product_id: 5)
OrderProduct.create!(order_id: 53, product_id: 6)
OrderProduct.create!(order_id: 54, product_id: 7)
OrderProduct.create!(order_id: 54, product_id: 8)
OrderProduct.create!(order_id: 55, product_id: 9)
OrderProduct.create!(order_id: 55, product_id: 2)
OrderProduct.create!(order_id: 56, product_id: 5)
OrderProduct.create!(order_id: 56, product_id: 1)
OrderProduct.create!(order_id: 57, product_id: 5)
OrderProduct.create!(order_id: 57, product_id: 9)
OrderProduct.create!(order_id: 58, product_id: 1)
OrderProduct.create!(order_id: 58, product_id: 2)
OrderProduct.create!(order_id: 59, product_id: 3)
OrderProduct.create!(order_id: 59, product_id: 4)
OrderProduct.create!(order_id: 60, product_id: 5)
OrderProduct.create!(order_id: 60, product_id: 6)
OrderProduct.create!(order_id: 61, product_id: 1)
OrderProduct.create!(order_id: 61, product_id: 2)
OrderProduct.create!(order_id: 62, product_id: 3)
OrderProduct.create!(order_id: 62, product_id: 4)
OrderProduct.create!(order_id: 63, product_id: 5)
OrderProduct.create!(order_id: 63, product_id: 6)
OrderProduct.create!(order_id: 64, product_id: 7)
OrderProduct.create!(order_id: 64, product_id: 8)
OrderProduct.create!(order_id: 65, product_id: 9)
OrderProduct.create!(order_id: 65, product_id: 2)
OrderProduct.create!(order_id: 66, product_id: 5)
OrderProduct.create!(order_id: 66, product_id: 1)
OrderProduct.create!(order_id: 67, product_id: 5)
OrderProduct.create!(order_id: 67, product_id: 9)
OrderProduct.create!(order_id: 68, product_id: 1)
OrderProduct.create!(order_id: 68, product_id: 2)
OrderProduct.create!(order_id: 69, product_id: 3)
OrderProduct.create!(order_id: 69, product_id: 4)
OrderProduct.create!(order_id: 70, product_id: 5)
OrderProduct.create!(order_id: 70, product_id: 6)
OrderProduct.create!(order_id: 71, product_id: 1)
OrderProduct.create!(order_id: 71, product_id: 2)
OrderProduct.create!(order_id: 72, product_id: 3)
OrderProduct.create!(order_id: 72, product_id: 4)
OrderProduct.create!(order_id: 73, product_id: 5)
OrderProduct.create!(order_id: 73, product_id: 6)
OrderProduct.create!(order_id: 74, product_id: 7)
OrderProduct.create!(order_id: 74, product_id: 8)
OrderProduct.create!(order_id: 75, product_id: 9)
OrderProduct.create!(order_id: 75, product_id: 2)

Budget.create!(mode: 1, total: 10.99, price_km: 0.22, fixed_fee: 40, deadline: 10, order_id: 22, vehicle_id: 1)
Budget.create!(mode: 1, total: 21.49, price_km: 0.12, fixed_fee: 20, deadline: 6, order_id: 23, vehicle_id: 2)
Budget.create!(mode: 1, total: 15.19, price_km: 0.33, fixed_fee: 30, deadline: 5, order_id: 24, vehicle_id: 3)
Budget.create!(mode: 1, total: 10.59, price_km: 0.17, fixed_fee: 50, deadline: 1, order_id: 25, vehicle_id: 4)
Budget.create!(mode: 1, total: 10.89, price_km: 0.45, fixed_fee: 60, deadline: 3, order_id: 26, vehicle_id: 5)
Budget.create!(mode: 2, total: 11.99, price_km: 0.62, fixed_fee: 10, deadline: 7, order_id: 27, vehicle_id: 6)
Budget.create!(mode: 2, total: 33.99, price_km: 0.23, fixed_fee: 40, deadline: 2, order_id: 28, vehicle_id: 7)
Budget.create!(mode: 2, total: 20.49, price_km: 0.74, fixed_fee: 20, deadline: 5, order_id: 29, vehicle_id: 8)
Budget.create!(mode: 2, total: 13.39, price_km: 0.13, fixed_fee: 30, deadline: 12, order_id: 30, vehicle_id: 9)
Budget.create!(mode: 2, total: 22.19, price_km: 0.17, fixed_fee: 60, deadline: 8, order_id: 31, vehicle_id: 10)

Budget.create!(mode: 3, total: 10.99, price_km: 0.22, fixed_fee: 40, deadline: 10, order_id: 32, vehicle_id: 11)
Budget.create!(mode: 3, total: 21.49, price_km: 0.12, fixed_fee: 20, deadline: 6, order_id: 33, vehicle_id: 12)
Budget.create!(mode: 3, total: 15.19, price_km: 0.33, fixed_fee: 30, deadline: 5, order_id: 34, vehicle_id: 13)
Budget.create!(mode: 3, total: 10.59, price_km: 0.17, fixed_fee: 50, deadline: 1, order_id: 35, vehicle_id: 14)
Budget.create!(mode: 3, total: 10.89, price_km: 0.45, fixed_fee: 60, deadline: 3, order_id: 36, vehicle_id: 15)
Budget.create!(mode: 4, total: 11.99, price_km: 0.62, fixed_fee: 10, deadline: 7, order_id: 37, vehicle_id: 16)
Budget.create!(mode: 4, total: 33.99, price_km: 0.23, fixed_fee: 40, deadline: 2, order_id: 38, vehicle_id: 17)
Budget.create!(mode: 4, total: 20.49, price_km: 0.74, fixed_fee: 20, deadline: 5, order_id: 39, vehicle_id: 18)
Budget.create!(mode: 4, total: 13.39, price_km: 0.13, fixed_fee: 30, deadline: 12, order_id: 40, vehicle_id: 19)
Budget.create!(mode: 4, total: 22.19, price_km: 0.17, fixed_fee: 60, deadline: 8, order_id: 41, vehicle_id: 20)

Budget.create!(mode: 5, total: 10.99, price_km: 0.22, fixed_fee: 40, deadline: 10, order_id: 42, vehicle_id: 21)
Budget.create!(mode: 5, total: 21.49, price_km: 0.12, fixed_fee: 20, deadline: 6, order_id: 43, vehicle_id: 22)
Budget.create!(mode: 5, total: 15.19, price_km: 0.33, fixed_fee: 30, deadline: 5, order_id: 44, vehicle_id: 23)
Budget.create!(mode: 5, total: 10.59, price_km: 0.17, fixed_fee: 50, deadline: 1, order_id: 45, vehicle_id: 24)
Budget.create!(mode: 5, total: 10.89, price_km: 0.45, fixed_fee: 60, deadline: 3, order_id: 46, vehicle_id: 25)
Budget.create!(mode: 1, total: 11.99, price_km: 0.62, fixed_fee: 10, deadline: 7, order_id: 47, vehicle_id: 26)
Budget.create!(mode: 1, total: 33.99, price_km: 0.23, fixed_fee: 40, deadline: 2, order_id: 48, vehicle_id: 27)
Budget.create!(mode: 1, total: 20.49, price_km: 0.74, fixed_fee: 20, deadline: 5, order_id: 49, vehicle_id: 28)
Budget.create!(mode: 1, total: 13.39, price_km: 0.13, fixed_fee: 30, deadline: 12, order_id: 50, vehicle_id: 29)
Budget.create!(mode: 1, total: 22.19, price_km: 0.17, fixed_fee: 60, deadline: 8, order_id: 51, vehicle_id: 30)

Budget.create!(mode: 2, total: 10.99, price_km: 0.22, fixed_fee: 40, deadline: 10, order_id: 52, vehicle_id: 31)
Budget.create!(mode: 2, total: 21.49, price_km: 0.12, fixed_fee: 20, deadline: 6, order_id: 53, vehicle_id: 32)
Budget.create!(mode: 2, total: 15.19, price_km: 0.33, fixed_fee: 30, deadline: 5, order_id: 54, vehicle_id: 33)
Budget.create!(mode: 2, total: 10.59, price_km: 0.17, fixed_fee: 50, deadline: 1, order_id: 55, vehicle_id: 34)
Budget.create!(mode: 2, total: 10.89, price_km: 0.45, fixed_fee: 60, deadline: 3, order_id: 56, vehicle_id: 35)
Budget.create!(mode: 3, total: 11.99, price_km: 0.62, fixed_fee: 10, deadline: 7, order_id: 57, vehicle_id: 36)
Budget.create!(mode: 3, total: 33.99, price_km: 0.23, fixed_fee: 40, deadline: 2, order_id: 58, vehicle_id: 37)
Budget.create!(mode: 3, total: 20.49, price_km: 0.74, fixed_fee: 20, deadline: 5, order_id: 59, vehicle_id: 38)
Budget.create!(mode: 3, total: 13.39, price_km: 0.13, fixed_fee: 30, deadline: 12, order_id: 60, vehicle_id: 39)
Budget.create!(mode: 3, total: 22.19, price_km: 0.17, fixed_fee: 60, deadline: 8, order_id: 61, vehicle_id: 40)

Budget.create!(mode: 4, total: 10.99, price_km: 0.22, fixed_fee: 40, deadline: 10, order_id: 62, vehicle_id: 41)
Budget.create!(mode: 4, total: 21.49, price_km: 0.12, fixed_fee: 20, deadline: 6, order_id: 63, vehicle_id: 42)
Budget.create!(mode: 4, total: 15.19, price_km: 0.33, fixed_fee: 30, deadline: 5, order_id: 64, vehicle_id: 43)
Budget.create!(mode: 4, total: 10.59, price_km: 0.17, fixed_fee: 50, deadline: 1, order_id: 65, vehicle_id: 44)
Budget.create!(mode: 4, total: 10.89, price_km: 0.45, fixed_fee: 60, deadline: 3, order_id: 66, vehicle_id: 45)
Budget.create!(mode: 5, total: 31.99, price_km: 0.62, fixed_fee: 10, deadline: 7, order_id: 67, vehicle_id: 46)
Budget.create!(mode: 5, total: 23.99, price_km: 0.23, fixed_fee: 40, deadline: 2, order_id: 68, vehicle_id: 47)
Budget.create!(mode: 5, total: 20.49, price_km: 0.74, fixed_fee: 20, deadline: 5, order_id: 69, vehicle_id: 48)