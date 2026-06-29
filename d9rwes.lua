loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
CMDs[#CMDs + 1] = {NAME = 'randomhub / hub', DESC = 'Will load random hub'}
CMDs[#CMDs + 1] = {NAME = 'robloxcam / rc', DESC = 'Allows you to freely move camera around the game (roblox version)'}
addcmd('randomhub',{"hub"},function(args, speaker)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/hellotheren/hihitler/refs/heads/main/RandomHubHandler.lua"))()
end)

addcmd('robloxcam',{'rc'},function(args, speaker)
	loadstring(game:HttpGet("https://pastebin.com/raw/GX6MytJm"))()
end)
