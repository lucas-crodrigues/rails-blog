require 'rails_helper'

RSpec.describe 'User post show page', type: :feature do
  let!(:user) do
    User.create(name: 'Shrek', photo: 'https://cdns-images.dzcdn.net/images/artist/6a69bf26f8d1e51b67ac0c11a8ba1a77/500x500.jpg',
                bio: 'Swamp dweller, Onion eater')
  end

  let!(:post) do
    Post.create(author_id: user.id, title: 'Swamp life', text: 'Swamps are great, as long as theyre not swamped')
  end

  let!(:comment) do
    Comment.create(post_id: post.id, author_id: user.id, text: 'This is my first comment')
  end

  let!(:like) do
    Like.create(post_id: post.id, author_id: user.id)
  end

  before(:each) do
    visit user_post_path(user, post)
  end

  it "I can see the post's title." do
    expect(page).to have_content(post.title)
  end

  it 'I can see who wrote the post.' do
    expect(page).to have_content(user.name)
  end

  it 'I can see how many comments it has.' do
    expect(page).to have_content('Comments:1')
  end

  it 'I can see how many likes it has.' do
    expect(page).to have_content('Likes:1')
  end

  it 'I can see the post body.' do
    expect(page).to have_content(post.text)
  end

  it 'I can see the username of each commentor.' do
    expect(page).to have_content("#{user.name} :")
  end

  it 'I can see the comment each commentor left.' do
    expect(page).to have_content(comment.text)
  end
end
