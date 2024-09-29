
const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// Get the actual sass-loader config
//const sassLoader = environment.loaders.get('sass')
//const sassLoaderConfig = sassLoader.use.find(function(element) {
  //return element.loader == 'sass-loader'
//})


environment.plugins.append('Provide',new webpack.ProvidePlugin({
	$: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.jQuery': 'jquery',
	Popper: ['popper.js', 'default']
}));
module.exports = environment


/*
const { environment } = require('@rails/webpacker')
const webpack = require("webpack")
environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
  }))
module.exports = environment
*/