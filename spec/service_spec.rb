require 'spec_helper'

class DoWork < Gourmet::Service
  def call(value)
    value
  end
end

describe Gourmet::Service do
  context '.call' do
    it 'delegates to #call' do
      expect(DoWork.call(2)).to eq 2
    end
  end
end
