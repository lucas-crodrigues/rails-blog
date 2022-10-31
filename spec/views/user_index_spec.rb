require 'rails_helper'

RSpec.describe 'User pages functionality: User index page ', type: :feature do
  let!(:user1) do
    User.create(name: 'Shrek', photo: 'https://cdns-images.dzcdn.net/images/artist/6a69bf26f8d1e51b67ac0c11a8ba1a77/500x500.jpg',
                bio: 'Swamp dweller, Onion eater')
  end
  
  let!(:user2) do
     User.create(name: 'Donkey', photo: 'https://i.pinimg.com/736x/2b/30/e9/2b30e9476db1ec0823c7142e0e5ef75a--shrek-character-shrek-donkey.jpg',
                bio: 'Rescuer of princesses, Layer of dragons')
  end

  it 'signs @user / in home ' do
    visit '/'
    expect(current_path).to eq(root_path)
  end

  it 'signs @user /users/ in home' do
    visit '/users'
    expect(current_path).to eq(users_path)
  end

  it 'I can see the username of all other users.' do
    visit root_path
    expect(page).to have_text(user1.name)
    expect(page).to have_text(user2.name)
  end

  it 'I can see the number of posts each user has written.' do
    visit users_path
    expect(page).to have_text(/posts: #{user1.posts_counter}/i)
  end

  it 'I can see the profile picture for each user' do
    visit users_path
    expect(page).to have_xpath("//img[@src ='#{user1.photo}']")
  end

  it "When I click on a user, I am redirected to that user's show page' " do
    visit users_path
    click_on user1.name
    expect(page).to have_current_path(user_path(user1))
  end
end
