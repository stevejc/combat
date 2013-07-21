# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  article    :text
#  image      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blog < ActiveRecord::Base
  attr_accessible :article, :image, :title
  
  validates :article, :title, presence: true
end
