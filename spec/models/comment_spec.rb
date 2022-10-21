require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(post_id: 1, author_id: 2)
  end

  before do
    subject.save
  end

  it 'is created correctly' do
    expect(subject.post_id).to eq(1)
  end

  it 'checks that the post_id is integer' do
    subject.post_id = 1.1
    expect(subject).to_not be_valid
  end

  it 'update_comments_counter method test' do
    author = User.create!(name: 'Lucas', posts_counter: 0)
    post = Post.create!(author:, title: 'test post', comments_counter: 0, likes_counter: 0)
    Comment.create!(text: 'test comment', author:, post:)
    lastpost = Post.last
    expect(lastpost.comments_counter).to eq 1
  end
end
