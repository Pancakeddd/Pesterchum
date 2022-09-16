# webchum

pesterchum for the web.

## Toolbox (Alfons)

### Install dependencies

Run `alfons install` to install all required dependencies. Make sure you are using version 5.1. The default name for LuaRocks is `luarocks`.
If you need to run as an admin, do `sudo alfons install`, if the name of your LuaRocks is different, modify the file.

### Compile all code

Run `alfons compile` to compile all MoonScript code. It automatically keeps track of files which do not need to be recompiled. If you need to recompile everything again, just run `alfons compile noskip`.

### Clean project

Run `alfons clean` to clean all files that you do not need.

### Start up server

Run `alfons server` to prop up the Lapis server.

### Setup database

Although not defined yet, but running `alfons setup` will run `webchum/db/setup.moon` for setting up the database. The driver in use is [Grasp](https://github.com/daelvn/grasp). Make sure to install the dependencies first.

### Shortcuts

- `alfons fast` is the equivalent to running `alfons compile server`.
- `alfons slow` is the equivalent to running `alfons clean setup compile noskip server`
