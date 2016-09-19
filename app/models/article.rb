class Article < ApplicationRecord
  belongs_to :owner

  def owner_name
    owner.name
  end
end
