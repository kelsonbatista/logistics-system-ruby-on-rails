# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
  Mode.create!(
    name: "Mode #{i + 1}",
    min_distance: 10 * (i + 1),
    max_distance: 100 * (i + 1),
    min_weight: 1 * (i + 1),
    max_weight: 100 * (i + 1),
    fixed_fee: 50,
    active: true
  )
end
