FactoryBot.define do
  factory :v1_property, class: 'V1::Property' do
    user_id {Faker::Number.number(4)}
    title 'some random building'
    description 'some random description'
    street_address '123 street xyz road'
    post_code '3073'
    state 'Victoria'
    
  end
end
