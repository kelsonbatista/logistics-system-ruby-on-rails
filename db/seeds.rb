########### MODES #############
5.times do |i|
  Mode.create!(
    name: "Modalidade #{i + 1}",
    min_distance: 10 * (i + 1),
    max_distance: 100 * (i + 1),
    min_weight: 1 * (i + 1),
    max_weight: 100 * (i + 1),
    fixed_fee: 50,
    active: true
  )
end

############ VEHICLES #############
for i in 1..3 do
  Vehicle.create!(
    plate: "ABC-123#{i}",
    brand: "Marca #{i}",
    model: "Modelo #{i}",
    category: "Categoria #{i}",
    year: "201#{i}",
    capacity: 100 * i,
    status: true,
    mode_id: 1
  )
end

############ PRICES #############
for i in 1..3 do
  Price.create!(
    min_weight: 5 * i,
    max_weight: 10 * i,
    price_per_km: 0.11 * i,
    mode_id: 1
  )
  Price.create!(
    min_weight: 7 * i,
    max_weight: 12 * i,
    price_per_km: 0.16 * i,
    mode_id: 2
  )
end

############# DEADLINES #############
for i in 1..3 do
  Deadline.create!(
    min_distance: 5 * i,
    max_distance: 10 * i,
    deadline: 15 * i,
    mode_id: 1
  )
  Deadline.create!(
    min_distance: 8 * i,
    max_distance: 14 * i,
    deadline: 18 * i,
    mode_id: 2
  )
end

############# USERS #############
for i in 1..2 do
  User.create!(
    name: "Usuario #{i}",
    email: "usuario#{i}@email.com",
    password: '123456',
    role: "user"
  )
  User.create!(
    name: "Admin #{i}",
    email: "admin#{i}@email.com",
    password: '123456',
    role: "admin"
  )
end

############# ADDRESSES #############
for i in 1..5 do
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
    status: 0
  )
end

############ ORDER ADDRESS #############
for i in 1..5 do
  for j in 1..2 do
    OrderAddress.create!(
      order_id: i,
      address_id: j
    )
  end
end

############# PRODUCTS #############
for i in 1..20 do
  Product.create!(
    code: "ABC100#{i}",
    width: 50 * i/2,
    height: 30 * i/2,
    depth: 10 * i/2,
    weight: 100 * i/2
  )
end

########## ORDER PRODUCT #############
x = 0
for i in 1..5 do
  for j in 1..4 do
    OrderProduct.create!(
      order_id: i,
      product_id: j + x
    )
  end
  x = x + 4 if i < 5
end