module ApplicationHelper
  def errors_msg(object, field_name)
    @errors = object.errors.messages[field_name]
  end
end
