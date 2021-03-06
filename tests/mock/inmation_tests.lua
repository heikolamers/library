-- inmation is loaded globaly
assert(inmation, 'inmation mock not loaded')

tests = {
    test_now = function(self)
        local dateNow = inmation.now()
        assert(dateNow ~= nil, "Test_datenow failed; No valid date returned")
    end,

     test_currenttime = function(self)
        local dateNow = inmation.currenttime()
        assert(dateNow ~= nil, "Test_datenow failed; No valid date returned")
    end,

    test_gettimebynumber = function(self)
       -- local dateTime = inmation.gettime(1417506063871)
       -- local expectedResult = '2014-12-02T07:41:03.871Z'
       -- assert(dateTime ~= expectedResult, string.format("test_gettimebynumber failed; Expected '%s' got '%s'", expectedResult, dateTime))
    end,

    execute = function(self)
        print("Begin inmation_tests")
        self:test_now()
        self:test_currenttime()
        self:test_gettimebynumber()
        print("End inmation_tests")
    end
}

return tests