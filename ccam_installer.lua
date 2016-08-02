
local deleteFiles = {
	"ccam_installer",
	"grd",
	"Minimal-Install",
	".gitignore",
	"README.md",
	".ccam/app/ccam/README.md",
	".ccam/lib/ccam_lib/README.md"
}

file = fs.open("grd","w")
file.write(http.get("https://raw.githubusercontent.com/CCAppMarket/Installer/master/grd").readAll())
file.close()

shell.run("grd CCAppMarket Minimal-Install / . .")
shell.run("mv Minimal-Install/* /")

for _, v in pairs(deleteFiles) do
	fs.delete(v)
end

os.reboot()