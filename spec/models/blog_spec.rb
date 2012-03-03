require 'spec_helper'

describe Blog do
  it 'should require a title' do
    blog = Blog.new
    blog.should_not be_valid
  end
end
