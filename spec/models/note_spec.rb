require 'rails_helper'

RSpec.describe Note, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:note) {Note.new(body: "This is a demo note", person_id: 1)}

  it 'is valid' do
  	expect(note).to be_valid
  end

  it 'is invalid without a body' do
  	note.body = nil
  	expect(note).to_not be_valid
  end

  it 'must have reference to a person' do
  	note.person_id = nil
  	expect(note).to_not be_valid
  end

  it 'must be associated with a person' do
  	expect(note).to respond_to(:person)
  end
end
