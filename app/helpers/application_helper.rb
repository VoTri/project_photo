module ApplicationHelper

  def time(time)
    distance_of_time_in_words(time, Time.now, include_seconds: true)
  end

end
