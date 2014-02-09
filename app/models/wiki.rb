class Wiki < ActiveRecord::Base

  belongs_to :user

  attr_accessible :body, :title

  default_scope order('created_at DESC')

  validates :title, presence: true
  validates :body, presence: true

end
