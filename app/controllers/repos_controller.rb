class ReposController < ApplicationController

  def index
    @client = GithubFetcher.new
  end

end
