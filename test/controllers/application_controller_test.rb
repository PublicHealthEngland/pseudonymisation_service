require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'in the test environment, should be authenticated by default' do
    get root_url
    assert_response :success
  end

  test 'should not be allowed access when not authenticated' do
    sign_out
    get root_url
    assert_response :unauthorized
  end

  test 'should be allowed access to root info when authenticated' do
    sign_out
    get root_url, headers: auth_headers
    assert_response :success
    assert_equal({ 'api_version' => '1' }, response.parsed_body)
  end
end
