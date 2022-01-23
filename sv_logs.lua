function Discord(source,  message, color)
    local name = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local hex = GetPlayerIdentifier(source)
    local connect = {
          {
              ["color"] = Config.JoiningColor,
              ["title"] = "**Player Connecting**",
              ["description"] = "```Steamname:" .. name .. "``` ```IP:" .. ip .. "``` ```HexID:" .. hex .. "``` " ,
              ["footer"] = {
              },
          }
      }
      PerformHttpRequest(Config.Webhookjoin, function(err,  text, headers) end, 'POST', json.encode({" [" .. source .. "]",  embeds = connect, content = message, avatar_url = image, tts = false}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('playerConnecting', function()
    Discord(source,  reason)
    Wait(50)
 end)

 

 function DiscordLogs(source,  reason)
    local name = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local ping =  GetPlayerPing(source)
    local hex = GetPlayerIdentifier(source)
    local connect = {
          {
              ["color"] = Config.LeavingColor,
              ["title"] = "**Player Disconnected Reason:** " .. reason .. " ",
              ["description"] = "```Steamname:" .. name .. "``` ```IP:" .. ip .. "```   ```ID:" .. source .. "``` ```Ping:" .. ping .. "``` ```HexID:" .. hex .. "``` " ,
              ["footer"] = {
              },
          }
      }
      PerformHttpRequest(Config.Webhookleave, function(err,  text, headers) end, 'POST', json.encode({" [" .. source .. "]",  embeds = connect, content = message, avatar_url = image, tts = false}), { ['Content-Type'] = 'application/json' })
end
 
 
 AddEventHandler('playerDropped', function(reason)
    DiscordLogs(source,  reason)
    Wait(50)
 end)

 print(Config.Print)

