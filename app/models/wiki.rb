class Wiki < ActiveRecord::Base

  belongs_to :user

  attr_accessible :body, :title, :public

  default_scope order('created_at DESC')

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true

end
