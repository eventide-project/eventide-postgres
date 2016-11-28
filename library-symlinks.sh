set -e

if [ -z ${LIBRARIES_HOME+x} ]; then
  echo "LIBRARIES_HOME must be set to the libraries directory path... exiting"
  exit 1
fi

if [ ! -d "$LIBRARIES_HOME" ]; then
  echo "$LIBRARIES_HOME does not exist... exiting"
  exit 1
fi

function make_directory {
  directory=$1

  lib_directory="$LIBRARIES_HOME/$directory"

  if [ ! -d "$lib_directory" ]; then
    echo "- making directory $lib_directory"
    mkdir -p "$lib_directory"
  fi
}

function remove_lib_symlinks {
  name=$1
  directory=$2

  dest="$LIBRARIES_HOME"
  if [ ! -z "$directory" ]; then
    dest="$dest/$directory"
  fi
  dest="$dest/$name"

  for entry in $dest*; do
    if [ -h "$entry" ]; then
      echo "- removing symlink: $entry"
      rm $entry
    fi
  done
}

function symlink_lib {
  name=$1
  directory=$2

  echo
  echo "Symlinking $name"
  echo "- - -"

  remove_lib_symlinks $name $directory

  src="$(pwd)/lib"
  dest="$LIBRARIES_HOME"
  if [ ! -z "$directory" ]; then
    src="$src/$directory"
    dest="$dest/$directory"

    make_directory $directory
  fi
  src="$src/$name"

  echo "- destination is $dest"

  full_name=$directory/$name

  for entry in $src*; do
    entry_basename=$(basename $entry)
    dest_item="$dest/$entry_basename"

    echo "- symlinking $entry_basename to $dest_item"

    cmd="ln -s $entry $dest_item"
    echo $cmd
    ($cmd)
  done

  echo "- - -"
  echo "($name done)"
  echo
}
