class UserValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, "must be your email" unless
    value == current_user.email
  end
end
