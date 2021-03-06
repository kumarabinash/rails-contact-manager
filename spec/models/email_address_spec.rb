require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
	let(:email_address) {EmailAddress.new(address: 'saswati@gmail.com', person_id: 1)}

	it 'is valid' do
		expect(email_address).to be_valid
	end

	it 'is invalid without an address' do
		email_address.address = nil
		expect(email_address).to_not be_valid
	end

	it 'is associated with person' do
		expect(email_address).to respond_to(:person)
	end
end
