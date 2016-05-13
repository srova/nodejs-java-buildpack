install_maven() {
  local version="$1"
  local dir="$2"
  
  local download_url="http://www-us.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz"
  echo "Downloading Maven [$download_url]"
  curl  --silent --fail --retry 5 --retry-max-time 15 -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "$download_url" -o /tmp/maven.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing Maven"
  mkdir /tmp/maven
  mkdir $dir
  tar xzf /tmp/maven.tar.gz -C /tmp/maven
  rm -rf $dir/*
  mv /tmp/maven/* $dir
  chmod +x $dir/bin
  echo "Installation complete!"	
}