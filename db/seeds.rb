# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
  email: "b@b",
  name: "岡田",
  phone_number: "0300000000",
  password: "111111"
)

Admin.create!(
  email: 'a@a',
  password: 'aaaaaa'
)

20.times do |n|
  Estate.create!(
    admin_id: '1',
    background_image: open("app/assets/images/1.jpeg"),
    name: "バルク・ド・ハギ",
    room_number: "204",
    info: "エレベーター・オートロック付きのファミリー物件。北側には大きな公園があり、周辺に飲食店も多数あります！部屋の設備もバス・トイレ別、浴室乾燥機、温水洗浄便座、室内洗濯機置場と充実しています。",
    address: "東京都新宿区岡田町3-1",
    floor: "3LDK",
    price: "100000",
    floor_image: open("app/assets/images/1.jpeg"),
    property_image_a: open("app/assets/images/1.jpeg"),
    property_image_b: open("app/assets/images/1.jpeg"),
    property_image_c: open("app/assets/images/1.jpeg"),
    property_image_d: open("app/assets/images/1.jpeg"),
    property_image_e: open("app/assets/images/1.jpeg"),
    property_image_f: open("app/assets/images/1.jpeg"),
    property_image_g: open("app/assets/images/1.jpeg"),
    property_image_h: open("app/assets/images/1.jpeg"),
    property_image_i: open("app/assets/images/1.jpeg"),
    property_image_j: open("app/assets/images/1.jpeg"),
    property_image_k: open("app/assets/images/1.jpeg"),
    property_image_l: open("app/assets/images/1.jpeg"),
  )
  sleep(1)
end