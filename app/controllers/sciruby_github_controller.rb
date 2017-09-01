class ScirubyGithubController < ApplicationController

  include ScirubyGithubHelper
  layout :resolve_layout

  def repos
    # getting data from url : https://api.github.com/orgs/Sciruby/repos
    # An example: http://nbviewer.jupyter.org/github/athityakumar/daru-io/blob/iruby-examples/iruby/json_importer.ipynb
    @df_repos = Daru::DataFrame.read_json(
      'https://api.github.com/orgs/Sciruby/repos',
      Repo_name: '$..name',
      forks: '$..forks',
      open_issues: '$..open_issues_count'
    )

    # TODO: something better than export method
    export(@df_repos)
  end

  def watchers
    # getting data from url : https://api.github.com/orgs/Sciruby/repos
    # An example: http://nbviewer.jupyter.org/github/athityakumar/daru-io/blob/iruby-examples/iruby/json_importer.ipynb
    @df_watchers = Daru::DataFrame.read_json(
      'https://api.github.com/orgs/Sciruby/repos',
      Repo_name: '$..name',
      watchers: '$..watchers'
    )

    # TODO: something better than export method
    export(@df_watchers)
  end

  private

  def resolve_layout
   case action_name
     when 'repos', 'watchers'
      # setting the library is not needed, if you are parsing the
      # `adapter` option in plot or table.
      # Daru::View.plotting_library = :highcharts
      "googlecharts_layout"
     # when "googlecharts"
     #  Daru::View.plotting_library = :googlecharts
     #  "googlecharts_layout"
     # when "datatables"
     #  "datatables_layout"
     else
      Daru::View.plotting_library = :nyaplot
      "application"
     end
  end
end
