class Note < ActiveRecord::Base
	validates :body, :person_id, presence: true
	belongs_to :person
end