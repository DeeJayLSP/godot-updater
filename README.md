# Unofficial Godot Updater

These are some scripts tasked with dowloading, installing and linking the `godot` command to the binary.

## Linux

At the moment this updater only supports Linux. It requires `bash`, `curl`, `wget` and `unzip` to work. A `torsocks`version is available for those with problems downloading from TuxFamily.

In order to run you need to type:

```shell
sudo /path/to/script.sh <valid.godot.version>
```

By default, this script installs the engine at `/opt/godot/major_godot_version/godot`. The symbolic link can be found at `/usr/local/bin/godot`

Be aware that using the updater to downgrade to a older godot version will also update the link to that old version.
