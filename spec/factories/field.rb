# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :field do
    id 28288165
    label "Image"
    app { |a| a.association(:app)}

    factory :required_field do
    	required true

    		factory :failing_field do
    			id 25050
    		end
    end
  end
end