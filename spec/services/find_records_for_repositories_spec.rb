require 'rails_helper'

describe FindRecordsForRepositories do
  let!(:author) { FactoryBot.create(:author) }
  let!(:book) { FactoryBot.create(:book, authors: author.email) }
  let!(:magazine) { FactoryBot.create(:magazine, authors: author.email) }
  let(:isbn_param) { '' }
  let(:author_param) { author.email }

  context 'when author exist' do
    it 'return 2 objects' do
      expect(subject.call(isbn_param, author_param).count).to eq(2)
    end
  end

  context 'when isb not exist' do
    it 'return 2 objects' do
      expect(subject.call('121212', author_param).count).to eq(0)
    end
  end
end