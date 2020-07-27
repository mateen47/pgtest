const { environment } = require('@rails/webpacker')

var webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
	$: 'jquery',
	jquery: 'jquery',
	Propper: ['propper.js', 'default']
}))
module.exports = environment
