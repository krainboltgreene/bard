class Lyric < Feature
  belongs_to :lyricism, polymorphic: true

  field :completed_at, type: Time

  def complete
    update_attributes completed_at: Time.now
  end

  def completed?
    self.completed_at.present?
  end
end
