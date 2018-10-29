# e.g. api call

######################
# accepted arguments #
######################
# zws-id	  The Zillow Web Service Identifier. Each subscriber to Zillow Web Services is uniquely identified
#           by an ID sequence and every request to Web services requires this ID. Click here to get yours.
# regionId	The regionId of the region to retrieve subregions from.
# state	    The state of the region to retrieve subregions from.
# county	  The county of the region to retrieve subregions from.
# city	    The city of the region to retrieve subregions from.
# childtype	The type of subregions to retrieve (available types: state, county, city, zipcode, and neighborhood).

# @return [String] Zillow API key. See {http://www.zillow.com/howto/api/APIOverview.htm}.

class Willow
  include HTTParty
  base_uri 'www.zillow.com'

  attr_accessor :zwsid, :host, :port, :path, :http_open_timeout, :http_read_timeout

  attr_accessor :options

  def initialize
    api = ''

    self.options = {
      query: { 'zws-id' => api }
    }
  end

  def get_region_children(regionid: nil,
                          state: 'ma',
                          county: nil,
                          city: 'quincy',
                          childtype: 'neighborhood')
    method_sym = __method__

    argv = Hash[
      method(method_sym).parameters
                        .map
                        .collect do |_, key|
                          [key, binding.local_variable_get(key)]
                        end
    ]

    get_request method_sym, argv
  end

  def get_region_chart(regionid: nil,
                       state: 'ma',
                       county: nil,
                       city: 'quincy',
                       childtype: 'neighborhood')
    method_sym = __method__

    argv = Hash[
      method(method_sym).parameters
                        .map
                        .collect do |_, key|
                          [key, binding.local_variable_get(key)]
                        end
    ]

    get_request method_sym, argv
  end

  private

  def get_request method_sym, argv
    @options[:query].merge!(argv)
    method_name = method_sym.to_s
                            .split('_')
                            .inject('') do |memo, word|
                              memo += word.capitalize
                              memo
                            end

    self.class.get "/webservice/#{method_name}.htm", @options
  end
end
