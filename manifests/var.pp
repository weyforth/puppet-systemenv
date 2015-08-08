define systemenv::var (
  $ensure = 'present',
  $varname = $name,
  $value = undef,
  $target = undef,
  $quotes = false
) {
  require systemenv

  validate_re($ensure, '^present|absent$')
  validate_re($varname, '^[a-zA-Z][a-zA-Z0-9_]+')
  
  if $target == undef {
    $target = $systemenv::params::default_env_settings_file
  }

  validate_absolute_path($target)

  $quote_str = ""

  if $quotes == false {
    $quote_str = "\'" 
  }

  ini_setting { "${target} ${varname}=${value}":
    ensure => $ensure,
    path => $target,
    section => '',
    setting => $varname,
    value => "${quote_str}${value}${quote_str}",
    key_val_separator => '=',
  }
}
