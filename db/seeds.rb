Match.create!([
  {girl_id: 1, boy_id: 3}
])
User.create!([
  {first_name: "Rikki", last_name: "Berger", email: "rikki@example.com", password_digest: "$2a$12$pgEXJ6qzIQKxYZHA3BwUkuwTYMwlZ7xR4WPePTM09vKKQrGM459oa", gender: "female", birthday: "06/06/2000", address: "123 Sesame Street", phone_number: "111-111-1111", currently_doing: "nothing really", education: "school a", references: nil, additional_info: "none at the moment ", admin: false},
  {first_name: "Tzipora", last_name: "Werzberger", email: "tzipora@example.com", password_digest: "$2a$12$Ou7w8Wi0s2GSaW2f.21B7eGHBlLxdg9OyXaQRKr0gSf9QVIaOoTde", gender: nil, birthday: nil, address: nil, phone_number: nil, currently_doing: nil, education: nil, references: nil, additional_info: nil, admin: true},
  {first_name: "Abe", last_name: "Klein", email: "abe@example.com", password_digest: "$2a$12$wskyiBO/TdPEuzM7FKV07.4TbcjsABbDy8GwDzwiDp1FBiT69Kl3a", gender: "male", birthday: "06/06/1998", address: "786 Sesame Street", phone_number: "111-111-1111", currently_doing: "a little of everything", education: "school c", references: nil, additional_info: "loves hiking ", admin: false}
])
