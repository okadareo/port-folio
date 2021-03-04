class Research < ApplicationRecord
  belongs_to :customer
  belongs_to :estate

  validates :title, presence: :true, length: { minimum: 2 }
  validates :body, presence: :true, length: { minimum: 10 }

  enum status: {未対応: false, 対応済: true }
  
  def self.search(method,word)
    if method == "forward_match"
            @researches = Research.where("text LIKE?","#{word}%")
    elsif method == "backward_match"
            @researches = Research.where("text LIKE?","%#{word}")
    elsif method == "perfect_match"
            @researches = Research.where("#{word}")
    elsif method == "partial_match"
            @researches = Research.where("text LIKE?","%#{word}%")
    else
            @researches = Post.all
    end
  end
end
