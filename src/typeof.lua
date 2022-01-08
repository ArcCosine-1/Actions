--- Modules ---
local newproxy = require(script.Parent.newproxy);
local Types = require(script:WaitForChild('Types'));

--- Variables ---
local _typeof = typeof;
local typeof = newproxy('typeof');
local TypeInternal = {};

--- Functions ---
local function Adorn(method, callback)
	getmetatable(typeof)[("__%s"):format(method)] = callback;
end;

--- Initialization ---
for _, name in pairs(Types) do
	TypeInternal[name] = newproxy();
end;

Adorn('callback', function(userdata, var)
	local type = _typeof(var);
	
	if type ~= "table" or var.Type == nil then
		return type;
	else
		return userdata[var];
	end;
end);

Adorn('index', TypeInternal);

Adorn('tostring', function()
	tostring(getmetatable(typeof).__call);
end);

return typeof;
