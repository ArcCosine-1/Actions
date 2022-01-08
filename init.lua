local ERR_INVALID_MEMBER: string = "%q (%s) is not a valid member of %s";

local function strict(_, k: any)
	error(ERR_INVALID_MEMBER:format(tostring(k), typeof(k), script.Name), 2);
end;

return setmetatable({
	createAction = require(script:WaitForChild("createAction")),
	getChildren = require(script:WaitForChild("getChildren")),
	getDescendants = require(script:WaitForChild("getDescendants")),
	getFirstAncestor = require(script:WaitForChild("getFirstAncestor")),
	linkActions = require(script:WaitForChild("linkActions")),
}, {
	__index = strict,
	__newindex = strict,
});
