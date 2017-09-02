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
        view_context.link_to('sciruby/repos', {action: 'repos', controller: 'sciruby_github'}, target: '_blank'),
        view_context.link_to('sciruby/watchers', {action: 'watchers', controller: 'sciruby_github'}, target: '_blank'),
        view_context.link_to('election/data', {action: 'data', controller: 'election'}, target: '_blank'),
        ]
      }, order: %i[Routes Desc Link])
  end
end
