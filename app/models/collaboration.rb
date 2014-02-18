class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
  # attr_accessible :title, :body
  attr_accessible :user_id, :wiki_id
end
