class Lyric < Feature

  field :completed_at, type: Time

  belongs_to :lyricism, polymorphic: true

  def complete
    update_attributes completed_at: Time.now
  end

  def completed?
    self.completed_at.present?
  end
end
