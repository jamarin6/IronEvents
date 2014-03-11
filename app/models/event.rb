class Event < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 60 }
	# validates_presence_of :name
	# validates_length_of :name, maximum: 60
	validates :description, length: {minimum: 100}, allow_blank: true
	validate :start_at_is_present #aqui al ser validacion nuestra propia es en singular

#private
#	def description_present?
#		description.present?
#	end
#end
private

  def start_at_is_present
  	if start_at.blank?
  		errors.add(:start_at, "debes introducir la fecha de inicio")
  	end
  end


end