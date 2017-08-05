class ScirubyGithubController < ApplicationController

  layout :resolve_layout

  def repo
    # getting data from url : https://api.github.com/orgs/Sciruby/repos
    # An example: http://nbviewer.jupyter.org/github/athityakumar/daru-io/blob/iruby-examples/iruby/json_importer.ipynb
    @df_repos = Daru::DataFrame.from_json('https://api.github.com/orgs/Sciruby/repos', Repo_name: '$..name', forks: '$..forks', open_issues: '$..open_issues_count')

    opts = {
      type: :column,
      adapter: :googlecharts,
      height: 500,
      width: 1000
    }
    table_opts = {
      adapter: :googlecharts, pageSize: 10,
      height: 300, width: 400
    }
    @df_repo_table = Daru::View::Table.new(@df_repos, table_opts)
    @df_repos_col_chart = Daru::View::Plot.new(@df_repo_table, opts)
    opts = {
      type: :histogram,
      adapter: :googlecharts,
      height: 500,
      width: 1000
    }
    @df_repos_histo_chart = Daru::View::Plot.new(@df_repo_table, opts)


    respond_to do |format|
      format.html
      format.csv do
        @df_repos.to_csv('repos.csv')
        send_data(File.read('./repos.csv'))
      end
      format.xls do
        @df_repos.to_excel('repos.xls')
        send_data(File.read('./repos.xls'))
      end
    end
  end

  def watchers
    # getting data from url : https://api.github.com/orgs/Sciruby/repos
    # An example: http://nbviewer.jupyter.org/github/athityakumar/daru-io/blob/iruby-examples/iruby/json_importer.ipynb
    @df_watchers = Daru::DataFrame.from_json('https://api.github.com/orgs/Sciruby/repos', Repo_name: '$..name', watchers: '$..watchers')

    opts = {
      type: :pie,
      adapter: :googlecharts,
      height: 500,
      width: 1000,
      title: 'Sciruby Popular repos (in the view of number of watchers)',
      is3D: true
    }
    table_opts = {
      adapter: :googlecharts, pageSize: 10,
      height: 300, width: 400
    }
    @df_watchers_table = Daru::View::Table.new(@df_watchers, table_opts)
    @df_watchers_pie_chart = Daru::View::Plot.new(@df_watchers_table.table, opts)

    respond_to do |format|
      format.html
      format.csv do
        @df_watchers.to_csv('watchers.csv')
        send_data(File.read('./watchers.csv'))
      end
      format.xls do
        @df_watchers.to_excel('watchers.xls')
        send_data(File.read('./watchers.xls'))
      end
    end
  end

  private

  def resolve_layout
   case action_name
     when 'repo', 'watchers'
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
