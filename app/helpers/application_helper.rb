module ApplicationHelper
  NAME = "Bard"

  DESCRIPTION = %q{ A web application devoted to motivating your client's work. }

  AUTHOR = { "Kurtis Rainbolt-Greene" => "kurtisrainboltgreene@gmail.com",
    "Fernando Oritz" => "...", "Cameron Samson" => "verros@gmail.com" }

  KEYWORDS = [ "web application", "agile", "tracker", "feature", "story", "gamification" ]

  def view_title(title = nil)
    if title.present? then "#{NAME} - #{title}" else NAME end
  end

  def view_description(description = nil)
    if description.present? then "#{DESCRIPTION}\n#{description}" else DESCRIPTION end
  end

  def view_author(author = {})
    if author.present?
      AUTHOR.merge(author)
    else
      AUTHOR
    end.map do |key, value|
      "#{key} (#{value})"
    end.join(', ')
  end

  def view_keywords(keywords = [])
    if keywords.present?
      keywords << KEYWORDS
    else
      KEYWORDS
    end.join(', ')
  end

  def view_has_header?
    @header
  end

  def view_has_footer?
    @footer
  end

  def popovers
    {
      mandy: {
        title: "Little Mandy",
        content:  "This is Little Mandy, he's the little monster that couldn't.
                    If only he had some process to see what he was doing wrong!" }
    }
  end

  def popover_for(token)

    popovers[token]
  end

  def twipsys
    {
      pitch_button: "Trust us, you'll wonder why you didn't do this sooner!"
    }
  end

  def twipsy_for(token)
    { twipsy: twipsys[token] }
  end
end
