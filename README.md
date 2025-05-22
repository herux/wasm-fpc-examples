# 🧩 WebAssembly Examples with Free Pascal (FPC)

This repository demonstrates how to create and use WebAssembly (`.wasm`) modules compiled from **Free Pascal** code. The examples showcase how to export functions from Pascal and call them in a web browser using JavaScript.

## 📁 Project Structure

```md
├── hello.pas # Free Pascal source code exporting a 'Hello World!' function
├── hello.wasm # Compiled WebAssembly binary
├── *.wasm     # |_  
├── http_server.pas # http server unit
├── http_servers.lpi # |
├── http_servers.lpr # ├──lazarus project files
├── http_servers.lps # |
├── index.html # Simple HTML page to load and run the WebAssembly
├── index.js # JavaScript loader for the WASM module
└── README.md # This file
```
## 🚀 Getting Started

### 1. Compile the Pascal Code

Make sure you have Free Pascal (with WebAssembly support) installed.

Compile the Pascal source to WebAssembly:

```bash
ppcrosswasm32 -Twasi -ohello.wasm hello_wasm.pas
```

### 2. Compile the Pascal Code
You need to serve these files over HTTP to load WebAssembly in the browser.


## 🛠️ Author & License

Created by herux.
Licensed under the MIT License.
