# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
  	name 'event'
  	description "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea, amet, optio accusamus libero ex veritatis fuga at distinctio doloribus quam modi alias. Repellendus, ad culpa reprehenderit aliquam modi placeat fuga!"
  	start_at 1.day.from_now
  	end_at 2.day.from_now

  	association :user
  end
end
