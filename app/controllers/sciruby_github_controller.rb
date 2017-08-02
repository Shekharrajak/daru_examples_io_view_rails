class ScirubyGithubController < ApplicationController

  layout :resolve_layout

  def repo
    # getting data from url : https://api.github.com/orgs/Sciruby/repos
    # An example: http://nbviewer.jupyter.org/github/athityakumar/daru-io/blob/iruby-examples/iruby/json_importer.ipynb
    @df_repos = Daru::DataFrame.from_json 'https://api.github.com/orgs/Sciruby/repos', index: '$..name', forks: '$..forks', stars: '$..stargazers_count', size: '$..size', open_issues: '$..open_issues_count'

    opts = {
        title: {
          text: 'Column 3d demo'
      },

      tooltip: {
          headerFormat: '<b>{series.name}</b><br />',
          pointFormat: 'x = {point.x}, y = {point.y}'
      },
      chart: {
        :defaultSeriesType=>"column" , :margin=> 75,
        options3d: {
            enabled: true,
            alpha: 15,
            beta: 15,
            depth: 50,
            viewDistance: 25}
        },
      plotOptions: {
        :column=>{
            :allowPointSelect=>true,
            :cursor=>"pointer" ,
            :dataLabels=>{
              :enabled=>true,
              :color=>"black",
              :style=>{
                :font=>"13px Trebuchet MS, Verdana, sans-serif"
              }
            },
            depth: 25

          }
        },
      legend: {
        :layout=> 'vertical',
        :style=> {
          :left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}
        },
      adapter: :highcharts
    }

    # series_dt = [{
    #   :type=> 'column',
    #   :name=> 'Browser share',
    #   :data=> @df_repos.access_row_tuples_by_indexs()
    # }]
    @df_repos_chart = Daru::View::Plot.new(@df_repos, opts)
    # @df_repos_chart.chart.series_data = series_dt

  end


  private

  def resolve_layout
   case action_name
     when "repo"
      # setting the library is not needed, if you are parsing the
      # `adapter` option in plot or table.
      Daru::View.plotting_library = :highcharts
      "highcharts_layout"
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
