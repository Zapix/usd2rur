var ExtractTextPlugin = require("extract-text-webpack-plugin");

const elmSource = __dirname + '/web/elm';


module.exports = {
  entry: ["./web/static/css/app.css", "./web/static/js/app.js"],
  output: {
    path: __dirname + "/priv/static/js",
    filename: "app.js"
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "babel-loader",
        query: {
          presets: ["es2015"]
        }
      },
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract({ fallback: 'style-loader', use: 'css-loader' })
      },
      {
        test: /\.(woff|woff2)(\?v=\d+\.\d+\.\d+)?$/, loader: 'url?limit=10000&mimetype=application/font-woff'
      },
      {
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/, loader: 'url?limit=10000&mimetype=application/octet-stream'
      },
      {
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/, loader: 'file'
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/, loader: 'url?limit=10000&mimetype=image/svg+xml'
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack-loader?cwd=' + elmSource
      }
    ],
    noParse: [/\.elm$/]
  },
  plugins: [
    new ExtractTextPlugin("css/app.css")
  ],
  resolve: {
    extensions: ['.css', '.js', '.elm']
  }
}