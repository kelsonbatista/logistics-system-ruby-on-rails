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

Vehicle.create!(plate: "ABC-1001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-2001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-2006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 2)

Vehicle.create!(plate: "ABC-3001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-3006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 3)

Vehicle.create!(plate: "ABC-4001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-4006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 4)

Vehicle.create!(plate: "ABC-5001", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5002", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5003", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5004", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5005", brand: "Fiat", model: "Toro 2.0", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 5)

Vehicle.create!(plate: "ABC-5006", brand: "Ford", model: "DC-300", category: "Carga Pesada", 
      year: "2013", capacity: 1000, status: 0, mode_id: 5)

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

Deadline.create!(min_distance: 1, max_distance: 100, deadline: 10, mode_id: 1)
Deadline.create!(min_distance: 101, max_distance: 500, deadline: 15, mode_id: 1)
Deadline.create!(min_distance: 501, max_distance: 1000, deadline: 20, mode_id: 1)

Deadline.create!(min_distance: 10, max_distance: 100, deadline: 5, mode_id: 2)
Deadline.create!(min_distance: 101, max_distance: 250, deadline: 7, mode_id: 2)
Deadline.create!(min_distance: 251, max_distance: 500, deadline: 10, mode_id: 2)

Deadline.create!(min_distance: 10, max_distance: 100, deadline: 3, mode_id: 3)
Deadline.create!(min_distance: 101, max_distance: 200, deadline: 5, mode_id: 3)
Deadline.create!(min_distance: 201, max_distance: 300, deadline: 7, mode_id: 3)

Deadline.create!(min_distance: 40, max_distance: 100, deadline: 2, mode_id: 4)
Deadline.create!(min_distance: 101, max_distance: 150, deadline: 3, mode_id: 4)
Deadline.create!(min_distance: 151, max_distance: 200, deadline: 4, mode_id: 4)

Deadline.create!(min_distance: 10, max_distance: 30, deadline: 1, mode_id: 5)
Deadline.create!(min_distance: 31, max_distance: 60, deadline: 2, mode_id: 5)
Deadline.create!(min_distance: 61, max_distance: 100, deadline: 3, mode_id: 5)

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

Order.create!(distance: 29, status: 'pending')
Order.create!(distance: 100, status: 'pending')
Order.create!(distance: 80, status: 'pending')
Order.create!(distance: 500, status: 'pending')
Order.create!(distance: 50, status: 'pending')
Order.create!(distance: 44)
Order.create!(distance: 77)
Order.create!(distance: 55)
Order.create!(distance: 220)
Order.create!(distance: 130)
Order.create!(distance: 290)
Order.create!(distance: 10)
Order.create!(distance: 180)
Order.create!(distance: 640)
Order.create!(distance: 320)

OrderAddress.create!(order_id: 1, address_id: 1)
OrderAddress.create!(order_id: 1, address_id: 2)
OrderAddress.create!(order_id: 2, address_id: 3)
OrderAddress.create!(order_id: 2, address_id: 4)
OrderAddress.create!(order_id: 3, address_id: 5)
OrderAddress.create!(order_id: 3, address_id: 6)
OrderAddress.create!(order_id: 4, address_id: 1)
OrderAddress.create!(order_id: 4, address_id: 4)
OrderAddress.create!(order_id: 5, address_id: 2)
OrderAddress.create!(order_id: 5, address_id: 5)

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