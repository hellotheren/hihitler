if Game.GameId ~= 4620241901 then
	print("Wrong Place") return
end
local repo = 'https://raw.githubusercontent.com/kirilldk20/mafiahub/refs/heads/main/'
local k = "null"
local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
if UIS.KeyboardEnabled then
local Library = loadstring(game:HttpGet(repo .. 'library_main.lua'))()
else
local Library = loadstring(game:HttpGet(repo .. 'guihandlerlinoria.lua'))()
end
local ThemeManager = loadstring(game:HttpGet(repo .. 'library_theme.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'library_save.lua'))()
local Options = Library.Options
local Toggles = Library.Toggles
local requestFunc = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
Library.ShowToggleFrameInKeybinds = true -- Make toggle keybinds work inside the keybinds UI (aka adds a toggle to the UI). Good for mobile users (Default value = true)
Library.ShowCustomCursor = false -- Toggles the Linoria cursor globaly (Default value = true)
Library.NotifySide = "Left" -- Changes the side of the notifications globaly (Left, Right) (Default value = Left)
Config = {
    api = "b26a44fd-1b6b-49fe-8734-d5baa902f218", 
    service = "KeySystemService",
    provider = "KeySystemProvider"
}
local function openGetKey()
    local JunkieKeySystem = loadstring(game:HttpGet("https://junkie-development.de/sdk/JunkieKeySystem.lua"))()
    
    local API_KEY = Config.api
    local PROVIDER = Config.provider
    local SERVICE = Config.service
    
    local link = JunkieKeySystem.getLink(API_KEY, PROVIDER, SERVICE)
    if link then
        if setclipboard then
            setclipboard(link)
            Library:Notify("Verification link copied!")
        else
            Library:Notify("Link: " .. link)
        end
    else
        Library:Notify("Failed to generate link")
    end
end
local function validateKey()
    local userKey = k
    if not userKey or userKey == "" then
        Library:Notify("Please enter a key.")
        return
    end

    Library:Notify("Validating key...")
    
    local JunkieKeySystem = loadstring(game:HttpGet("https://junkie-development.de/sdk/JunkieKeySystem.lua"))()
    
    local API_KEY = Config.api
    local SERVICE = Config.service
    
    local isValid = JunkieKeySystem.verifyKey(API_KEY, userKey, SERVICE)
    if isValid then
        Library:Notify("Key valid! Loading...")
        task.wait(1)
        Library:Unload()
        task.wait()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/alexgbroski/coolrepositoryname/refs/heads/main/qweqwe.lua'))()
        
    else
        Library:Notify("Invalid key. Try again!")
    end
end
local Window = Library:CreateWindow({

	Title = 'Key System',
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true, 
	UnlockMouseWhileOpen = true,
	NotifySide = "Left",
	TabPadding = 8,
	MenuFadeTime = 1
})

local Tabs = {

	Main = Window:AddTab('Key'),
}
local TabBoxes = {
    TabBox1 = Tabs.Main:AddLeftTabbox()
}
local TabBoxestabs = {
    Tab1 = TabBoxes.TabBox1:AddTab('credits'),
    Tab2 = TabBoxes.TabBox1:AddTab('key system')
}
local Discord = TabBoxestabs.Tab1:AddButton({
	Text = 'Discord',
	Func = function()
		setclipboard("https://discord.gg/mtbjM9f3BD")
		Library:Notify("Copied in clipboard!")
        s,e = pcall(function()
	requestFunc({
	Url = 'http://127.0.0.1:6463/rpc?v=1',
	Method = 'POST',
	Headers = {
		['Content-Type'] = 'application/json',
		Origin = 'https://discord.com'
	},
	Body = HttpService:JSONEncode({
		cmd = 'INVITE_BROWSER',
		nonce = HttpService:GenerateGUID(false),
		args = {code = "mtbjM9f3BD"}
		})
	})
end)
	end,
	DoubleClick = false,

	Tooltip = 'Discord',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})
TabBoxestabs.Tab1:AddLabel("-- [[ CREATORS ]] --")
TabBoxestabs.Tab1:AddLabel("-- Handsome Jack --")
TabBoxestabs.Tab1:AddLabel("-- Meha_Mafin --")
TabBoxestabs.Tab1:AddLabel("-- [[ END ]] --")
local Unload = TabBoxestabs.Tab1:AddButton({
	Text = 'Unload',
	Func = function()
		Library.Unload()
	end,
	DoubleClick = false,

	Tooltip = 'will unload keysystem',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})

local GetKey = TabBoxestabs.Tab2:AddButton({
	Text = 'Get Key',
	Func = function()
        openGetKey()
		Library:Notify("Copied in clipboard!")
	end,
	DoubleClick = false,

	Tooltip = 'will copy key',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})
local InputBox = TabBoxestabs.Tab2:AddInput('InputBox', {
	Default = 'Input Box',
	Numeric = false, -- true / false, only allows numbers
	Finished = false, -- true / false, only calls callback when you press enter
	ClearTextOnFocus = true, -- true / false, if false the text will not clear when textbox focused
		
	Text = 'enter here key',
	Tooltip = 'pls faster daddy', -- Information shown when you hover over the textbox

	Placeholder = 'Skidded', -- placeholder text when the box is empty
	-- MaxLength is also an option which is the max length of the text

	Callback = function(Value)
		k = Value
	end,
})
local CheckKey = TabBoxestabs.Tab2:AddButton({
	Text = 'Check Key',
	Func = function()
    validateKey()
	end,
	DoubleClick = false,

	Tooltip = 'will check key',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
})
print("success loaded")
