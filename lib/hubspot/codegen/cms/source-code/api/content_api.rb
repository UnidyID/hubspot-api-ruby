=begin
#CMS Source Code

#Endpoints for interacting with files in the CMS Developer File System. These files include HTML templates, CSS, JS, modules, and other assets which are used to create CMS content.

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module Hubspot
  module Cms
    module SourceCode
      class ContentApi
        attr_accessor :api_client

        def initialize(api_client = ApiClient.default)
          @api_client = api_client
        end
        # Delete a file
        # Deletes the file at the specified path in the specified environment.
        # @param environment [String] The environment of the file (\&quot;draft\&quot; or \&quot;published\&quot;).
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @return [nil]
        def archive(environment, path, opts = {})
          archive_with_http_info(environment, path, opts)
          nil
        end

        # Delete a file
        # Deletes the file at the specified path in the specified environment.
        # @param environment [String] The environment of the file (\&quot;draft\&quot; or \&quot;published\&quot;).
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
        def archive_with_http_info(environment, path, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: ContentApi.archive ...'
          end
          # verify the required parameter 'environment' is set
          if @api_client.config.client_side_validation && environment.nil?
            fail ArgumentError, "Missing the required parameter 'environment' when calling ContentApi.archive"
          end
          # verify the required parameter 'path' is set
          if @api_client.config.client_side_validation && path.nil?
            fail ArgumentError, "Missing the required parameter 'path' when calling ContentApi.archive"
          end
          pattern = Regexp.new(/.+/)
          if @api_client.config.client_side_validation && path !~ pattern
            fail ArgumentError, "invalid value for 'path' when calling ContentApi.archive, must conform to the pattern #{pattern}."
          end

          # resource path
          local_var_path = '/cms/v3/source-code/{environment}/content/{path}'.sub('{' + 'environment' + '}', CGI.escape(environment.to_s)).sub('{' + 'path' + '}', CGI.escape(path.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type]

          # auth_names
          auth_names = opts[:debug_auth_names] || ['hapikey']

          new_options = opts.merge(
            :operation => :"ContentApi.archive",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: ContentApi#archive\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Create a file
        # Creates a file at the specified path in the specified environment. Accepts multipart/form-data content type. Throws an error if a file already exists at the specified path.
        # @param environment [String] The environment of the file (\&quot;draft\&quot; or \&quot;published\&quot;).
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @option opts [File] :file The file to upload.
        # @return [AssetFileMetadata]
        def create(environment, path, opts = {})
          data, _status_code, _headers = create_with_http_info(environment, path, opts)
          data
        end

        # Create a file
        # Creates a file at the specified path in the specified environment. Accepts multipart/form-data content type. Throws an error if a file already exists at the specified path.
        # @param environment [String] The environment of the file (\&quot;draft\&quot; or \&quot;published\&quot;).
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @option opts [File] :file The file to upload.
        # @return [Array<(AssetFileMetadata, Integer, Hash)>] AssetFileMetadata data, response status code and response headers
        def create_with_http_info(environment, path, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: ContentApi.create ...'
          end
          # verify the required parameter 'environment' is set
          if @api_client.config.client_side_validation && environment.nil?
            fail ArgumentError, "Missing the required parameter 'environment' when calling ContentApi.create"
          end
          # verify the required parameter 'path' is set
          if @api_client.config.client_side_validation && path.nil?
            fail ArgumentError, "Missing the required parameter 'path' when calling ContentApi.create"
          end
          pattern = Regexp.new(/.+/)
          if @api_client.config.client_side_validation && path !~ pattern
            fail ArgumentError, "invalid value for 'path' when calling ContentApi.create, must conform to the pattern #{pattern}."
          end

          # resource path
          local_var_path = '/cms/v3/source-code/{environment}/content/{path}'.sub('{' + 'environment' + '}', CGI.escape(environment.to_s)).sub('{' + 'path' + '}', CGI.escape(path.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])
          # HTTP header 'Content-Type'
          content_type = @api_client.select_header_content_type(['multipart/form-data'])
          if !content_type.nil?
              header_params['Content-Type'] = content_type
          end

          # form parameters
          form_params = opts[:form_params] || {}
          form_params['file'] = opts[:'file'] if !opts[:'file'].nil?

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type] || 'AssetFileMetadata'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['hapikey']

          new_options = opts.merge(
            :operation => :"ContentApi.create",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: ContentApi#create\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Download a file
        # Downloads the byte contents of the file at the specified path in the specified environment.
        # @param environment [String] The environment of the file (\&quot;draft\&quot; or \&quot;published\&quot;).
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @return [Error]
        def get(environment, path, opts = {})
          data, _status_code, _headers = get_with_http_info(environment, path, opts)
          data
        end

        # Download a file
        # Downloads the byte contents of the file at the specified path in the specified environment.
        # @param environment [String] The environment of the file (\&quot;draft\&quot; or \&quot;published\&quot;).
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @return [Array<(Error, Integer, Hash)>] Error data, response status code and response headers
        def get_with_http_info(environment, path, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: ContentApi.get ...'
          end
          # verify the required parameter 'environment' is set
          if @api_client.config.client_side_validation && environment.nil?
            fail ArgumentError, "Missing the required parameter 'environment' when calling ContentApi.get"
          end
          # verify the required parameter 'path' is set
          if @api_client.config.client_side_validation && path.nil?
            fail ArgumentError, "Missing the required parameter 'path' when calling ContentApi.get"
          end
          pattern = Regexp.new(/.+/)
          if @api_client.config.client_side_validation && path !~ pattern
            fail ArgumentError, "invalid value for 'path' when calling ContentApi.get, must conform to the pattern #{pattern}."
          end

          # resource path
          local_var_path = '/cms/v3/source-code/{environment}/content/{path}'.sub('{' + 'environment' + '}', CGI.escape(environment.to_s)).sub('{' + 'path' + '}', CGI.escape(path.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type] || 'Error'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['hapikey']

          new_options = opts.merge(
            :operation => :"ContentApi.get",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: ContentApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Create or update a file
        # Upserts a file at the specified path in the specified environment. Accepts multipart/form-data content type.
        # @param environment [String] The environment of the file (\&quot;draft\&quot; or \&quot;published\&quot;).
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @option opts [File] :file The file to upload.
        # @return [AssetFileMetadata]
        def replace(environment, path, opts = {})
          data, _status_code, _headers = replace_with_http_info(environment, path, opts)
          data
        end

        # Create or update a file
        # Upserts a file at the specified path in the specified environment. Accepts multipart/form-data content type.
        # @param environment [String] The environment of the file (\&quot;draft\&quot; or \&quot;published\&quot;).
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @option opts [File] :file The file to upload.
        # @return [Array<(AssetFileMetadata, Integer, Hash)>] AssetFileMetadata data, response status code and response headers
        def replace_with_http_info(environment, path, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: ContentApi.replace ...'
          end
          # verify the required parameter 'environment' is set
          if @api_client.config.client_side_validation && environment.nil?
            fail ArgumentError, "Missing the required parameter 'environment' when calling ContentApi.replace"
          end
          # verify the required parameter 'path' is set
          if @api_client.config.client_side_validation && path.nil?
            fail ArgumentError, "Missing the required parameter 'path' when calling ContentApi.replace"
          end
          pattern = Regexp.new(/.+/)
          if @api_client.config.client_side_validation && path !~ pattern
            fail ArgumentError, "invalid value for 'path' when calling ContentApi.replace, must conform to the pattern #{pattern}."
          end

          # resource path
          local_var_path = '/cms/v3/source-code/{environment}/content/{path}'.sub('{' + 'environment' + '}', CGI.escape(environment.to_s)).sub('{' + 'path' + '}', CGI.escape(path.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])
          # HTTP header 'Content-Type'
          content_type = @api_client.select_header_content_type(['multipart/form-data'])
          if !content_type.nil?
              header_params['Content-Type'] = content_type
          end

          # form parameters
          form_params = opts[:form_params] || {}
          form_params['file'] = opts[:'file'] if !opts[:'file'].nil?

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type] || 'AssetFileMetadata'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['hapikey']

          new_options = opts.merge(
            :operation => :"ContentApi.replace",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: ContentApi#replace\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end
      end
    end
  end
end
