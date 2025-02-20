set windows-shell := ["cmd.exe", "/c"]
# set windows-shell := ["powershell.exe", "-c"]

# list all commands
default:
	@just --list

# `python fak.py help`
help command="":
	python fak.py {{command}} --help

# `python fak.py compile -kb ? -km ?`
compile kb="hexapoda" km="humming":
	python fak.py compile -kb {{kb}} -km {{km}}

# `python fak.py flash -kb ? -km ?`
flash kb="hexapoda" km="humming":
	python fak.py flash -kb {{kb}} -km {{km}}

# `python fak.py clean`
clean:
	python fak.py clean
