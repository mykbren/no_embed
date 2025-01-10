require 'no_embed'

RSpec.describe NoEmbed do
  describe '.get_embed_for_url' do
    it 'returns embed data for a valid URL' do
      response = NoEmbed.get_embed_for_url('https://www.youtube.com/watch?v=kXYiU_JCYtU')
      expect(response).to be_a(Hash)
      expect(response).to include('title')
    end

    it 'raises an error for invalid URL' do
      expect { NoEmbed.get_embed_for_url(nil) }.to raise_error(ArgumentError)
    end

    it 'raises an error for non-successful API response' do
      allow(Net::HTTP).to receive(:get_response).and_return(Net::HTTPInternalServerError.new('', '500', 'Internal Server Error'))
      expect { NoEmbed.get_embed_for_url('https://invalid.url') }.to raise_error(StandardError, /NoEmbed API Error/)
    end
  end
end
