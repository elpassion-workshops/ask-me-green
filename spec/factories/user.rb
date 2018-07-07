Factory.sequence :email do |n|
  “test#{n}@example.com”
end

Factory.define :user do |user|
  user.name "Test User"
  user.email { Factory.next(:email) }
  user.password "password"
  user.password_confirmation "password"
end