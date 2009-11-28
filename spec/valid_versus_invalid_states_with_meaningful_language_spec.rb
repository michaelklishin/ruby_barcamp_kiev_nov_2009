describe "A blog post" do
  context "without title" do
    it "IS NOT valid"
  end

  context "with a title 0 characters long" do
    it "is NOT valid"
  end

  context "with a title 25 characters long" do
    it "is valid"
  end

  context "with a title 37000 characters long" do
    it "IS NOT valid"
  end
end