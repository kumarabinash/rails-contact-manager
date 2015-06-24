require 'rails_helper'

describe 'the person view', type: :feature do
	let(:person) {Person.create(first_name: "Sas", last_name: "Wati")}

	before(:each) do
		person.phone_numbers.create(number: "9090504070")
		person.phone_numbers.create(number: "8746868148")
		visit person_path(person)
	end

	it 'shows the phone number' do
		person.phone_numbers.each do |phone|
			expect(page).to have_content(phone.number)
		end
	end


	#ADDING
	it 'should have a link to add phone number' do
		expect(page).to have_link('Add Phone Number', href: new_phone_number_path(person_id: person.id))
	end

	it 'adds a new phone number' do
		page.click_link('Add Phone Number')
		page.fill_in('Number', with: '9090909090')
		page.click_button('Create Phone number')
		expect(current_path).to eq(person_path(person))
		expect(page).to have_content('9090909090')
	end


	#EDITING
	it 'has links to edit phone numbers' do
		person.phone_numbers.each do |phone|
			expect(page).to have_link("Edit", href: edit_phone_number_path(phone))
		end
	end

	it 'edits a phone number' do
		phone = person.phone_numbers.first
		old_number = phone.number

		first(:link, "Edit").click
		page.fill_in('Number', with: "9929392392")
		page.click_button('Update Phone number')
		expect(current_path).to eq(person_path(person))
		expect(page).to have_content('9929392392')
		expect(page).to_not have_content(old_number)
	end

	#DELETING
	it 'has links to delete a phone number' do
		person.phone_numbers.each do |phone|
			expect(page).to have_link("Delete", href: phone_number_path(phone))
		end
	end

	it 'deletes a phone number' do
		phone = person.phone_numbers.first
		old_number = phone.number

		first(:link, "Delete").click
		expect(current_path).to eq(person_path(person))
		expect(page).to_not have_content(old_number)
	end
end