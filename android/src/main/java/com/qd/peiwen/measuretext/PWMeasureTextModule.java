
package com.qd.peiwen.measuretext;

import android.graphics.Paint;
import android.text.TextPaint;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

public class PWMeasureTextModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext context;

    public PWMeasureTextModule(ReactApplicationContext context) {
        super(context);
        this.context = context;
    }

    @Override
    public String getName() {
        return "PWMeasureText";
    }

    @ReactMethod
    public void measure(ReadableMap options, Promise promise) {
        TextPaint paint = new TextPaint();
        paint.setAntiAlias(true);
        if (!options.hasKey("fontSize")) {
            promise.reject("ERR_INVALID_FONT", "missing required fontSize property");
            return;
        }
        paint.setTextSize((float) options.getDouble("fontSize"));
        Paint.FontMetrics metrics = paint.getFontMetrics();
        promise.resolve((int) Math.ceil(metrics.descent - metrics.top));
    }
}
