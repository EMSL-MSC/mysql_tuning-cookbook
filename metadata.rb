# encoding: UTF-8

name 'mysql_tuning'
maintainer 'Onddo Labs, Sl.'
maintainer_email 'team@onddo.com'
license 'Apache 2.0'
description <<-EOS
Tries to create MySQL configuraiton better suited for your system.
EOS
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.1'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'freebsd'
supports 'redhat'
supports 'ubuntu'

recommends 'mysql', '~> 5.0'
depends 'ohai'
depends 'mysql-chef_gem'

recipe 'mysql_tuning::default', 'Creates MySQL configuration files.'
recipe 'mysql_tuning::ohai_plugin', 'Enables MySQL ohai plugin.'

provides 'mysql_tuning'
provides 'mysql_tuning_cnf'

attribute 'mysql_tuning/system_percentage',
          display_name: 'mysql system percentage',
          description:
            'System percentage used for MySQL. Use 100 for MySQL dedicated '\
            'servers.',
          type: 'string',
          required: 'optional',
          default: '100'

attribute 'mysql_tuning/dynamic_configuration',
          display_name: 'mysql dynamic configuration',
          description:
            'Tries to change the MySQL configuration without restarting the '\
            'server, setting variable values dynamically.',
          type: 'string',
          required: 'optional',
          default: 'false'

attribute 'mysql_tuning/interpolation',
          display_name: 'mysql configuration interpolation',
          description:
            'Interpolation algorithm use. Possible values: '\
            'proximal, linear, cubic, bicubic, catmull.',
          type: 'string',
          required: 'optional',
          default: '"proximal"'

attribute 'mysql_tuning/interpolation_by_variable',
          display_name: 'mysql configuration interpolation by variable',
          description:
            'Use different interpolation algorithm for some variables.',
          type: 'hash',
          required: 'optional',
          default: '{}'

attribute 'mysql_tuning/recipe',
          display_name: 'mysql recipe name',
          description:
            'MySQL recipe name, required if not included beforehand.',
          type: 'string',
          required: 'optional',
          default: 'nil'

attribute 'mysql_tuning/include_dir',
          display_name: 'mysql include dir',
          description: 'MySQL configuration include directory.',
          type: 'string',
          required: 'optional',
          calculated: true

attribute 'mysql_tuning/mysqld_bin',
          display_name: 'mysqld binary',
          description: 'MySQL daemon binary path.',
          type: 'string',
          required: 'optional',
          calculated: true

attribute 'mysql_tuning/logging.cnf',
          display_name: 'mysqld logging.cnf',
          description: 'MySQL logging.cnf configuration.',
          type: 'string',
          required: 'optional',
          calculated: true

attribute 'mysql_tuning/tuning.cnf',
          display_name: 'mysqld tuning.cnf',
          description: 'MySQL tuning.cnf configuration.',
          type: 'string',
          required: 'optional',
          calculated: true

attribute 'mysql_tuning/configuration_samples',
          display_name: 'mysqld configuration samles',
          description: 'MySQL configuration samples.',
          type: 'string',
          required: 'optional',
          calculated: true

# Internal Attributes

attribute 'mysql_tuning/old_names',
          display_name: 'mysqld old_names',
          description: 'MySQL configuration variable old names hash.',
          type: 'string',
          required: 'optional',
          calculated: true

attribute 'mysql_tuning/non_interpolated_keys',
          display_name: 'mysqld non interpolated keys',
          description: 'MySQL keys that should not be interpolated.',
          type: 'string',
          required: 'optional',
          calculated: true

attribute 'mysql_tuning/variables_block_size',
          display_name: 'mysqld variables block size',
          description: 'MySQL variables block size.',
          type: 'string',
          required: 'optional',
          calculated: true
