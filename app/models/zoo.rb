class Zoo < ActiveRecord::Base
	has_many :animals, dependent: :destroy
end
