#!/bin/bash

[ ! "${EUID}" = "0" ] && {
  echo "Execute esse script como root:"
  echo
  echo "  sudo ${0}"
  echo
  exit 1
}

HERE="$(dirname "$(readlink -f "${0}")")"

working_dir="$(mktemp -d)"

cp -rfv "${HERE}/tiger-plymouth"/* "${working_dir}"

chmod 0755 "${working_dir}/DEBIAN/postinst"

dpkg -b ${working_dir} .

mv plymouth-theme-tiger-os_*_amd64.deb "tiger-plymouth.deb"

rm -rfv ${working_dir}


