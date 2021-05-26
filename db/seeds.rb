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
Coin.create!([{title: "BTC", price: 37876, avatar: "Btc.jpg"}])
Coin.create!([{title: "ETH", price: 2560, avatar: "ETH.png"}])
Coin.create!([{title: "ADA", price: 1.6, avatar: "Ada.png"}])
Coin.create!([{title: "LINK", price: 34, avatar: "Link.jpg"}])
Coin.create!([{title: "BNB", price: 346, avatar: "bnb.png"}])
Coin.create!([{title: "DOGE", price: 0.34, avatar: "Doge.jpg"}])
Coin.create!([{title: "DOT", price: 24, avatar: "Dot.png"}])
Coin.create!([{title: "BNT", price: 8.3, avatar: "bancor-bnt-logo.png"}])
Coin.create!([{title: "AAVE", price: 358, avatar: "AAVE.png"}])
puts 'coins done'
Position.create!([{portfolio_id: 1, coin_id: 2, entry_date: DateTime.current.to_date, amount: 1250, quantity: 0.5, exchange: "Binance manuel" }])
Position.create!([{portfolio_id: 1, coin_id: 1, entry_date: DateTime.current.to_date, amount: 40000, quantity: 1, exchange: "Binance manuel" }])
puts 'positions done'
