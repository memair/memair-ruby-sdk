require 'minitest/autorun'
require 'memair'

class MemairTest < Minitest::Test
  def setup
    @valid_hex_access_token = '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef'
    @valid_base64_access_token = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFG'
  end

  def test_no_errors_with_valid_access_token
    Memair.new(@valid_hex_access_token)
    Memair.new(@valid_base64_access_token)
  end

  def test_raises_error_on_missing_access_token
    exception = assert_raises(ArgumentError) {
      Memair.new()
    }
    assert_equal( 'wrong number of arguments (given 0, expected 1)', exception.message )
  end

  def test_raises_error_on_non_string_access_token
    non_string_access_token = 1234567890123456
    exception = assert_raises(KeyError) {
      Memair.new(non_string_access_token)
    }
    assert_equal( 'access_token is not a string.', exception.message )
  end

  def test_raises_error_on_short_access_token
    short_access_token = '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcde'
    exception = assert_raises(KeyError) {
      Memair.new(short_access_token)
    }
    assert_equal( 'access_token should be a 43 character base64 string or a 64 character hex string.', exception.message )
  end

  def test_raises_error_on_long_access_token
    long_access_token = '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0'
    exception = assert_raises(KeyError) {
      Memair.new(long_access_token)
    }
    assert_equal( 'access_token should be a 43 character base64 string or a 64 character hex string.', exception.message )
  end

  def test_raises_error_when_query_missing
    user = Memair.new(@valid_hex_access_token)
    exception = assert_raises(ArgumentError) {
      user.query()
    }
    assert_equal( 'wrong number of arguments (given 0, expected 1)', exception.message )
  end

  def test_raises_error_when_query_not_string
    user = Memair.new(@valid_hex_access_token)
    non_string_query = 123
    exception = assert_raises(KeyError) {
      user.query(non_string_query)
    }
    assert_equal( 'query is not a string.', exception.message )
  end

  def test_returns_valid_response
    ottos_access_token = "0" * 64 # Otto is Memair's sandbox user
    user = Memair.new(ottos_access_token)
    query = """
    query get_user_details {
      UserDetails {
        email
      }
    }
    """
    response = user.query(query)

    assert_equal( "otto@memair.com", response["data"]["UserDetails"]["email"] )
  end
end
