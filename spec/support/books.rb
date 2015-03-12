def validate_uniqueness_of(model, attribute, dup_model)
  model.save
  dup_model[attribute] = model[attribute]
  dup_model.valid?
  expect(dup_model.errors[attribute]).to include('is not unique')
end