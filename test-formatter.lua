-- Author: Janne Sinivirta
-- Date: 11/25/12

package.path = package.path .. ";../lunatest/?.lua;"
print(package.path)
require('lunatest')
require('lunahamcrest')

require('formatter')

function test_operator_spacing()
	assert_that(formatstring("testi=ok"), equal_to("testi = ok"))
	assert_that(formatstring("testi==ok"), equal_to("testi == ok"))
	assert_that(formatstring("testi = ok"), equal_to("testi = ok"))
	assert_that(formatstring("testi+ok"), equal_to("testi + ok"))
end

function test_comma_spacing()
	assert_that(formatstring("(a,b)"), equal_to("(a, b)"))
end

function test_comment_spacing()
	assert_that(formatstring("--comment"), equal_to("-- comment"))
	assert_that(formatstring("--[[comment"), equal_to("--[[ comment"))
	assert_that(formatstring("--[[\tcomment"), equal_to("--[[ comment"))
	assert_that(formatstring("--       comment"), equal_to("-- comment"))
end


lunatest.run()