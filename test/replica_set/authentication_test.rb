# Copyright (C) 2009-2013 MongoDB, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'test_helper'
require 'shared/authentication/basic_auth_shared'
require 'shared/authentication/sasl_plain_shared'

class ReplicaSetAuthenticationTest < Test::Unit::TestCase
  include Mongo
  include BasicAuthTests
  include SASLPlainTests

  def setup
    ensure_cluster(:rs)
    @client    = MongoReplicaSetClient.new(@rs.repl_set_seeds)
    @db        = @client[TEST_DB]
    @host_info = @rs.repl_set_seeds.join(',')
    init_auth
  end
end
