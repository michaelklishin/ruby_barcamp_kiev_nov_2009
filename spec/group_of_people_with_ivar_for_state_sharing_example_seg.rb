shared_examples_for "Group of people" do
  context "when just started" do
    it "has only one membership" do
      # use #count or have(1).memberships here,
      # it is not the point at all
      @model.memberships.size.should == 1
    end

    it "has only one member" do
      @model.members.size.should == 1
    end

    it "has one administrator" do
      @model.administrators.size.should == 1
    end

    it "has NO regular members" do
      @model.regular_members.should be_empty
    end
  end

  context "when one more person is added" do
    it "has two memberships" do
      @model.memberships.size.should == 2
    end

    it "has two members" do
      @model.members.size.should == 2
    end

    it "(still) has one administrator" do
      @model.administrators.size.should == 1
    end

    it "has one regular member" do
      @model.regular_members.size.should == 1
    end
  end
end

describe "A community" do
  before :each do
    @model = Community.new
  end

  it_should_behave_like "Group of people"
end

describe "A project" do
  before :each do
    @model = Project.new
  end

  it_should_behave_like "Group of people"
end
