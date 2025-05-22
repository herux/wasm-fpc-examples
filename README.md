# 🧩 WebAssembly Examples with Free Pascal (FPC)

This repository demonstrates how to create and use WebAssembly (`.wasm`) modules compiled from **Free Pascal** code. The examples showcase how to export functions from Pascal and call them in a web browser using JavaScript.

## 📁 Project Structure

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