class Patch < ActiveRecord::Base
  belongs_to :user

  has_many :patch_images, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  validates_presence_of :location
  validates_presence_of :patch_type
  validates_presence_of :duration

  def self.location_sort(params, max_distance)
    if params[:location].present?
      near(params[:location],
                max_distance).reorder(
                  'distance')
    else
      self
    end
  end

  def self.filter_results(params)
    search_filter_params = params.permit(
      :duration, :patch_type).reject { |_k, v| v == '' }
    where(
      search_filter_params).includes(
        :user).paginate(page: params[:page],
                        per_page: 10)
  end
end
