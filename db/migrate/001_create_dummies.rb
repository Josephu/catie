class CreateDummies < ActiveRecord::Migration
	def change
		create_table :dummies do |t|
			t.text :data
		end
	end
end
