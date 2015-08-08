class systemenv::vars(
	$vars = {}
) {
	include systemenv

	create_resources(systemenv::var, $vars)

}