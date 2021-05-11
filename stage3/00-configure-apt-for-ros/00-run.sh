#!/bin/bash -e

install -m 644 files/ros2-latest.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/robotique-ecam.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
sed -i "s/RELEASE/${RELEASE}/g" "${ROOTFS_DIR}/etc/apt/sources.list.d/ros2-latest.list"

on_chroot apt-key add - < files/ros.gpg.key
on_chroot << EOF
apt-get update
apt-get dist-upgrade -y
EOF
