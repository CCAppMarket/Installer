
local base_url = "https://raw.github.com/CCAppMarket/"

local files = {
	["/startup"] = "Minimal-Install/master/startup",
	["/.ccam/load.lua"] = "Minimal-Install/master/.ccam/load.lua",
	["/.ccam/config.cfg"] = "Minimal-Install/master/.ccam/config.cfg",
	["/.ccam/bin/ccam"] = "Minimal-Install/master/.ccam/bin/ccam",

	["/.ccam/app/ccam/main.lua"] = "AppRepository/stable/ccam/main.lua",
	["/.ccam/app/ccam/config.json"] = "AppRepository/stable/ccam/config.json",

	["/.ccam/lib/libccam/main.lua"] = "LibRepository/stable/libccam/main.lua",
	["/.ccam/lib/libccam/config.json"] = "LibRepository/stable/libccam/config.json",
	["/.ccam/lib/libccam/repos.json"] = "LibRepository/stable/libccam/repos.json",

	["/.ccam/lib/json/main.lua"] = "LibRepository/stable/json/main.lua",
	["/.ccam/lib/json/config.json"] = "LibRepository/stable/json/config.json",

	["/.ccam/lib/net/main.lua"] = "LibRepository/stable/net/main.lua",
	["/.ccam/lib/net/config.json"] = "LibRepository/stable/net/config.json",

	["/.ccam/lib/utils/main.lua"] = "LibRepository/stable/utils/main.lua",
	["/.ccam/lib/utils/config.json"] = "LibRepository/stable/utils/config.json"

}

for k, v in pairs(files) do
	print("Downloading: " .. k)
	local f = fs.open(k, 'w')
	local d = http.get(base_url .. v).readAll()
	f.write(d)
	f.close()
end

fs.delete("ccam_install")
os.reboot()
