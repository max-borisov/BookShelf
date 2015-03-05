def validate_presence_of(model, attribute)
  model[attribute] = nil
  model.valid?
  expect(model.errors[attribute]).to include("can't be blank")
end

def validate_max_length_of(model, attribute, length)
  model[attribute] = 'a' * length
  model.valid?
  expect(model.errors[attribute][0]).to match(/too long/)
end