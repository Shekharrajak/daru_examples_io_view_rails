class FrontPageController < ApplicationController

  layout 'datatables_layout'

  def home
    @df_links = Daru::DataFrame.new({
      routes:         ['Repo forks and issue count'],
      Desc:           ['Analysis of fork and issue count present in sciruby org'],
      Localhost_link: ['http://localhost:3000/sciruby/repos']
      })
    @df_links_table = Daru::View::Table.new(@df_links, pageLength: 3, adapter: :datatables)
  end
end
