# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'START'
puts '-----------------------------------------'
User.create!([{email: "aaa@gmail.com", nickname: "brandon", password: 1232343 }])
puts 'user done'
puts '-----------------------------------------'
Portfolio.create!([{title: "Mon portefolio 1", user_id: 1}])
Portfolio.create!([{title: "Mon portefolio 2", user_id: 1}])
Portfolio.create!([{title: "Mon portefolio 3", user_id: 1}])
puts 'portfolios done'
puts '-----------------------------------------'
Coin.create!([{title: "BTC", price: 37876, avatar: "BTC.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/btc2_oantvn.jpg"}])
Coin.create!([{title: "ETH", price: 2560, avatar: "ETH.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729798/eth2_uonbiy.jpg"}])
Coin.create!([{title: "ADA", price: 1.6, avatar: "ADA.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729806/ada2_zepvqe.png"}])
Coin.create!([{title: "LINK", price: 34, avatar: "LINK.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729798/link2_f6thg6.jpg"}])
Coin.create!([{title: "BNB", price: 346, avatar: "BNB.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729805/bnb2_bopdim.png"}])
Coin.create!([{title: "DOGE", price: 0.34, avatar: "DOGE.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/doge2_acoavp.jpg"}])
Coin.create!([{title: "DOT", price: 24, avatar: "DOT.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/dot2_pqb58g.jpg"}])
Coin.create!([{title: "BNT", price: 8.3, avatar: "BNT.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729806/bnt2_t5ps2t.jpg"}])
Coin.create!([{title: "AAVE", price: 358, avatar: "AAVE.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/aave2_ekwpyo.jpg"}])
Coin.create!([{title: "USDT", price: 1, avatar: "USDT.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729799/usdt2_mbshrq.webp"}])

Coin.create!([{title: "XRP", price: 1, avatar: "XRP.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729801/xrp2_hcijwf.jpg"}])
Coin.create!([{title: "UNI", price: 1, avatar: "UNI.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729799/uni2_ogrjru.jpg"}])
Coin.create!([{title: "ICP", price: 1, avatar: "ICP.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729803/icp2_jcdipt.webp"}])
Coin.create!([{title: "BCH", price: 1, avatar: "BCH.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729800/bch2_fswlgg.png"}])
Coin.create!([{title: "LTC", price: 1, avatar: "LTC.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729802/ltc2_wkwucw.jpg"}])
Coin.create!([{title: "MATIC", price: 1, avatar: "MATIC.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729803/matic2_hqbcot.png"}])
Coin.create!([{title: "XLM", price: 1, avatar: "XLM.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/xlm2_qyrmfg.jpg"}])
Coin.create!([{title: "SOL", price: 1, avatar: "SOL.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/sol2_jlceww.jpg"}])
Coin.create!([{title: "THETA", price: 1, avatar: "THETA.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729803/theta2_oxl8zi.jpg"}])
Coin.create!([{title: "VET", price: 1, avatar: "VET.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729802/vet2_lt561w.jpg"}])

puts 'coins done'
puts '-----------------------------------------'
puts 'END'
