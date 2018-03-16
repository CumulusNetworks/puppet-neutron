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
# Unit tests for neutron::plugins::ml2::cumulus class
#
require 'spec_helper'

describe 'neutron::plugins::ml2::cumulus' do

  let :pre_condition do
    "class { '::neutron::keystone::authtoken':
      password => 'passw0rd',
     }
     class { 'neutron::server': }
     class { 'neutron':
      rabbit_password => 'passw0rd',
      core_plugin     => 'ml2' }"
  end

  let :params do
    { :switches     => '192.168.0.11,192.168.0.12'
    }
  end

  shared_examples_for 'neutron plugin ml2 cumulus' do
    before do
      params.merge!(default_params)
    end

    it 'configures ml2 cumulus settings' do
      is_expected.to contain_neutron_plugin_ml2('ml2_cumulus/switches').with_value(params[:switches])
    end
  end

  on_supported_os({
    :supported_os => OSDefaults.get_supported_os
  }).each do |os,facts|

    context "on #{os}" do
      let(:facts) do
        facts.merge!(OSDefaults.get_facts({
        }))
      end

      it_configures 'neutron plugin ml2 cumulus'
    end
  end
end
