module ApplicationHelper
  def flash_class(type)
    case type
    when :alert
      "alert-error"
    when :notice
      "alert-success"
    else
      ""
    end
  end
  
  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'help-inline' do
        model.errors[attribute].join(", ")
      end
    end
  end
end
