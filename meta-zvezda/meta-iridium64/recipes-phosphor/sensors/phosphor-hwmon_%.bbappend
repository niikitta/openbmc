FILESEXTRAPATHS:prepend:iridium64 := "${THISDIR}/${PN}:"

EXTRA_OEMESON:append:iridium64 = " -Dnegative-errno-on-fail=true"

CHIPS = " \
        bus@1e78a000/i2c-bus@100/lm95241@19 \
        bus@1e78a000/i2c-bus@100/lm95241@2a \
        bus@1e78a000/i2c-bus@100/lm95241@2b \
        pwm-tacho-controller@1e786000 \
        "
ITEMSFMT = "ahb/apb/{0}.conf"

ITEMS = "${@compose_list(d, 'ITEMSFMT', 'CHIPS')}"

ENVS = "obmc/hwmon/{0}"
SYSTEMD_ENVIRONMENT_FILE:${PN}:append:iridium64 := "${@compose_list(d, 'ENVS', 'ITEMS')}"

PECINAMES = " \
        peci-0/0-30/peci-cputemp.0 \
        peci-0/0-30/peci-dimmtemp.0 \
        peci-0/0-31/peci-cputemp.1 \
        peci-0/0-31/peci-dimmtemp.1 \
        "
PECIITEMSFMT = "devices/platform/ahb/ahb--apb/ahb--apb--bus@1e78b000/1e78b000.peci-bus/{0}.conf"
PECIITEMS = "${@compose_list(d, 'PECIITEMSFMT', 'PECINAMES')}"
PECIENVS = "obmc/hwmon/{0}"
SYSTEMD_ENVIRONMENT_FILE:${PN}:append:iridium64 = " ${@compose_list(d, 'PECIENVS', 'PECIITEMS')}"

IIOITEMS = "devices/platform/iio-hwmon.conf"
IIOENVS = "obmc/hwmon/{0}"
SYSTEMD_ENVIRONMENT_FILE:${PN}:append:iridium64 = " ${@compose_list(d, 'IIOENVS', 'IIOITEMS')}"
