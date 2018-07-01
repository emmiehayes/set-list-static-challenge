class Song < ActiveRecord::Base

  #line 3 makes sure the title is not nil.  it could be empty, just not nil
  validates_presence_of :title, :length
  belongs_to :playlist

  def self.total_play_count
    sum(:play_count)
  end

  def self.average_play_count
    average(:play_count)
  end

end
