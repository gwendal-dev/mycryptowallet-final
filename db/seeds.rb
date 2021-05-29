# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{email: "aaa@gmail.com", nickname: "brandon", password: 1232343 }])
puts 'user done'
Portfolio.create!([{title: "Mon portefolio 1", user_id: 1}])
Portfolio.create!([{title: "Mon portefolio 2", user_id: 1}])
Portfolio.create!([{title: "Mon portefolio 3", user_id: 1}])
puts 'portfolios done'
Coin.create!([{title: "BTC", price: 37876, avatar: "BTC.jpg", background: "btc2.jpeg"}])
Coin.create!([{title: "ETH", price: 2560, avatar: "ETH.jpg", background: "eth2.jpeg"}])
Coin.create!([{title: "ADA", price: 1.6, avatar: "ADA.jpg", background: "ada2.png"}])
Coin.create!([{title: "LINK", price: 34, avatar: "LINK.jpg", background: "link2.jpeg"}])
Coin.create!([{title: "BNB", price: 346, avatar: "BNB.jpg", background: "bnb2.png"}])
Coin.create!([{title: "DOGE", price: 0.34, avatar: "DOGE.jpg", background: "doge2.jpeg"}])
Coin.create!([{title: "DOT", price: 24, avatar: "DOT.jpg", background: "dot2.jpeg"}])
Coin.create!([{title: "BNT", price: 8.3, avatar: "BTN.jpg", background: "bnt2.jpeg"}])
Coin.create!([{title: "AAVE", price: 358, avatar: "AAVE.jpg", background: "aave2.jpeg"}])
puts 'coins done'
