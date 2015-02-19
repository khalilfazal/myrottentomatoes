require 'spec_helper'

describe Movie do
  it 'should include rating and year in full name' do
    FactoryGirl.build(:movie, title: 'Milk', rating: Rating.find_by_label('R')).name_with_rating.should == 'Milk (R)'
  end

  it 'should call Tmdb with title keywords given valid API key' do
    Movie.find_in_tmdb('Inception')
  end

  it('should raise an InvalidKeyError with no API key') do
    Movie.stub_chain(:api_key) {
    }

    lambda {
      Movie.find_in_tmdb 'Inception'
    }.should raise_error(Movie::InvalidKeyError)
  end
end