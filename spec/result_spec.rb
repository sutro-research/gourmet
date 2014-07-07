require 'spec_helper'

class SucceedingService < Gourmet::Service
  def call(value)
    Success(value)
  end
end

class FailingService < Gourmet::Service
  def call(value)
    Failure()
  end
end


describe Gourmet::Result do
  context '#success?' do
    it 'is true for Gourmet::Success results' do
      result = SucceedingService.call('test')
      expect(result.success?).to eq true
      expect(result.value).to eq 'test'
    end

    it 'is false for Gourmet::Failure results' do
      result = FailingService.call('test')
      expect(result.success?).to eq false
    end
  end


  context '#failure?' do
    it 'is false for Gourmet::Success results' do
      result = SucceedingService.call('test')
      expect(result.failure?).to eq false
    end

    it 'is true for Gourmet::Failure results' do
      result = FailingService.call('test')
      expect(result.failure?).to eq true
    end
  end
end
