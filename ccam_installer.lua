
local base_url = "https://raw.github.com/CCAppMarket/"

local files = {
	["/startup"] = "Minimal-Install/master/startup",
	["/.ccam/load.lua"] = "Minimal-Install/master/.ccam/load.lua",
	["/.ccam/config.cfg"] = "Minimal-Install/master/.ccam/config.cfg",
	["/.ccam/bin/ccam"] = "Minimal-Install/master/.ccam/bin/ccam",

	["/.ccam/app/ccam/main.lua"] = "AppRepository/stable/ccam/main.lua",
	["/.ccam/app/ccam/app.json"] = "AppRepository/stable/ccam/app.json",

	["/.ccam/lib/ccam/main.lua"] = "LibRepository/stable/ccam/main.lua",
	["/.ccam/lib/ccam/lib.json"] = "LibRepository/stable/ccam/lib.json",

	["/.ccam/lib/json/main.lua"] = "LibRepository/stable/json/main.lua",
	["/.ccam/lib/json/lib.json"] = "LibRepository/stable/json/lib.json",

	["/.ccam/lib/net/main.lua"] = "LibRepository/stable/net/main.lua",
	["/.ccam/lib/net/lib.json"] = "LibRepository/stable/net/lib.json",

	["/.ccam/lib/utils/main.lua"] = "LibRepository/stable/utils/main.lua",
	["/.ccam/lib/utils/lib.json"] = "LibRepository/stable/utils/lib.json"

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