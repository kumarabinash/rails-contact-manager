require 'rails_helper'

RSpec.describe Person, type: :model do
	let(:person) do
		Person.new(first_name: "Ramesh", last_name: "Narayan")
	end

	it 'is valid' do
		expect(person).to be_valid
	end

  it 'is invalid without a first_name' do
  	# person = Person.new(first_name: nil)
  	person.first_name = nil
  	expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
  	# person = Person.new(first_name: "Kumar", last_name: nil)
  	person.last_name = nil
  	expect(person).not_to be_valid
  end

  it 'has an array of phone numbers' do
    expect(person.phone_numbers).to eq([])
  end

  it 'has an array of email addresses' do
    expect(person.email_addresses).to eq([])
  end
end