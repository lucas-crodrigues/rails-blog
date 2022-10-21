require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(post_id: 3, author_id: 4)
  end

  before do
    subject.save
  end

  it 'is created correctly' do
    expect(subject.post_id).to eq(3)
  end

  it 'checks that the post_id is integer' do
    subject.post_id = 7.5
    expect(subject).to_not be_valid
  end

  it 'update_likes_counter method test' do
    author = User.create!(name: 'Lucas', posts_counter: 0)
    post = Post.create!(author:, title: 'test post', comments_counter: 0, likes_counter: 0)
    Like.create!(author:, post:)
    lastpost = Post.last
    expect(lastpost.likes_counter).to eq 1
  end
end
