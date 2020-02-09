package com.arieuqis.floating_button2

import android.widget.ImageView
import androidx.annotation.NonNull;
import com.yhao.floatwindow.FloatWindow
import com.yhao.floatwindow.Screen
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    private val  CHANNEL = "floating_button2"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler {
            call, result ->
            when (call.method){
                "create" -> {
                    var imageView = ImageView(applicationContext)
                    imageView.setImageResource(R.drawable.plus)

                    FloatWindow.with(applicationContext).setView(imageView)
                            .setWidth(Screen.width, 0.15f)
                            .setHeight(Screen.height, 0.15f)
                            .setX(Screen.width, 0.8f)
                            .setY(Screen.height, 0.3f)
                            .setDesktopShow(true)
                            .build()

                    imageView.setOnClickListener({ v -> channel.invokeMethod("touch", null)})
                }
                "show" -> FloatWindow.get().show()
                "hide" -> FloatWindow.get().hide()
                "isShowing" -> result.success(FloatWindow.get().isShowing)
                else -> result.notImplemented()
            }
        }
    }

    override fun onDestroy() {
        FloatWindow.destroy()
        super.onDestroy()
    }
}
