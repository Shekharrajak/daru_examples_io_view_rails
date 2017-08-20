module ScirubyGithubHelper
  def export(dataframe)
    respond_to do |format|
      format.html

      # TODO : Changes the below statements, once daru-io has discrete to_format
      #   and write_format methods. For now, use tempfiles atleast.
      format.csv do
        dataframe.to_csv('download.csv')
        send_data(File.read('download.csv'))
      end
      format.xls do
        dataframe.to_excel('download.xls')
        send_data(File.read('download.xls'))
      end
      format.json do
        dataframe.to_json('download.json', pretty: true)
        send_data(File.read('download.json'))
      end
      # format.rds do
      #   dataframe.to_rds('download.rds', :download)
      #   send_data(File.read('download.rds'))
      # end
    end
  end
end
