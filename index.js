const importObject = {
    memory: new WebAssembly.Memory({initial: 256, maximum: 256}),
    wasi_snapshot_preview1: {
      path_readlink() { },
      fd_fdstat_get() { },
      fd_close() { },
      fd_write() { },
      fd_read() { },
      fd_tell() { },
      fd_filestat_get() { },
      path_open() { },
      proc_exit() { },
      fd_prestat_get() { },
      fd_prestat_dir_name() { },
      environ_sizes_get() { },
      environ_get() { },
    }
};

async function runWasm() {
    fetch('/hello.wasm').then(response => 
        response.arrayBuffer()
    )
    .then(bytes => WebAssembly.instantiate(bytes, importObject))
    .then(result => {
        instance = result.instance;
        exports = instance.exports;
        const pstr = exports.hello();
        const memory = exports.memory || importObject.memory;
        const strArr = new Uint8Array(memory.buffer, pstr);
        let str = '';
        for (let i = 0; i < 100 && strArr[i] !== 0; i++) {
            str += String.fromCharCode(strArr[i]);
        }
        console.log('WASM Output:', str);
        document.getElementById("output").textContent = str;
    })
    .catch(console.error);
}