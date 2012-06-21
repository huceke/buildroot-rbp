#/bin/sh

TARGET_DIR=$1

echo "TARGET_DIR= TARGET_DIR= TARGET_DIR= $TARGET_DIR"

if [ ! -e ${TARGET_DIR}/usr/share ]; then
  mkdir -p ${TARGET_DIR}/usr/share
fi

if [ ! -e ${TARGET_DIR}/usr/lib ]; then
  mkdir -p ${TARGET_DIR}/usr/lib
fi

cp -ar ${TARGET_DIR}/../staging/usr/lib/gconv ${TARGET_DIR}/usr/lib/
cp -ar ${TARGET_DIR}/../staging/usr/share/zoneinfo ${TARGET_DIR}/usr/share/
cp -ar ${TARGET_DIR}/../staging/usr/share/locale ${TARGET_DIR}/usr/share/

exit 0
