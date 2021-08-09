RegisterCommand('kacoyuncu', function(source, args, rawCommand)
    local asyncTasks = {}
	local xPlayers   = GetPlayers()

    for i=1, #xPlayers, 1 do
		table.insert(asyncTasks, function(cb)
			local xPlayer = GetPlayerFromId(xPlayers[i])
		end)
	end
	local komutuyazan = 'cmd'
	local msg = 'Oyuncu Oyunda'
	local discord_webhook  = {
		url = "",
		resim = "https://cdn0.iconfinder.com/data/icons/keyboard-6/24/Command-2-512.png"
	}
	print(('[^6Game Notif^7]  ^2%s^0 Oyuncu Oyunda'):format(#xPlayers))
	PerformHttpRequest(discord_webhook.url,
	function(err, msg, dayi, komutuyazan) end,
	'POST',
	--json.encode({username = komutuyazan, content = '```fix\nDuyuru: \n  ' .. (#xPlayers) .. ' ' .. msg .. '```', avatar_url= discord_webhook.resim}), {['Content-Type'] = 'application/json'})
	json.encode({username = komutuyazan, avatar_url= discord_webhook.resim, embeds = {
		{
			["color"] = "1127128",
			["title"] = 'Duyuru',
			["description"] = 'Player System \n **' .. (#xPlayers) .. '** ' .. msg
		}
		}}), { ['Content-Type'] = 'application/json' })
end)