10.times do
	Contact.create({
		name: Faker::GameOfThrones.character,
		number: Faker::PhoneNumber.cell_phone
		})
end