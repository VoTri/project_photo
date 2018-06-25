module PhotosHelper
  def time(time)
    distance_of_time_in_words(time, Time.now, include_seconds: true)
  end

  def reply(comment)
    @photo = comment.photo
    @photo.comments.order("created_at desc").where(parent_id: comment.id)
  end
end
