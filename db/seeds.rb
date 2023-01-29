Mode.create!(name: "Light Pack", min_distance: 1, max_distance: 1000, 
  min_weight: 1, max_weight: 10, fixed_fee: 20,  active: true)

Mode.create!(name: "Super Pack", min_distance: 10, max_distance: 500, 
  min_weight: 5, max_weight: 20, fixed_fee: 40, active: true)

Mode.create!(name: "Mega Pack", min_distance: 10, max_distance: 300, 
  min_weight: 10, max_weight: 30, fixed_fee: 60, active: true)

Mode.create!(name: "Ultra Pack", min_distance: 40, max_distance: 200, 
  min_weight: 20, max_weight: 40, fixed_fee: 80, active: true)

Mode.create!(name: "Star Pack", min_distance: 10, max_distance: 100, 
  min_weight: 30, max_weight: 50, fixed_fee: 100, active: true)

Vehicle.create!(plate: "ABC-1231", brand: "Volkswagem", model: "Gol 1.6", category: "Passeio", 
      year: "2011", capacity: 100, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1232", brand: "Fiat", model: "Fiorino 1.6", category: "Carga Leve", 
      year: "2012", capacity: 400, status: 0, mode_id: 1)

Vehicle.create!(plate: "ABC-1233", brand: "Ford", model: "Furgão 4.0", category: "Carga Média", 
      year: "2013", capacity: 1000, status: 0, mode_id: 1)

Price.create!(min_weight: 1, max_weight: 3, price_per_km: 0.11, mode_id: 1)
Price.create!(min_weight: 4, max_weight: 7, price_per_km: 0.22, mode_id: 1)
Price.create!(min_weight: 8, max_weight: 10, price_per_km: 0.33, mode_id: 1)

Price.create!(min_weight: 5, max_weight: 10, price_per_km: 0.16, mode_id: 2)
Price.create!(min_weight: 11, max_weight: 20, price_per_km: 0.32, mode_id: 2)
Price.create!(min_weight: 21, max_weight: 30, price_per_km: 0.48, mode_id: 2)
Price.create!(min_weight: 31, max_weight: 40, price_per_km: 0.64, mode_id: 2)
Price.create!(min_weight: 41, max_weight: 50, price_per_km: 0.80, mode_id: 2)

Price.create!(min_weight: 10, max_weight: 30, price_per_km: 0.20, mode_id: 3)
Price.create!(min_weight: 31, max_weight: 60, price_per_km: 0.40, mode_id: 3)
Price.create!(min_weight: 61, max_weight: 100, price_per_km: 0.60, mode_id: 3)

Deadline.create!(min_distance: 1, max_distance: 100, deadline: 10, mode_id: 1)
Deadline.create!(min_distance: 101, max_distance: 500, deadline: 15, mode_id: 1)
Deadline.create!(min_distance: 501, max_distance: 1000, deadline: 20, mode_id: 1)

Deadline.create!(min_distance: 10, max_distance: 100, deadline: 5, mode_id: 2)
Deadline.create!(min_distance: 101, max_distance: 250, deadline: 7, mode_id: 2)
Deadline.create!(min_distance: 251, max_distance: 500, deadline: 10, mode_id: 2)

Deadline.create!(min_distance: 10, max_distance: 100, deadline: 3, mode_id: 3)
Deadline.create!(min_distance: 101, max_distance: 200, deadline: 5, mode_id: 3)
Deadline.create!(min_distance: 201, max_distance: 300, deadline: 7, mode_id: 3)

Address.create!(person: "sender", address_one: "Av Atlântica, 2002", address_two: "Copacabana", 
      city: "Rio de Janeiro", state: "RJ", zip: "20000-202")
Address.create!(person: "recipient", address_one: "Av Paulista, 1001", address_two: "Bela Vista", 
      city: "São Paulo", state: "SP", zip: "10000-101")

@order = Order.create!(distance: 29)

OrderAddress.create!(order_id: 1, address_id: 1)
OrderAddress.create!(order_id: 1, address_id: 2)

Product.create!(width: 50, height: 30, depth: 10, weight: 3)
Product.create!(width: 70, height: 50, depth: 40, weight: 6)
Product.create!(width: 90, height: 70, depth: 80, weight: 4)

OrderProduct.create!(order_id: 1, product_id: 1)
OrderProduct.create!(order_id: 1, product_id: 2)
OrderProduct.create!(order_id: 1, product_id: 3)