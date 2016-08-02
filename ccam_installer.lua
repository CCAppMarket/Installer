
file = fs.open("grd","w")
file.write(http.get("https://raw.githubusercontent.com/CCAM/Installer/master/grd").readAll())
file.close()

shell.run("grd CCAM Minimal-Install / . .")
shell.run("mv Minimal-Install/* /")

fs.delete("README.md")
fs.delete("grd")
fs.delete("Minimal-Install")
fs.delete(".gitignore")