class CustomPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /\A(?=.*[A-Z])(?=.*[0-9])(?=.*[^\w\s]).{8,}\z/

    record.errors.add(attribute, :invalid_format,
                      message: 'must contain one uppercase letter, one number and one special character')
  end
end
