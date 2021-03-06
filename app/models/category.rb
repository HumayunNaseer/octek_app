class Category < ApplicationRecord

  has_many :products
  has_many :articles, through: :article_categories
  validates :name , presence: true , length: {minimum: 3, maximum: 25}
  validates_uniqueness_of :name

end
