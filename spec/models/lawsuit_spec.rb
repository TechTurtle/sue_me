require 'spec_helper'

describe Lawsuit do

  before do
    @sue = Lawsuit.new(title: "Pants", content: "This guy made fun on my $300 pants and that deeply disturbed me. Can I sue for emotional damages?", suit_type: "shouldi", user_id: 1)
  end  

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:suit_type) }
  it { should respond_to(:user_id) }

  describe "when title is not present" do
    before { @sue.title = " " }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @sue.content = " " }
    it { should_not be_valid }
  end

  describe "when type is not present" do
    before { @sue.suit_type = " " }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @sue.user_id = " " }
    it { should_not be_valid }
  end

end
