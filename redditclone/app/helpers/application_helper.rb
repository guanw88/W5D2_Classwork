module ApplicationHelper
  def auth_token
    "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\">".html_safe
  end

  def form_delete_hidden_input
    "<input type=\"hidden\" name=\"_method\" value=\"delete\">".html_safe
  end
end
