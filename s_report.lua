webHookURL = "https://discord.com/api/webhooks/811998317705429023/HdZh1a6BaTZ_kMwHd6Y7GAbyb_YTZw13kQtUx7V_2VLg3KcatFZO4gugq93mdxvHA81W" -- Discordunuzda weebhook oluşturup buraya ekleyin
local DISCORD_NAME = "Rapor Botu" -- Değiştirmenize gerek yok 
local DISCORD_IMAGE = "https://newsfeed.org/wp-content/uploads/social-media-reports-Facebook-reports-Instagram-reports.jpg" -- Resimi değiştirebilirsiniz.
local role = "809466474761814053" -- reportun discordda etiketleyeceği rol idsi
enableReport = true -- dokunmayın

local role = "<@&"..role..">"

if enableReport then
    RegisterCommand("report", function(source, args, rawCommand)
        local user = tonumber(args[1])
        local msg = table.concat(args, " ", 2)
        local username = GetPlayerName(source)
		local reporter = GetPlayerName(source)
		if username == nil then
			print("ID'yi Doğru Girdiğinizden Emin Olun")
		else
			color = 16711680
			print("Kullanıcı".. username .. " Yetkiliye Şikayet Edildi!")
            
            local ping = GetPlayerPing(source)
            local identifiers = GetPlayerIdentifiers(source)
            local data = json.encode(identifiers)

            local connect = {
                {
                    ["color"] = color,
                    ["title"] = "Kullanıcı ["..source.."] ".. username .. " Şu Sebebten Şikayet Edildi: ",
                    ["description"] = "Sebep: **"..msg.."**\nPing: **"..ping.."**\nKimlik: **"..data.."**",
                    ["footer"] = {
                    ["text"] = "Rapor : "..reporter.. ".",
                    },
                }
            }
            PerformHttpRequest(webHookURL, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, content = role , embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
		end
    end)

end
