require_relative '../string_calculator'

RSpec.describe StringCalculator do
  it 'returns 0 for an empty string' do
    expect(StringCalculator.add('')).to eq(0)
  end

  it 'returns the number itself for a single number' do
    expect(StringCalculator.add('1')).to eq(1)
  end

  it 'returns the actual sum' do
    expect(StringCalculator.add('1,5')).to eq(6)
  end

  it 'should handle any amount of numbers' do
    expect(StringCalculator.add('5,6,7,8')).to eq(26)
  end

  it 'handles newlines between numbers' do
    expect(StringCalculator.add('1\n2,3')).to eq(6)
  end

  it 'supports custom delimiter' do
    expect(StringCalculator.add("//;\n1;2")).to eq(3)
  end

  it 'throws an error for negative numbers' do
    expect { StringCalculator.add('-1,7') }.to raise_error(NegativeError)
  end
end
