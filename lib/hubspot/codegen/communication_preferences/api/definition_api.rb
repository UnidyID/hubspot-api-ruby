=begin
#Subscriptions

#Subscriptions allow contacts to control what forms of communications they receive. Contacts can decide whether they want to receive communication pertaining to a specific topic, brand, or an entire HubSpot account.

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module Hubspot
  module CommunicationPreferences
    class DefinitionApi
      attr_accessor :api_client

      def initialize(api_client = ApiClient.default)
        @api_client = api_client
      end
      # Get subscription definitions
      # Get a list of all subscription definitions for the portal
      # @param [Hash] opts the optional parameters
      # @return [SubscriptionDefinitionsResponse]
      def get_page(opts = {})
        data, _status_code, _headers = get_page_with_http_info(opts)
        data
      end

      # Get subscription definitions
      # Get a list of all subscription definitions for the portal
      # @param [Hash] opts the optional parameters
      # @return [Array<(SubscriptionDefinitionsResponse, Integer, Hash)>] SubscriptionDefinitionsResponse data, response status code and response headers
      def get_page_with_http_info(opts = {})
        if @api_client.config.debugging
          @api_client.config.logger.debug 'Calling API: DefinitionApi.get_page ...'
        end
        # resource path
        local_var_path = '/communication-preferences/v3/definitions'

        # query parameters
        query_params = opts[:query_params] || {}

        # header parameters
        header_params = opts[:header_params] || {}
        # HTTP header 'Accept' (if needed)
        header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])

        # form parameters
        form_params = opts[:form_params] || {}

        # http body (model)
        post_body = opts[:debug_body]

        # return_type
        return_type = opts[:debug_return_type] || 'SubscriptionDefinitionsResponse'

        # auth_names
        auth_names = opts[:debug_auth_names] || ['hapikey']

        new_options = opts.merge(
          :operation => :"DefinitionApi.get_page",
          :header_params => header_params,
          :query_params => query_params,
          :form_params => form_params,
          :body => post_body,
          :auth_names => auth_names,
          :return_type => return_type
        )

        data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
        if @api_client.config.debugging
          @api_client.config.logger.debug "API called: DefinitionApi#get_page\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end
        return data, status_code, headers
      end
    end
  end
end
