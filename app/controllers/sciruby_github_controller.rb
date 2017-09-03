class ScirubyGithubController < ApplicationController
  include ScirubyGithubHelper

  def repos
    # getting data from url : https://api.github.com/orgs/Sciruby/repos
    # An example: http://nbviewer.jupyter.org/github/athityakumar/daru-io/blob/iruby-examples/iruby/json_importer.ipynb
    @repos = Daru::DataFrame.read_json(
      'https://api.github.com/orgs/Sciruby/repos',
      repo_name: '$..name',
      forks: '$..forks',
      open_issues: '$..open_issues_count'
    )

    # TODO: something better than export method
    export(@repos)
  end

  def watchers
    # getting data from url : https://api.github.com/orgs/Sciruby/repos
    # An example: http://nbviewer.jupyter.org/github/athityakumar/daru-io/blob/iruby-examples/iruby/json_importer.ipynb
    @watchers = Daru::DataFrame.read_json(
      'https://api.github.com/orgs/Sciruby/repos',
      repo_name: '$..name',
      watchers: '$..watchers'
    )

    # TODO: something better than export method
    export(@watchers)
  end
end
