class FrontPageController < ApplicationController
  def home
    @links = Daru::DataFrame.new({
      Routes:   [
          'SciRuby repos',
          'SciRuby repo watchers',
          'Indian election data',
          'Countries data'
        ],
      Desc:     [
          'Shows import from JSON API, charts, tables, and export',
          'Shows import from JSON API, charts, tables, and export',
          'Shows import from HTML pages, charts and tables',
          'Shows import from JSON API, multiple charts using PlotList, tables with formatters and CSS styling in HighCharts'
        ],
      Link: [
        view_context.link_to('sciruby/repos', {action: 'repos', controller: 'sciruby_github'}, target: '_blank'),
        view_context.link_to('sciruby/watchers', {action: 'watchers', controller: 'sciruby_github'}, target: '_blank'),
        view_context.link_to('election/data', {action: 'data', controller: 'election'}, target: '_blank'),
        view_context.link_to('countries', {action: 'data_countries', controller: 'countries'}, target: '_blank'),
        ]
      }, order: %i[Routes Desc Link])
  end
end
