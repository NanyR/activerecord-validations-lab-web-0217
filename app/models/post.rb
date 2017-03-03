class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait


  def clickbait
    clickbaity=["Won't Believe", "Secret", "Top", "Guess"]
    if !clickbaity.any?{ |word| title.nil?||title.include?(word) }
        errors.add :title, "must contain clickbait"
      end
  end

end
