# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating demo user ....\n"
User.create!(
    name: "Haha",
    email: "admin@test.com",
    gender: "Male",
    department: "计算机学院",
    password: "password",
    password_confirmation: "password",
    admin: true
)

Game.create!(
    name: "殖民火星：序幕",
    type: "卡牌",
    info: "第三个扩展包是《殖民火星:序幕》。这是一个小扩展，前奏的加入解决了第二扩展加入金星后游戏时长变长的问题。扩展中总共包括了35张序幕卡，7张新的项目卡牌，5张新的公司卡牌。此外,游戏中提供的新的SOLO规则给单人游戏带来了新的难度和挑战:改造指标不再那么重要,-切以改造等级为终极目标。",
    human: "399",
    point: "4.6"
    )
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Done!"