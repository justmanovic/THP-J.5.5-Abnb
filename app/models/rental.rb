class Rental < ApplicationRecord

  belongs_to :accomodation
  belongs_to :guest, class_name: "User"

  validate :validate_other_rental_overlap

  def period
    start_date..end_date
  end

  private

  # def validate_other_rental_overlap
  #   other_rentals = Rental.all
  #   is_overlapping = other_rentals.any? do |other_rental|
  #     period.overlaps?(other_rental.period)
  #   end
  #   errors.add(:date_end, 'it overlaps another reservation') if is_overlapping
  # end

  def validate_other_rental_overlap
    Accomodation.all.each do |accomodation| 
      other_rentals = accomodation.rentals
      is_overlapping = other_rentals.any? do |other_rental|
        period.overlaps?(other_rental.period)
      end
      if is_overlapping
        errors.add(:validate_other_rental_overlap, 'it overlaps another reservation') 
      end
    end
  end
end