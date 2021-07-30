class Rental < ApplicationRecord
  # validate(:overlaping_reservation?)

  belongs_to :accomodation
  belongs_to :guest, class_name: "User"

  # def overlaping_reservation?
  #   false
  # end

  # def self.check_date_availability(booking_params)
  #   bookings = Booking.where('arrival_date < ? OR leaving_date > ?', self.arrival_date, self.leaving_date)
  #   return bookings.empty?
  # end

  # def is_available? time_range
  #   bookings.present?(:arrival < time_range.end AND :depature > timerange.start)
  # end


  # def rental_duration
  #   self.end_date - self.start_date
  # end
  validate :validate_other_booking_overlap


  def period
    start_date..end_date
  end

  private

  def validate_other_booking_overlap
    other_bookings = Booking.all
    is_overlapping = other_bookings.any? do |other_booking|
      period.overlaps?(other_booking.period)
    end
    errors.add(:overlaps_with_other) if is_overlapping
  end
end

# t.datetime "start_date"
# t.datetime "end_date"
# t.bigint "accomodation_id"
# t.bigint "guest_id"