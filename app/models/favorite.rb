class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_microposts, through: :favorites, source: :micropost
  
  def favorite(micropost)
      favorites.find_or_create_by(micropost_id: micropost.id)
  end
  
  def unfavorite(micropost)
      favorite = favorites.find_by(micropost_id: micropost.id)
      favorite.destroy if favorite
  end
  
  def favorite?(micropost)
      favorite_microposts.include?(micropost)
  end
end
