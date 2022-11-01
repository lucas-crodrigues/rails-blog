require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  let!(:user1) do
    User.create(name: 'Shrek', photo: 'https://cdns-images.dzcdn.net/images/artist/6a69bf26f8d1e51b67ac0c11a8ba1a77/500x500.jpg',
                bio: 'Swamp dweller, Onion eater')
  end

  let!(:user2) do
    User.create(name: 'Donkey', photo: 'https://i.pinimg.com/736x/2b/30/e9/2b30e9476db1ec0823c7142e0e5ef75a--shrek-character-shrek-donkey.jpg',
                bio: 'Rescuer of princesses, Layer of dragons')
  end

  let!(:post1) do
    Post.create(author_id: user1.id, title: 'Swamp life', text: 'Swamps are great, as long as theyre not swamped')
  end

  let!(:post2) do
    Post.create(author_id: user1.id, title: 'Swamp life 2', text: 'Swamps are great, as long as theyre not swamped')
  end

  let!(:post3) do
    Post.create(author_id: user1.id, title: 'Swamp life 3', text: 'Swamps are great, as long as theyre not swamped')
  end

  let!(:post4) do
    Post.create(author_id: user1.id, title: 'Swamp life 4', text: 'Swamps are great, as long as theyre not swamped')
  end

  let!(:comment) do
    Comment.create(post_id: post3.id, author_id: user1.id, text: 'This is my first comment')
  end

  let!(:like) do
    Like.create(post_id: post3.id, author_id: user1.id)
  end

  before(:each) do
    visit user_posts_path(user1)
  end

  it 'I can see the users profile picture.' do
    expect(page).to have_xpath("//img[@src='#{user1.photo}']")
  end

  it 'I can see the users username.' do
    expect(page).to have_content('Shrek')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content(/posts:4/i)
  end

  it 'I can see a posts title.' do
    expect(page).to have_content('Post #', count: 4)
  end

  it 'I can see some of the posts body.' do
    expect(page).to have_content(post1.text, count: 4)
  end

  it 'I can see the first comments on a post.' do
    expect(page).to have_content(comment.text)
  end

  it 'I can see how many comments a post has.' do
    expect(page).to have_content('Comments:1')
  end

  it 'I can see how many likes a post has.' do
    expect(page).to have_content('Likes:1')
  end

  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    expect(page).to have_button('Paginations')
  end

  it 'When I click on a post, it redirects me to that posts show page.' do
    click_link("Post ##{post2.id}")
    expect(page).to have_content("Post ##{post2.id} by #{user1.name}")
  end
end
