#
# SEGs
#

shared_examples_for "new subscription topic" do
  it "initially is followed by no one" do
    new_topic = described_class.new

    new_topic.subscribers.should be_empty
    @subscriber.subscribed?(new_topic).should be_false
  end
end



shared_examples_for "Traits::PubSub::Topic" do
  describe "#subscribe(subscriber)" do
    describe "when subscriber not yet on subscription list" do
      before :all do
        @topic.subscribe(@subscriber_one)
      end

      it "subscribes that subscriber" do
        @topic.subscribed?(@subscriber_one).should be_true
      end
    end

    describe "when subscriber already on subscription list" do
      before :all do
        @topic.subscribe(@subscriber_one)
        @topic.subscribed?(@subscriber_one).should be_true
      end

      it "DOES NOT subscribe a subscriber already on subscription list" do
        lambda do
          @topic.subscribe(@subscriber_one)
        end.should_not change(@topic.subscription_class.all, :count)
      end
    end
  end



  describe "#unsubscribe(subscriber)" do
    describe "for existing subscriber" do
      before :all do
        @topic.subscribe(@subscriber_two)
      end

      it "unsubscribes that subscriber" do
        @topic.unsubscribe(@subscriber_two)
        @topic.subscribed?(@subscriber_two).should be_false
      end
    end

    describe "for a non-subscriber" do
      it "raises ArgumentError" do
        lambda do
          @topic.unsubscribe(@subscriber_one)
        end.should raise_error(ArgumentError)
      end
    end
  end



  describe "#subscribed?(subscriber)" do
    describe "for existing subscriber" do
      before :all do
        @topic.subscribe(@subscriber_two)
      end

      it "returns true" do
        @topic.subscribed?(@subscriber_two).should be_true
      end
    end

    describe "for a non-subscriber" do
      before :all do
        @topic.subscribe(@subscriber_two)
        @topic.unsubscribe(@subscriber_two)
      end


      it "returns false" do
        @topic.subscribed?(@subscriber_one).should be_false
      end
    end
  end
end


describe "Repository" do
  it_should_behave_like "Traits::SubscriptionTopic"
end

describe "Person" do
  it_should_behave_like "Traits::SubscriptionTopic"
end
