# encoding: utf-8

FactoryGirl.define do
  factory :repository do
  	factory :sisyphus_repository do
      name 'Sisyphus'
      short_url 'sisyphus'
      vendor 'ALT Linux Team'
      distribution 'ALT Linux'
      download_path '/Sisyphus'
      order_id
    end
  end

  sequence :order_id do |n|
    "#{n}"
  end
end
