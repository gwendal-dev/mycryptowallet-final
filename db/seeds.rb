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
Coin.create!([{title: "BTC", price: 37876, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/BTC.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/btc2_oantvn.jpg"}])
Coin.create!([{title: "ETH", price: 2560, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729798/ETH_l1aqr6.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729798/eth2_uonbiy.jpg"}])
Coin.create!([{title: "ADA", price: 1.6, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729805/ADA.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729806/ada2_zepvqe.png"}])
Coin.create!([{title: "LINK", price: 34, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729798/LINK_dxbpev.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729798/link2_f6thg6.jpg"}])
Coin.create!([{title: "BNB", price: 346, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/BNB.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729805/bnb2_bopdim.png"}])
Coin.create!([{title: "DOGE", price: 0.34, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729802/DOGE.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/doge2_acoavp.jpg"}])
Coin.create!([{title: "DOT", price: 24, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/DOT_msfzhg.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/dot2_pqb58g.jpg"}])
Coin.create!([{title: "BNT", price: 8.3, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729807/BNT.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729806/bnt2_t5ps2t.jpg"}])
Coin.create!([{title: "AAVE", price: 358, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/AAVE.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/aave2_ekwpyo.jpg"}])
Coin.create!([{title: "USDT", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729799/USDT_moo5pe.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729799/usdt2_mbshrq.webp"}])

Coin.create!([{title: "XRP", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729800/XRP.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729801/xrp2_hcijwf.jpg"}])
Coin.create!([{title: "UNI", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729798/UNI_kks7o3.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729799/uni2_ogrjru.jpg"}])
Coin.create!([{title: "ICP", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729802/ICP.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729803/icp2_jcdipt.webp"}])
Coin.create!([{title: "BCH", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729802/BCH.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729800/bch2_fswlgg.png"}])
Coin.create!([{title: "LTC", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729802/LTC.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729802/ltc2_wkwucw.jpg"}])
Coin.create!([{title: "MATIC", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729803/MATIC.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729803/matic2_hqbcot.png"}])
Coin.create!([{title: "XLM", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729803/XLM.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/xlm2_qyrmfg.jpg"}])
Coin.create!([{title: "SOL", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/SOL_yhjrxz.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/sol2_jlceww.jpg"}])
Coin.create!([{title: "THETA", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729801/THETA.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729803/theta2_oxl8zi.jpg"}])
Coin.create!([{title: "VET", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729801/VET.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622729802/vet2_lt561w.jpg"}])

Coin.create!([{title: "HOT", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729798/HOT_g5a5ut.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622796129/hot2_gyilv8.jpg"}])
Coin.create!([{title: "WIN", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729800/WIN_s3hiir.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622796129/win2_oq8xhc.png"}])
Coin.create!([{title: "AUDIO", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622797196/AUDIO_jnre9q.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622796129/audio2_fiuxra.png"}])
Coin.create!([{title: "AAVEUP", price: 1, avatar: "https://res.cloudinary.com/deph8klff/image/upload/v1622729804/AAVEUP.jpg", background: "https://res.cloudinary.com/deph8klff/image/upload/v1622796128/aaveup2_qgzigy.jpg"}])

puts 'coins done'
puts '-----------------------------------------'
puts 'END'
