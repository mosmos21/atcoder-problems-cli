require 'net/http'
require 'json'

class AtCoderProblems

  API_URL = 'https://kenkoooo.com/atcoder/atcoder-api/'
  RESOURCE_URL = 'https://kenkoooo.com/atcoder/resources/'

  def self.get_contests
    request(resource_url('contests.json'))
  end

  def self.get_problems
    request(resource_url('problems.json'))
  end

  def self.get_accepted_cont
    request(resource_url('ac.json'))
  end

  def self.get_short_code_count
    request(resource_url('short.json'))
  end

  def self.get_fastest_code_count
    request(resource_url('fast.json'))
  end

  def self.get_first_accepted_count
    request(resource_url('first.json'))
  end

  def self.get_rated_point_sum
    request(resource_url('sums.json'))
  end

  def self.get_accepted_count_for_lang
    request(resource_url('lang.json'))
  end

  def self.get_user_info(user_id)
    request(api_url('v2/user_info?user=' + user_id))
  end

  def self.get_submission(user_id)
    request(api_url('results?user=' + user_id))
  end

  private

    def self.resource_url(url)
      RESOURCE_URL + url
    end

    def self. api_url(url)
      API_URL + url
    end

    def self.request(url)
      res = Net::HTTP.get URI::parse(url)
      JSON.parse(res)
    end
end