#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn do_nothing_with_blob(blob: Vec<u8>) -> String {
    format!("Hello, I didn't even look at the blob! Nyah!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
