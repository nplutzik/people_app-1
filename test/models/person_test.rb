require 'test_helper'

describe Person do
	before do
		@person = build(:person)
	end
	it 'validate attributes' do
		print @person.first_name
	end
end
