require 'rails_helper'

RSpec.describe 'User pages functionality : user show page', type: :feature do
  let!(:user) do
    User.create(name: 'Shrek', photo: 'https://cdns-images.dzcdn.net/images/artist/6a69bf26f8d1e51b67ac0c11a8ba1a77/500x500.jpg',
                bio: 'Swamp dweller, Onion eater')
  end

  let!(:post) do
    Post.create(author_id: user.id, title: 'Swamp life', text: 'Swamps are great, as long as theyre not swamped')
  end

  before(:each) do
    visit user_path(user)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_xpath("//img[@src='#{user.photo}']")
  end

  it "I can see the user's username" do
    expect(page).to have_text(user.name)
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content(/posts:[\d+]/i)
  end

  it "I can see the user's bio." do
    expect(page).to have_content(/#{user.bio}/i)
  end

  it "I can see a button that lets me view all of a user's posts." do
    expect(page).to have_text(/See all posts/i)
  end

  it "When I click a user's post, it redirects me to that post's show page." do
    visit user_posts_path(user)
    click_on post.title
    expect(page).to have_current_path(user_post_path(user, post))
  end

  it "When I click to see all posts, it redirects me to the user's post's index page" do
    visit user_post_path(user, post)
    click_on 'See all posts'
    expect(page).to have_current_path(user_posts_path(user))
  end
end
