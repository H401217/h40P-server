return function(req)
	local res = {}
	local id = http:decodePou(req)
	local nick = req.queries["n"]
	for k,v in pairs(databases.Users) do
		if v.nickname==nick then
			local obj = databases.Users[k]
			res.version = tonumber(obj.ver.v)
			res.revision = tonumber(obj.ver.r)
			res.state = obj.state
			res.i = tonumber(rng)
			res.n = obj.nickname
			res.nF = "0"
			res.nL = "0"
			res.iL = 0
			res.iM = 0
			res.ok = true
			goto done
		end
	end
	res = {error={type="ObjectNotFound"}}
	::done::
	return {body=json.encode(res),headers={}}
end