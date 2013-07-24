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
  
  def school_settings
    ["City: Large", "City: Midsize", "City: Small", "Suburb: Large", "Suburb: Midsize", "Suburb: Small", "Sticks"]
  end
  
  def school_institution_types
    ["Public Institution", "Private Not For Profit Institution", "Private For Profit Institution", "Other"]
  end
  
  def yes_no
    ["", "Yes", "No", "Unknown"]
  end
  
  def format_address(address, url=false)
    output = ""
    output << address.address1 + ", "
    if address.address2?
      output << address.address2 + ", "
    end
    output << address.city + ", "
    output << address.state + " "
    output << address.zip
    if url == true
      output = output.gsub(" ", "+")
    else
      output
    end

  end
  
  def offers_benefits(benefit)
    case benefit
    when "Yes"
      image_tag 'does.png', class: 'service-status'
    when "No"
      image_tag 'doesnot.png', class: 'service-status'
    else
      image_tag 'unknown.png', class: 'service-status'
    end
  end
 
end
