class GithubFetcher

  attr_reader :client, :commit_hash

  def initialize
    @client = Octokit::Client.new(access_token: Rails.application.secrets.access_token)
    @commit_hash = {}

  end

  def repos
    @client.repos
  end

  def user
    @client.user
  end

  def commit_count(repo_name, date)
    commits = @client.commits_on(repo_name, date)
    if commits.present?
      commits.count
    else
      0
    end
  end




  def day_count
    sd = Date.parse('2015-01-13')
    ed = Date.parse('2015-03-11')

    (sd..ed).to_a

  end


  def build_hash(repo, date)
    count =  @client.commits_on("andrewpjames13/gCamp-Andrew-James", date).count
    @commit_hash[date] = count
  end

  def each_day(repo, date)
    @client.repos.each do |repo|

    count =  @client.commits_on("#{repo.owner.login}/#{repo.name}", date).count
    @commit_hash[date] = count

    end
  end

  def date_range(repos)
    repos.sort_by! do |repo|
      timestamp = repo.created_at
      timestamp_as_integer = timestamp.to_i
      timestamp_as_integer
    end
    {range_start: repos.first.created_at, range_end: repos.last.created_at}
  end


  def do_everything
    date_range = date_range(repos)
    generate_commit_hash(repos)
    p @commit_hash
  end

  def generate_commit_hash(repos)
    repos.each do |repo|
        commits = commits(repo)
        fill_in_commit_hash(commits)
      end
  end

  def fill_in_commit_hash(commits)
    commits.each do |commit|
      #fill in commit hash
    end
  end

  def commits(repo)
  end

  foo = [1, 2, 3]
  foo.map! do |f|
    f * 2
  end

end
