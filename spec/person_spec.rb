require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'

class Person < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :license, :drink, :image_url

	attr_accessor :drunk

	def name
		"#{self.first_name} #{self.last_name}"
	end

	def birthday
		self.birthdate.strftime('%d-%B %Y') rescue self.birthdate
	end

	def have_a_drink
		age = Time.now.year - self.birthdate.year rescue 0
		if age > 21
			if self.drunk >= self.drink
				"Go home #{self.name} you're drunk"
			else
				self.drunk = self.drunk + self.drink + 1 if self.drunk.nil?
				self.drunk = self.drunk + 1 if !self.drunk.nil?
				self.drunk
			end
		else
			"waif a few years"
		end
	end

	def drive_a_car
		age = Time.now.year - self.birthdate.year rescue 0
		if age < 18 
			"Not yet youngin"
		elsif age >= 18 && self.license
		elsif age > 21 && self.drunk == (self.drink + 3)
			"Looks like a cab for you tonight"
		end
	end

	def sober_up
		self.drunk = self.drunk - 1 if self.drunk > self.drink
		self.drunk
	end
end

describe Person do 
	it "Verify Blank Attributes" do
		person = build(:person)
		expect(person.first_name).not_to eq("")
		expect(person.first_name).not_to eq(nil)
		expect(person.last_name).not_to eq("")
		expect(person.last_name).not_to eq(nil)
		expect(person.image_url).not_to eq("")
		expect(person.image_url).not_to eq(nil)
		expect(person.drink).not_to eq(0)
		expect(person.drink).not_to eq(nil)
		expect(person.license).not_to eq(0)
		expect(person.license).not_to eq(nil)
	end 
end
