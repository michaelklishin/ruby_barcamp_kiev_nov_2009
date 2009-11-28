shared_examples_for "Group of people" do
  context "when just started" do
    it "has only one membership" do
      # use #count or have(1).memberships here,
      # it is not the point at all
      subject.memberships.size.should == 1
    end

    it "has only one member" do
      subject.members.size.should == 1
    end

    it "has one administrator" do
      subject.administrators.size.should == 1
    end

    it "has NO regular members" do
      subject.regular_members.should be_empty
    end
  end

  context "when one more person is added" do
    it "has two memberships" do
      subject.memberships.size.should == 2
    end

    it "has two members" do
      subject.members.size.should == 2
    end

    it "(still) has one administrator" do
      subject.administrators.size.should == 1
    end

    it "has one regular member" do
      subject.regular_members.size.should == 1
    end
  end
end

describe "A community" do
  before :each do
    @community = Community.new
  end

  subject { @community }

  it_should_behave_like "Group of people"
end

describe "A project" do
  before :each do
    @project = Project.new
  end

  subject { @project }

  it_should_behave_like "Group of people"
end
