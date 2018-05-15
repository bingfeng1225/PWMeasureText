
package com.qd.peiwen.measuretext;

import android.graphics.Paint;
import android.text.TextPaint;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.WritableArray;

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
    public void measure(ReadableArray array, Promise promise) {
        WritableArray results = Arguments.createArray();
        for (int i = 0;i< array.size();i++) {
            TextPaint paint = new TextPaint();
            paint.setAntiAlias(true);
            paint.setTextSize((float) array.getDouble(i));
            Paint.FontMetrics metrics = paint.getFontMetrics();
            results.pushInt((int) Math.ceil(metrics.descent - metrics.top));
        }
        promise.resolve(results);
    }
}
