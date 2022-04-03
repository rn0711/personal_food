class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  has_many :comments

  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :image, :title, :text, presence: true

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
