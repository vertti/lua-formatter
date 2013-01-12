-- Author: Janne Sinivirta
-- Date: 11/25/12

local function trim2(s)
  return s:match "^%s*(.-)%s*$"
end

local function operator_spacing(str)
	return string.gsub(str, "[ ]*[=+]+[ ]*", function(x) return " " .. trim2(x) .. " " end)
end

local function comma_spacing(str)
	return string.gsub(str, "[ ]*[,]+[ ]*", function(x) return trim2(x) .. " " end)
end

local function comment_spacing(str)
	return string.gsub(str, "%-%-[%[]*%s*", function(x) return trim2(x) .. " " end)
end

function formatstring(str)
	return comment_spacing(operator_spacing(comma_spacing(str)))
end



