require 'rails_helper'

RSpec.describe Background do
  it 'exists' do
    data = {:total=>494,
             :total_pages=>494,
             :results=>
              [{:id=>"WWl6xaSHFIo",
                :created_at=>"2019-01-29T23:56:42-05:00",
                :updated_at=>"2021-03-08T12:07:07-05:00",
                :promoted_at=>nil,
                :width=>5456,
                :height=>3632,
                :color=>"#c0c0d9",
                :blur_hash=>"LnI5xxRjbIfQ_4ozM{ofIUWBRiay",
                :description=>"Weather radar atop a mountain on a foggy afternoon",
                :alt_description=>"white concrete building",
                :urls=>
                 {:raw=>
                   "https://images.unsplash.com/photo-1548824049-12fcd2c576a3?ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxTdC5Mb3VpcyxNT3xlbnwwfHx8fDE2MTUyNTQ2ODI&ixlib=rb-1.2.1",
                  :full=>
                   "https://images.unsplash.com/photo-1548824049-12fcd2c576a3?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxTdC5Mb3VpcyxNT3xlbnwwfHx8fDE2MTUyNTQ2ODI&ixlib=rb-1.2.1&q=85",
                  :regular=>
                   "https://images.unsplash.com/photo-1548824049-12fcd2c576a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxTdC5Mb3VpcyxNT3xlbnwwfHx8fDE2MTUyNTQ2ODI&ixlib=rb-1.2.1&q=80&w=1080",
                  :small=>
                   "https://images.unsplash.com/photo-1548824049-12fcd2c576a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxTdC5Mb3VpcyxNT3xlbnwwfHx8fDE2MTUyNTQ2ODI&ixlib=rb-1.2.1&q=80&w=400",
                  :thumb=>
                   "https://images.unsplash.com/photo-1548824049-12fcd2c576a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxTdC5Mb3VpcyxNT3xlbnwwfHx8fDE2MTUyNTQ2ODI&ixlib=rb-1.2.1&q=80&w=200"},
                :links=>
                 {:self=>"https://api.unsplash.com/photos/WWl6xaSHFIo",
                  :html=>"https://unsplash.com/photos/WWl6xaSHFIo",
                  :download=>"https://unsplash.com/photos/WWl6xaSHFIo/download",
                  :download_location=>
                   "https://api.unsplash.com/photos/WWl6xaSHFIo/download?ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxTdC5Mb3VpcyxNT3xlbnwwfHx8fDE2MTUyNTQ2ODI"},
                :categories=>[],
                :likes=>3,
                :liked_by_user=>false,
                :current_user_collections=>[],
                :sponsorship=>nil,
                :user=>
                 {:id=>"qpPcgmIB4lw",
                  :updated_at=>"2021-03-08T10:45:28-05:00",
                  :username=>"kelvinyan",
                  :name=>"Kelvin Yan",
                  :first_name=>"Kelvin",
                  :last_name=>"Yan",
                  :twitter_username=>nil,
                  :portfolio_url=>"Https://bravoka.github.io",
                  :bio=>"The more I learn, the less I realize I know.",
                  :location=>nil,
                  :links=>
                   {:self=>"https://api.unsplash.com/users/kelvinyan",
                    :html=>"https://unsplash.com/@kelvinyan",
                    :photos=>"https://api.unsplash.com/users/kelvinyan/photos",
                    :likes=>"https://api.unsplash.com/users/kelvinyan/likes",
                    :portfolio=>"https://api.unsplash.com/users/kelvinyan/portfolio",
                    :following=>"https://api.unsplash.com/users/kelvinyan/following",
                    :followers=>"https://api.unsplash.com/users/kelvinyan/followers"},
                  :profile_image=>
                   {:small=>"https://images.unsplash.com/profile-1575435904268-4b268ef06c98image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                    :medium=>"https://images.unsplash.com/profile-1575435904268-4b268ef06c98image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                    :large=>"https://images.unsplash.com/profile-1575435904268-4b268ef06c98image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
                  :instagram_username=>"bravo_k",
                  :total_collections=>1,
                  :total_likes=>30,
                  :total_photos=>40,
                  :accepted_tos=>true,
                  :for_hire=>false},
                :tags=>[{:type=>"search", :title=>"architecture"}, {:type=>"search", :title=>"building"}, {:type=>"search", :title=>"planetarium"}]}]}
    location = "St.Louis,MO"

    background = Background.new(data, location)
    expect(background).to be_a(Background)
    expect(background).to have_attributes( credit: {:source=>"Unsplash API",
                                                    :author=>"kelvinyan"},
                                           description: "Weather radar atop a mountain on a foggy afternoon",
                                           id: nil,
                                           image: {:url=> "https://images.unsplash.com/photo-1548824049-12fcd2c576a3?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxTdC5Mb3VpcyxNT3xlbnwwfHx8fDE2MTUyNTQ2ODI&ixlib=rb-1.2.1&q=85",
                                                   :location=>"St.Louis,MO"})
  end
end
