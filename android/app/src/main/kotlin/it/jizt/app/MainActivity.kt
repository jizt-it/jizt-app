package it.jizt.app

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

private const val CHANNEL_SHARED_TEXT = "it.jizt.app.channel.shared.text"

class MainActivity : FlutterActivity() {

    private var sharedText: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handleIntent(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        handleIntent(intent)
    }

    private fun handleIntent(intent: Intent?) {
        if (intent?.action == Intent.ACTION_SEND && intent.type == "text/plain") {
            handleSharedTextIntent(intent)
        }
    }

    private fun handleSharedTextIntent(intent: Intent) {
        sharedText = intent.getStringExtra(Intent.EXTRA_TEXT)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_SHARED_TEXT)
                .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                    if (call.method?.contentEquals("getSharedText") == true) {
                        result.success(sharedText)
                        sharedText = null
                    }
                }
    }
}