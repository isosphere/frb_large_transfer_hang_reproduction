# frb_large_transfer_hang_reproduction
A reproduction project for https://github.com/fzyzcjy/flutter_rust_bridge/issues/2301

This is a WASM/web issue. In my experience CORS must be appeased to run this application in Chromium. To that end I use `mkcert` to create a certificate for the hostname of my machine and then use [local-ssl-proxy](https://www.npmjs.com/package/local-ssl-proxy) with that certificate (which I mark trusted in Chromium). Then I visit https://hostname:port rather than the default insecure page that opens up when using `flutter run -d chrome --web-port=8080 --web-hostname=hostname --web-header=Cross-Origin-Opener-Policy=same-origin --web-header=Cross-Origin-Embedder-Policy=require-corp`
