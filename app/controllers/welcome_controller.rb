class WelcomeController < ApplicationController

  def index
    @fetcher = GithubFetcher.new
  end

end
