class WelcomeController < ApplicationController

  def index
    @fetcher = GithubFetcher.new

    if params[:login]
      @gituser = @fetcher.client.user(params[:login])
      @gitrepo = @fetcher.client.repositories(params[:login])
    end
  end

end
