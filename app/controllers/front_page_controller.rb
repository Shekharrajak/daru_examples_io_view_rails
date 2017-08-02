class FrontPageController < ApplicationController

  layout 'datatables_layout'

  def home
    @df_links = Daru::DataFrame.new({
      routes:   [
        'Repo forks and issue count',
        'Popular repo of SciRuby'
        ],
      Desc:     [
        'Analysis of fork and issue count present in sciruby org',
        'Popular SciRuby repo in the point of view of number of watchers'
        ],
      Localhost_link: [
        'http://localhost:3000/sciruby/repos',
        'http://localhost:3000/sciruby/watchers'
        ]
      }, order: [:routes, :Desc, :Localhost_link])
    @df_links_table = Daru::View::Table.new(@df_links, pageLength: 3, adapter: :datatables, height: 500, width: 700)
  end
end
