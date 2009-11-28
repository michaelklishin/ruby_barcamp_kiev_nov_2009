describe "Twitter account" do
  it { should respond_to(:tweet)       }

  it { should respond_to(:subscribe)   }

  it { should respond_to(:unsubscribe) }
end