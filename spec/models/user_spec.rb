require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Lucas', posts_counter: 0) }

  before { subject.save }

  it 'name must not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be an integer greater than or equal to zero.' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'test the recent method' do
    5.times do |_post|
      Post.create(author: subject, title: 'Hello', text: 'This is my first post')
    end
    expect(subject.last_three_posts).to eq(subject.posts.last(3))
  end
end
