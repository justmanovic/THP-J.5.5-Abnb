class Town < ApplicationRecord
  validates :zip_code,
  uniqueness: true,
  presence: true,
  format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }



  # # validate self.test_method?: true
  # validate :test_method?


  # # has_many :accomodations
  
  # # private

  # def test_method?
  #   print :zip_code
  #   errors.add(:base, 'zip code trop élevé') if 1 == 2
  # end
  
end

