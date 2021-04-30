install_java() {
  local version="$1"
  local dir="$2"
  
  local download_url="https://download.java.net/openjdk/jdk8u41/ri/openjdk_jre_ri-8u41-b04-linux-i586-14_jan_2020.tar.gz"
  echo "Downloading JAVA [$download_url]"
  curl  --silent --fail --retry 5 --retry-max-time 15 -j -k -L "$download_url" -o /tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing JAVA"
  mkdir /tmp/jdk
  mkdir $dir
  tar xzf /tmp/java.tar.gz -C /tmp/jdk
  rm -rf $dir/*
  mv /tmp/jdk/java-se-8u41-ri/* $dir
  chmod +x $dir/bin
  echo "Installation complete!"	
}
