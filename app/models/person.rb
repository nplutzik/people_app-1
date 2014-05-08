# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  birthdate  :date
#  drink      :integer          default(0)
#  image_url  :string(255)
#  license    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :license, :drink, :image_url
end
