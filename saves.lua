local channelsfile = minetest.get_worldpath().."/autochannel.lua.ser"

function channels:save()
	local serdata = minetest.serialize(channels.players)
	if not serdata then
		minetest.log("error", "[Channels] Data serialization failed")
		return
	end
	local file, err = io.open(channelsfile, "w")
	if err then
		return err
	end
	file:write(serdata)
	file:close()
end

function channels:load()
	local file, err = io.open(channelsfile, "r")
	if not err then
        channels.players = minetest.deserialize(file:read("*a"))
        file:close()
	else
		minetest.log("error", "[Channels] Data read failed - initializing")
        channels.players = {}
    end
end

channels:load()
