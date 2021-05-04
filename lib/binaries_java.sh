install_java() {
  local version="$1"
  local dir="$2"

  local download_url="https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u292-b10/OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz"
  echo "Downloading JAVA [$download_url]"
  curl  --silent --fail --retry 5 --retry-max-time 15 -j -k -L "$download_url" -o /tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "dir  -------------"
  echo $dir

  echo "Installing JAVA"
  mkdir /tmp/jdk
  mkdir $dir

  tar xzf /tmp/java.tar.gz -C /tmp/jdk
  rm -rf $dir/*

  mv /tmp/jdk/jdk8u292-b10/* $dir


  chmod +x $dir/bin/*
  echo "Installation complete!"
  ls -l $dir

  export PATH="$dir/bin:$PATH"
  export JAVA_HOME="$dir"

  echo "JAVA INSTALLATO "






}
