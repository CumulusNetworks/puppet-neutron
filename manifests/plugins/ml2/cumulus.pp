#
# Copyright (C) 2018 Cumulus Networks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# == Class: neutron::plugins::ml2::cumulus
#
# === Parameters
#
# [*switches*]
# (required) The Cumulus switches IP address or hostname.
#
# [*scheme*]
# (optional) Scheme for base URL for the Cumulus ML2 API
# Defaults to https
#
# [*protocol_port*]
# (optional) Protocol port for the base URL for the Cumulus ML2 API
# Defaults to 8080
#
# [*sync_time*]
# (optional) Periodic time interval in seconds for checking connection
#            with switches listed in the switches parameter.
# Defaults to 30 seconds
#
# [*spf_enable*]
# (optional) Defines if the SPF is enabled or disabled on the bridge
#            configured in the switch.
# Defaults to False
#
# [*new_bridge*]
# (optional) Defines the bridge created on the switch is vlan aware or
#            vlan unaware.
# Defaults to True
#
class neutron::plugins::ml2::cumulus (
  $switches               = [],
  $scheme                 = 'https',
  $protocol_port          = 8080,
  $sync_time              = 30,
  $spf_enable             = false,
  $new_bridge             = true,
) {

  include ::neutron::deps
  require ::neutron::plugins::ml2

  neutron_plugin_ml2 {
    'ml2_cumulus/switches'      : value => $switches;
    'ml2_cumulus/scheme'        : value => $scheme;
    'ml2_cumulus/protocol_port' : value => $protocol_port;
    'ml2_cumulus/sync_time'     : value => $sync_time;
    'ml2_cumulus/spf_enable'    : value => $spf_enable;
    'ml2_cumulus/new_bridge'    : value => $new_bridge;
  }
}
