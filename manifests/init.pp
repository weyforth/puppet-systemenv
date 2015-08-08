class systemenv(
	$vars = {}
) {
	require systemenv::params

	create_resources(systemenv::var, $vars)

}