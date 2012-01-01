class Lyric < Feature

  field :completed_at, type: Time

  def complete
    update_attributes completed_at: Time.now
  end

  def completed?
    completed_at.present?
  end
end
