class FrontPageController < ApplicationController

  layout 'datatables_layout'

  def home
    @links = Daru::DataFrame.new({
      Routes:   [
          'Repo forks and issue count',
          'Popular repo of SciRuby',
          'Indian election data'
        ],
      Desc:     [
          'Analysis of fork and issue count present in sciruby org',
          'Popular SciRuby repo in the point of view of number of watchers',
          'Plotting a small dataset of obtained election results'
        ],
      Link: [
          "<a href='./sciruby/repos' target='_blank'>sciruby/repos</a>",
          "<a href='./sciruby/watchers' target='_blank'>sciruby/watchers</a>",
          "<a href='./election/data' target='_blank'>election/data</a>"
        ]
      }, order: [:Routes, :Desc, :Link])
    @links_table = Daru::View::Table.new(@links, pageLength: 3, adapter: :datatables, height: 500, width: 700)
  end
end
