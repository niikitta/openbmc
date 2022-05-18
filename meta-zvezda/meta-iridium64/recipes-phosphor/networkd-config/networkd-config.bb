SUMMARY = "Network configure"
DESCRIPTION = "Network configure"
SECTION = "base"
PR = "r1"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI = "file://00-bmc-eth0.network \
           file://LICENSE \
          "

S = "${WORKDIR}"

CONFDIR = "/etc/systemd/network"

do_install() {
  install -d ${D}${CONFDIR}
  install -m 644 00-bmc-eth0.network ${D}${CONFDIR}/00-bmc-eth0.network
}

FILES_${PN} = "${CONFDIR}"

