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

def log_in_as(user)
  visit signin_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_button 'Sign in'
  expect(current_path).to eq(root_path)
end