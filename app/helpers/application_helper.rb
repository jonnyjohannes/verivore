module ApplicationHelper
  
  def title(page_title)
    content_for :title, page_title 
  end
  
  def javascript(*files)
    content_for :head, javascript_include_tag(*files)
  end
  
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end
  
end
