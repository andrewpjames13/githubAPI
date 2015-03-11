class GithubFetcher

  attr_reader :client

  def initialize
    @client = Octokit::Client.new(access_token: Rails.application.secrets.access_token)
  end

  def repos
    @client.all_repositories
  end

  def user
    @client.user
  end


end
