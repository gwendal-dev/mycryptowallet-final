# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{email: "damo6234@gmail.com", nickname: "brandon", password: 1232343 }])
portefolios = Portfolio.create!([{title: "Mon portefolio 1", user_id: 1}])
coins = Coin.create!([{title: "ADA/USDT", price: 1.6, avatar: ""}])
Coin.create!([{title: "BTC/USDT", price: 37876, avatar: ""}])
Coin.create!([{title: "ETH/USDT", price: 2560, avatar: ""}])
Coin.create!([{title: "LINK/USDT", price: 34, avatar: ""}])
Coin.create!([{title: "BNB/USDT", price: 346, avatar: ""}])
Coin.create!([{title: "DOGE/USDT", price: 0.34, avatar: ""}])
Coin.create!([{title: "DOT/USDT", price: 24, avatar: ""}])
Coin.create!([{title: "BNT/USDT", price: 8.3, avatar: ""}])
Coin.create!([{title: "AAVE/USDT", price: 358, avatar: ""}])
positions = Position.create!([{portfolio_id: 1, coin_id: 1, entry_date: DateTime.current.to_date, amount: 230, quantity: 0.5, exchange: "Binance manuel" }])

