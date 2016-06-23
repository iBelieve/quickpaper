#!/bin/bash

ENTRY_POINT="/tmp/dock_paper_entry_point.sh"
: ${QT_VERSION:="qt:5.7.0"}

cat > ${ENTRY_POINT} << EOF
#!/bin/bash
echo "Preparing image with $QT_VERSION"
apt update &> /tmp/log && apt install sudo xvfb -y  &> /tmp/log
groupadd -g $(getent group $USER | cut -d: -f3) $USER
useradd -g $USER -G sudo -N -u $UID $USER
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "Command: $@"
/bin/su $USER -c "cd $PWD && qmake --version && $@"

EOF
chmod +x ${ENTRY_POINT}

VOLUMES="-v ${ENTRY_POINT}:${ENTRY_POINT}:ro"
VOLUMES="${VOLUMES} -v $PWD:$PWD"

docker run --rm ${VOLUMES} --entrypoint=${ENTRY_POINT} approximator/$QT_VERSION
rm ${ENTRY_POINT}
