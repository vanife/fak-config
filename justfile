set windows-shell := ["cmd.exe", "/c"]
# set windows-shell := ["powershell.exe", "-c"]

# list all commands
default:
	@just --list

# todo list
[group('@TODO')]
[doc('List of tasks to consider so far:
 [ ] configure timeout for CapWord (subprojects\fak\src\caps_word.c:32)
 [ ] configure range of symbols for CapWord, not just US layout (subprojects\fak\src\caps_word.c:caps_word_handle_key())
 [ ] make `ctrl+VOLU` work to control laptop screen brightness.
')]
end:
	@echo done?


# `python fak.py ? --help`
[group('fak')]
help command="":
	python fak.py {{command}} --help

# `python fak.py clean`
[group('fak')]
clean:
	python fak.py clean

# `python fak.py compile_all`
[group('fak')]
compile-all:
	python fak.py compile_all

# `python fak.py compile -kb ? -km ?`
[group('fak')]
compile kb="hexapoda" km="humming":
	python fak.py compile -kb {{kb}} -km {{km}}

# `python fak.py flash -kb ? -km ?`
[group('fak')]
flash kb="hexapoda" km="humming":
	python fak.py flash -kb {{kb}} -km {{km}}

xport-keymap kb="hexapoda" km="humming" fm="yaml": (compile kb km)
	nickel export -Isubprojects/fak/ncl -Ishared -Ikeyboards/{{kb}} keyboards/{{kb}}/keymaps/{{km}}.ncl -f {{fm}} -o .fak_cache/{{kb}}.{{km}}-keymap.{{fm}}

xport-output kb="hexapoda" km="humming" fm="yaml": (compile kb km)
	nickel export -Isubprojects/fak/ncl -Ishared -Ikeyboards/{{kb}} .fak_cache/eval.ncl -f {{fm}} -o .fak_cache/{{kb}}.{{km}}-output.{{fm}}

# temp: remove symbolic links used for debugging
symlink-delete dir='.\keyboards\hexapoda\keymaps':
	IF EXIST {{dir}}\lib (rmdir {{dir}}\lib);
	IF EXIST {{dir}}\fak (rmdir {{dir}}\fak);

# temp: create symbolic links used for debugging
symlink-create dir='.\keyboards\hexapoda\keymaps': (symlink-delete dir)
	mklink /D {{dir}}\lib {{absolute_path("shared/lib")}};
	mklink /D {{dir}}\fak {{absolute_path("subprojects/fak/ncl/fak")}};
