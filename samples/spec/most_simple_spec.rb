require 'spec_helper'
require 'models/test_model'
require 'irb'

RSpec.describe TestModel, type: :model do
  describe "#test" do
    subject { TestModel.new.test }
    it { expect(subject).to eq("Hello") }
  end
end