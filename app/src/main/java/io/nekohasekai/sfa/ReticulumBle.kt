package io.nekohasekai.sfa

/**
 * Bridge to the native Reticulum BLE initialisation.
 *
 * The Rust Reticulum bridge is linked as a static library inside gomobile's
 * `libgojni.so`, so it cannot capture the process [JavaVM] from its own
 * `JNI_OnLoad` (gomobile owns that entry point). Instead we push the JavaVM in
 * explicitly: [nativeSetReticulumJVM] resolves to the exported native symbol
 * `Java_io_nekohasekai_sfa_ReticulumBle_nativeSetReticulumJVM` in `libgojni.so`,
 * which calls through to `reticulum_set_jvm` and initialises btleplug + jni-utils.
 *
 * No `System.loadLibrary` is needed here — `libgojni.so` is already loaded by the
 * generated `io.nekohasekai.libbox` bindings (touched in `Application.onCreate`
 * before this is called), and JNI resolves native methods across all loaded
 * libraries. Call on the main/Java thread so btleplug can see the app classloader.
 */
object ReticulumBle {
    external fun nativeSetReticulumJVM()
}
