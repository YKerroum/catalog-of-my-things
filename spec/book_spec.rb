require_relative '../classes/models/book'
describe Book do
  before(:each) do
    @book = Book.new('HarperCollins', 'good', '2020-01-01')
  end

  it 'test initialize with params' do
    expect(@book.publisher).to eq('HarperCollins')
    expect(@book.cover_state).to eq('good')
    expect(@book.publish_date).to eq(Date.parse('2020-01-01'))
  end

  it 'test can be archived?' do
    expect(@book.send(:can_be_archived?)).to be_falsey
    @book.cover_state = 'bad'
    expect(@book.send(:can_be_archived?)).to be_truthy
  end
end
