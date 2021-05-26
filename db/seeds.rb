# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{email: "aaa@gmail.com", nickname: "brandon", password: 1232343 }])
portefolios = Portfolio.create!([{title: "Mon portefolio 1", user_id: 1}])
Coin.create!([{title: "BTC", price: 37876, avatar: ""}])
Coin.create!([{title: "ETH", price: 2560, avatar: ""}])
Coin.create!([{title: "ADA", price: 1.6, avatar: ""}])
Coin.create!([{title: "LINK", price: 34, avatar: ""}])
Coin.create!([{title: "BNB", price: 346, avatar: ""}])
Coin.create!([{title: "DOGE", price: 0.34, avatar: ""}])
Coin.create!([{title: "DOT", price: 24, avatar: ""}])
Coin.create!([{title: "BNT", price: 8.3, avatar: ""}])
Coin.create!([{title: "AAVE", price: 358, avatar: ""}])
Position.create!([{portfolio_id: 1, coin_id: 2, entry_date: DateTime.current.to_date, amount: 1250, quantity: 0.5, exchange: "Binance manuel" }])
Position.create!([{portfolio_id: 1, coin_id: 1, entry_date: DateTime.current.to_date, amount: 40000, quantity: 1, exchange: "Binance manuel" }])
