local ERR_EXPECTED = "Expected %q got %q";
local _newproxy = newproxy;

local function newproxy(name)
	assert(type(name) == "string", ERR_EXPECTED:format("string", type(name)));
	
	local self = _newproxy(true);
	
	getmetatable(self).__tostring = function()
		return ('userdata(%s)'):format(name);
	end;
	
	return self;
end;

return newproxy;
