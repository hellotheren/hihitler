local games = {
    [18537175269]  = "https://pastebin.com/raw/8797sjkC"
}
repeat
wait()
until game.Players.LocalPlayer.Character
if games[game.PlaceId] ~= nil then
    print(games[game.PlaceId])
    loadstring(game:HttpGet(games[game.PlaceId]))()
end
