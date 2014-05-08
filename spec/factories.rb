FactoryGirl.define do |f|
	factory :person do
		first_name 'abc'
		last_name 'xyz'
		image_url 'http://placehold.it/100x100'
		drink ''
		license true 
	end
end
