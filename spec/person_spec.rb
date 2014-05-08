require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'pry'

describe "PersonMode" do 
	it "Verify Blank Attributes" do
		person = build(:person)
		person.first_name.should_not eq('')
		person.first_name.should_not eq(nil)
		person.last_name.should_not eq('')
		person.last_name.should_not eq(nil)
		person.image_url.should_not eq('')
		person.image_url.should_not eq(nil)
		person.drink.should_not eq('')
		person.drink.should_not eq(nil)
		person.license.should_not eq('')
		person.license.should_not eq(nil)
	end 
end
