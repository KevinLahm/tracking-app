class Run < ActiveRecord::Base
	belongs_to :user

	def self.valid_params?(params)
    return !params[:date].blank? && !params[:distance].blank? && !params[:duration].blank?
  end
end
