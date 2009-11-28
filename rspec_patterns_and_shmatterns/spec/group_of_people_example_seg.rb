shared_examples_for "Group of people" do
  context "when just started" do
    it "has only one membership"

    it "has only one member"

    it "has one administrator"
  end

  context "when one more person is added" do
    it "has two membership"

    it "has two members"

    it "still has one administrator"

    it "still has one regular member"  
  end
end

describe "A community" do
  it_should_behave_like "Group of people"
end

describe "A project" do
  it_should_behave_like "Group of people"
end