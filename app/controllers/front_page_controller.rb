class FrontPageController < ApplicationController
  def home
    @links = Daru::DataFrame.new({
      Routes:   [
          'SciRuby repos',
          'SciRuby repo watchers',
          'Indian election data'
        ],
      Desc:     [
          'Shows import from JSON API, charts, tables, and export',
          'Shows import from JSON API, charts, tables, and export',
          'Shows import from HTML pages, charts and tables'
        ],
      Link: [
        view_context.link_to('sciruby/repos', {action: 'repos', controller: 'sciruby_github'}, target: '_blank'),
        view_context.link_to('sciruby/watchers', {action: 'watchers', controller: 'sciruby_github'}, target: '_blank'),
        view_context.link_to('election/data', {action: 'data', controller: 'election'}, target: '_blank'),
        ]
      }, order: %i[Routes Desc Link])
  end
end
