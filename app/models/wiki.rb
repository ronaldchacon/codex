class Wiki < ActiveRecord::Base

  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  attr_accessible :body, :title, :public

  default_scope order('created_at DESC')
  scope :visible_to, where(public: true)
  scope :public, where(public: true)

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true

end
