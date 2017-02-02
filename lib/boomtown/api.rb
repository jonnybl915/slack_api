module Boomtown
  class PropertyListing
    def initialize(data)
<<<<<<< HEAD
      @data = data
    end
    def price
    @price = data.fetch('ListPrice')
    end
    def url
      "/homes/#{@data.fetch('_ID')}"
=======
      # @price = data.fetch 'ListPrice'
      @data = data
    end

    def price
      @data.fetch 'ListPrice'
    end

    def url
      # "/homes/#{@data.fetch 'Address'}/#{@data.fetch 'City'}/#{@data.fetch 'State'}/..."
      "/homes/#{@data.fetch '_ID'}"
>>>>>>> 580a5fe7742cd41ff59a9a95917dbe358f02564f
    end
  end

  class Api

    def self.from_env
<<<<<<< HEAD
      Boomtown::Api.new(
                ENV.fetch('BOOMTOWN_USERNAME'),
                ENV.fetch('BOOMTOWN_PASSWORD')
      )
    end
=======
      # Boomtown::Api.new(
      new(
         ENV.fetch('BOOMTOWN_USERNAME'),
         ENV.fetch('BOOMTOWN_PASSWORD')
      )
    end

>>>>>>> 580a5fe7742cd41ff59a9a95917dbe358f02564f
    def initialize(username, password)
      @url   = 'http://flagshipapi.qa6.local/'
      @token = get_token(username, password)
    end

    def send(verb, path, params={})
      conn = Faraday.new @url
      conn.headers['Authorization'] = "Bearer #{@token}"

      response = conn.send verb, path, params
      unless response.status == 200
        raise response.body
      end
      JSON.parse response.body
    end

    def get_token(username, password)
      conn = Faraday.new @url
      conn.basic_auth username, password
      response = conn.post '/oauth/2/token', grant_type: 'client_credentials'
      JSON.parse(response.body).fetch 'access_token'
    end

    def get_lead_id
      # GET flagshipapi.qa6.local/leads/anonymous
      data = send(:get, '/leads/anonymous')
      data['Result']['_ID']
    end

    def get_property_details(prop_id)
      # GET http://flagshipapi.qa6.local/lc/1/listings/3384072
      # ?action=ajax_submit
      # &access_token=...
      # &VisitorID=...
      # &VisitID=...
      # &LogSearch=true
      data = send(:get, "/lc/1/listings/#{prop_id}") # {'LogSearch' => 'true'}
      data['Result']
    end

    def search(criteria)
      translations = {
<<<<<<< HEAD
          :min_price => :minprice,
          :max_price => :max_price
      }
      parameters = {}
      translations.each do |criteria_name, param_name|
        if criteria[criteria_name]
          parameters[param_name] = criteria[criteria_name]
        end
      end
=======
        :min_price => :minprice,
        :max_price => :maxprice,
        :sort_by   => :sort,
        :type      => :status
      }

      parameters = {}
      translations.each do |crit_name, param_name|
        if criteria[crit_name]
          parameters[param_name] = criteria[crit_name]
        end
      end

>>>>>>> 580a5fe7742cd41ff59a9a95917dbe358f02564f
      data = send(:get, '/lc/1/listings/search', parameters)
      results = data['Result']['Items']

      results.map { |hash| PropertyListing.new hash }
<<<<<<< HEAD

=======
>>>>>>> 580a5fe7742cd41ff59a9a95917dbe358f02564f
    end
  end
end
