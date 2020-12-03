require 'spec_helper'
require 'models/test_model'
require 'pry'

RSpec.describe TestModel, type: :model do
  describe "#test" do
    subject { TestModel.new.test }
    let(:foo) { "foo" }
    it { expect(subject).to eq("Hello") }
    it { expect(foo).to eq("foo") }
  end

  describe "named subject" do
    subject(:hello) { TestModel.new.test }
    it { expect(subject).to eq("Hello") }
    it { expect(hello).to eq("Hello") }
  end
end
