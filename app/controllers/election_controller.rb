class ElectionController < ApplicationController
  def data
    @elections = Daru::DataFrame
      .read_html('http://eciresults.nic.in/PartyWiseResult.htm').first
      .tap { |df| df.delete_row(-1) }
      .recode_vectors { |v| v.name == 'Party' ? v : v.recode(&:to_i) }
  end
end
