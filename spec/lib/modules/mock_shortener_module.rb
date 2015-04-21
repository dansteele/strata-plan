module MockShortener

  def self.mock query, file_name
    WebMock.disable_net_connect!(:allow_localhost => true)
    WebMock::stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=#{CGI::escape(query)}&key=AIzaSyBwGmEeg9OKIjaWiPE5-GnPR75Y1KXm14g&language=en&sensor=false").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.read("spec/stubs/#{file_name}.json"), :headers => {})
  end

end