class Movie < ActiveRecord::Base
  belongs_to :rating

  class Movie::InvalidKeyError < StandardError
  end

  scope :api_key, lambda {
    '9de4ca87d2246d80795dc0173155df3b'
  }

  scope :find_in_tmdb, lambda { |title|
    search = Tmdb::Search.new.query(title)
    search.filter api_key: self.api_key

    begin
      search.fetch_response['results'][0]['original_title']
    rescue NoMethodError => e
      raise Movie::InvalidKeyError, e.message
    rescue RuntimeError => e
      raise ((e.message =~ /status code '404'/) ? Movie::InvalidKeyError : RuntimeError), e.message
    end
  }

  def name_with_rating
    "#{title} (#{rating.label})"
  end
end
