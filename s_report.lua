webHookURL = "https://discord.com/api/webhooks/811998317705429023/HdZh1a6BaTZ_kMwHd6Y7GAbyb_YTZw13kQtUx7V_2VLg3KcatFZO4gugq93mdxvHA81W" -- Discord Webhook you can create it in Channel settings
local DISCORD_NAME = "Report System" -- Webhook Name
local DISCORD_IMAGE = "https://newsfeed.org/wp-content/uploads/social-media-reports-Facebook-reports-Instagram-reports.jpg" -- Webhook Image
local role = "809466474761814053" -- Team Role ID
enableReport = true -- true or false :)

local role = "<@&"..role..">"

if enableReport then
    RegisterCommand("report", function(source, args, rawCommand)
        local user = tonumber(args[1])
        local msg = table.concat(args, " ", 2)
        local username = GetPlayerName(source)
		local reporter = GetPlayerName(source)
		if username == nil then
			print("PLS write a Username or a User ID")
		else
			color = 16711680
			print("You sucessfully reported".. username .. "!")
            
            local ping = GetPlayerPing(source)
            local identifiers = GetPlayerIdentifiers(source)
            local data = json.encode(identifiers)

            local connect = {
                {
                    ["color"] = color,
                    ["title"] = "["..source.."] ".. username .. " reported for the following reason: ",
                    ["description"] = "Reason: **"..msg.."**\nPing: **"..ping.."**\nID: **"..data.."**",
		    ["author"] = "by SandraHoligan",
                    ["footer"] = {
                    ["text"] = "Reported by : "..reporter.. ".",
                    },
                }
            }
            PerformHttpRequest(webHookURL, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, content = role , embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
		end
    end)

end
