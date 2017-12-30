class RangeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, "must be in range 1 - 10" unless
      (1..10).include?(value)
  end
end
