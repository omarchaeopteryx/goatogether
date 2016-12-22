require 'rails_helper'

describe Journey do
  let(:host) {User.create}
  let(:guest) {User.create}
  let(:journey) {Journey.create(name: "bean", hashtag: "#bean", start_time: '2016-12-12 12:12:00 UTC', end_time: '2016-12-25 00:12:00 UTC', user_id: host.id)}
  let(:invite) {Invite.create(journey_id: journey.id, guest_id: guest.id)}

  describe "#user" do
    context "when the journey is created" do
      it "belongs to a user" do
        p host
        expect(journey.user.id).to eq host.id
      end
    end
  end

  describe "#name" do
    context "when the journey is created" do
      it "has a name" do
        expect(journey.name).to eq "bean"
      end
    end
  end

   describe "#hashtag" do
    context "when the journey is created" do
      it "has a hashtag" do
        expect(journey.hashtag).to eq "#bean"
      end
    end
  end

    describe "#start_time" do
    context "when the journey is created" do
      it "has a start_time" do
        expect(journey.start_time).to eq '2016-12-12 12:12:00 UTC'
      end
    end
  end

    describe "#end_time" do
    context "when the journey is created" do
      it "has a end_time" do
        expect(journey.end_time).to eq '2016-12-25 00:12:00 UTC'
      end
    end
  end


end
