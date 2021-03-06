#
# Copyright (c) 2020 Seagate Technology LLC and/or its Affiliates
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
# For any questions about this software or licensing,
# please email opensource@seagate.com or cortx-questions@seagate.com.
#

# TODO: use path from pillars or any other configuration
{% set version = '2.0.0' %}
# XXX hard-coded
{% set mocks_repo = '/var/lib/seagate/cortx/provisioner/local/cortx_repos/deploy_cortx_mock_{}'.format(version) %}

{% from './_macros.sls' import bundle_built with context %}

{{ bundle_built(mocks_repo, 'deploy-cortx', version) }}

Stage - Install CORTX mock repo:
  pkgrepo.managed:
    - name: cortx_mock_repo
    - humanname: CORTX Mock repo
    - baseurl: file://{{ mocks_repo }}
    - enabled: True
    - gpgcheck: 0
    - require:
      - build_mock_repo_{{ mocks_repo }}
