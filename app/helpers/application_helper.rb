module ApplicationHelper
  def submit_with_recaptcha(text, custom_options)
    unless custom_options[:data].has_key?(:form_id)
      raise "Data Form Id option not found ('{data: {form_id: 'id_without_dash'}')."
    end

    options = {
      type: 'button',
      data: {
        form_id: custom_options[:data][:form_id],
        sitekey: recaptcha_site_key,
        callback: "submit#{custom_options[:data][:form_id].camelize}#{Time.current.to_i}"
      },
      class: (custom_options[:class].split(' ') + ['g-recaptcha']).uniq.join(' ')
    }

    script_code = <<-SCRIPT
      function #{options[:data][:callback]}() {
        document.getElementById('#{options[:data][:form_id]}').submit();
      }
    SCRIPT

    javascript_tag(script_code) + content_tag(:div, class: 'recaptcha_wrapper'){ submit_tag(text, options) }
  end

  private

  def recaptcha_site_key
    Rails.application.config_for(:recaptcha)['site_key']
  end
end
