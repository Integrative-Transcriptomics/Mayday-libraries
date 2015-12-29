D=`mktemp -d`

if [ "$3" == "" ]; then
  echo Usage:
  echo "makejar.sh <original-jarfile> <mayday-librarywrapper-class> <new-manifest-file>"
else
  echo Destination is $D
  cp $1 $D
  mkdir -p $D/mayday/libraries/
  mkdir -p $D/META-INF/
  cp $2 $D/mayday/libraries
  cp $3 $D/MANIFEST.MF
  OD=`pwd`
  cd $D
  jar xf $1
  rm $1
  mv MANIFEST.MF META-INF/
  jar cmf META-INF/MANIFEST.MF newjar.jar *
  mv newjar.jar $OD
  cat META-INF/MANIFEST.MF
  cd $OD
  echo The new Jar file is newjar.jar
fi
