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

  factory :maintainer do
    factory :maintainer_icesik do
      name 'Igor Zubkov'
      email 'icesik@altlinux.org'
      login 'icesik'
      time_zone 'UTC'
      jabber 'icesik@altlinux.org'
      info 'Lorem Ipsum'
      website 'http://packages.altlinux.org/'
      location 'Donetsk, Ukraine'
    end
  end
end
