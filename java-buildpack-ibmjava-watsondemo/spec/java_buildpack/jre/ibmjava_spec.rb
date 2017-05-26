# Encoding: utf-8
# Cloud Foundry Java Buildpack
# Copyright 2017 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'
require 'component_helper'
require 'java_buildpack/component/mutable_java_home'
require 'java_buildpack/jre/ibmjava'

describe JavaBuildpack::Jre::Ibmjava do
  include_context 'component_helper'
  let(:java_home) { JavaBuildpack::Component::MutableJavaHome.new }
  it 'detects with id of ibmjava-<version>' do
    expect(component.detect).to eq("ibmjava=#{version}")
  end
  it 'installs the java from bin', cache_fixture: 'stub-java.bin' do
    component.detect
    component.compile
    expect(sandbox + 'jre/bin/java').to exist
  end
  it 'adds JAVA_HOME to java_home' do
    component
    expect(java_home.root).to eq(sandbox + 'jre/')
  end
  it 'adds java.io.tmpdir to java_opts' do
    component.detect
    component.release
    expect(java_opts).to include('-Djava.io.tmpdir=$TMPDIR')
  end
  it 'adds tls options to java_opts' do
    component.detect
    component.release
    expect(java_opts).to include('-Dcom.ibm.jsse2.overrideDefaultTLS=true')
  end
  it 'adds Xtune to java_opts' do
    component.detect
    component.release
    expect(java_opts).to include('-Xtune:virtualized')
  end
  it 'adds Xshareclasses to java_opts' do
    component.detect
    component.release
    expect(java_opts).to include('-Xshareclasses:none')
  end
end
