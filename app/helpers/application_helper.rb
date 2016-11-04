module ApplicationHelper

  def header(text)
    content_for(:header) { text.to_s }
  end

  def cancel_link
    return link_to 'Cancel', request.env["HTTP_REFERER"],
      :class => 'cancel'
  end
end
