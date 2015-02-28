module ApplicationHelper
  def header(&block)
  content_for(:header) { capture(&block) }
  end
end
