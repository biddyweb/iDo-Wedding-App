module RsvpsHelper
  def number_attending_content(rsvp, html_tag = :p, html_options = {})
    content_tag(
      html_tag,
      (case rsvp.number_attending
      when 1: 'Yes, I will be attending by myself.'
      when 2: 'Yes, I will be attending with a date.'
      else "Yes, all #{rsvp.number_attending.to_word} of us will be attending."
      end),
      html_options
    )
  end
  
  def wedding_location_map_content(options = {})
    returning '' do |html|
      html << content_tag(:iframe, '', :width => 840, :height => 350, :frameborder => 0, :scrolling => 'no', :marginheight => 0, :marginwidth => 0, :src => 'http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=405+Fieldston+Rd+Bellingham,+WA+98225+(Lairmont+Manor)&amp;sll=48.710748,-122.509611&amp;sspn=0.006662,0.008948&amp;ie=UTF8&amp;ll=48.717866,-122.505369&amp;spn=0.01982,0.068665&amp;z=14&amp;iwloc=A&amp;output=embed')
      html << tag(:br)
      html << tag(:small)
        html << link_to('View Larger Map', 'http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=405+Fieldston+Rd+Bellingham,+WA+98225+(Lairmont+Manor)&amp;sll=48.710748,-122.509611&amp;sspn=0.006662,0.008948&amp;ie=UTF8&amp;ll=48.717866,-122.505369&amp;spn=0.01982,0.068665&amp;z=14&amp;iwloc=A', :style => 'color:#0000FF;text-align:left')
      html << '</small>'
      html << tag(:noscript)
        html << tag(:ul, :class => 'address')
          html << content_tag(:li, 'Lairmont Manor')
          html << content_tag(:li, '405 Fieldston Road')
          html << content_tag(:li, 'Bellingham, WA 98225')
        html << '</ul>'
      html << '</noscript>'
      html << content_tag(:div, '', :class => 'clear')
    end
  end
end
