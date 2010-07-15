def assert_200(uri)
  @r = open(uri)
  assert_equal('200', @r.status.first)
end


def assert_400(uri)
  e = assert_raise(OpenURI::HTTPError) {
    @r = open(uri)
  }
  assert_equal('400 Bad Request', e.message)
end


def assert_404(uri)
  e = assert_raise(OpenURI::HTTPError) {
    @r = open(uri)
  }
  assert_equal('404 Not Found', e.message)
end


def assert_list(fields_array, uri)
  @r = open(uri)
  assert_equal(fields_array, @r.read.split("\n"))
end
