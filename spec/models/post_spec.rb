require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Test title', text: 'Test content for post description', author_id: 1) }

  before { subject.save }

  it 'Title must not be blank.' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters.' do
    subject.title = 'yo' * 126
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be an integer greater than or equal to zero.' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be an integer greater than or equal to zero.' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
