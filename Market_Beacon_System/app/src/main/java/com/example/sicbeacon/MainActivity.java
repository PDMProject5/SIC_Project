package com.example.sicbeacon;


import android.Manifest;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import org.altbeacon.beacon.Beacon;
import org.altbeacon.beacon.BeaconConsumer;
import org.altbeacon.beacon.BeaconManager;
import org.altbeacon.beacon.BeaconParser;
import org.altbeacon.beacon.RangeNotifier;
import org.altbeacon.beacon.Region;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class MainActivity extends AppCompatActivity{

    private String Storeip = "49.1.213.223";
    private String cseq;
    private WebView webView;

    private List<Beacon> beaconList = new ArrayList<>();

    private static final String TAG = "sicbeacon";

    private static final int PERMISSION_REQUEST_COARSE_LOCATION = 1;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // TODO : 위치 액세스 권한 요청
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M){
            if(this.checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION)!= PackageManager.PERMISSION_GRANTED){
                final AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle("이 앱은 위치 액세스가 필요합니다" );
                builder.setMessage("이 앱이 비콘을 감지 할 수 있도록 위치 액세스 권한을 부여하세요.");
                builder.setPositiveButton(android.R.string.ok,null);
                builder.setOnDismissListener(new DialogInterface.OnDismissListener() {

                    @Override
                    public void onDismiss(DialogInterface dialogInterface) {
                        requestPermissions(new String[]{Manifest.permission.ACCESS_COARSE_LOCATION},PERMISSION_REQUEST_COARSE_LOCATION);
                    }

                });

                builder.show();
            }
        }
            Intent intent = getIntent();
            int major = intent.getIntExtra("major" ,0);

        webView = findViewById(R.id.wb_Store);

        if (major == 113) {
            webView.loadUrl("http://"+Storeip+":8099/Market_Management_System/userViewListCoupon.do");
            webView.setWebChromeClient(new WebChromeClient(){
                public void onPageFinished(WebView view, String url){
                    webView.loadUrl("javascript:getCouponBtn('"+cseq+"')"); //
                    webView.loadUrl("javascript:backBtn()");
                    webView.loadUrl("javascript:goMainPage()");
                }
            });
            webView.setWebViewClient(new WebViewClientClass());
            webView.getSettings().setJavaScriptEnabled(true); // 자바스크립트 사용여부
            webView.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);
            webView.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE);
            webView.getSettings().setLoadsImagesAutomatically(true);

        } else if (major == 114) {
            webView.loadUrl("http://www.naver.com");
            webView.setWebChromeClient(new WebChromeClient());
            webView.setWebViewClient(new WebViewClientClass());
            webView.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE);

        }
    }

    private class WebViewClientClass extends WebViewClient {//페이지 이동
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Log.d("check URL",url);
            view.loadUrl(url);
            return true;
        }
    }


    // TODO : 근처 매장찾기 버튼을 통해 PopupActivity 로 화면 전환
    public void btn_StoreSearchClicked(View v){

        Intent intent = new Intent(this, PopupActivity.class);
        startActivity(intent);

    }


    @Override
    public void onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {
        switch (requestCode) {
            case PERMISSION_REQUEST_COARSE_LOCATION: {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    Log.d(TAG, "대략적인 위치 허가가 부여됨");
                } else {
                    final AlertDialog.Builder builder = new AlertDialog.Builder(this);
                    builder.setTitle("기능 제한");
                    builder.setMessage("위치 액세스 권한이 부여되지 않았기 때문에 이 앱은 백그라운드에서 비콘을 검색 할 수 없습니다.");
                    builder.setPositiveButton(android.R.string.ok, null);
                    builder.setOnDismissListener(new DialogInterface.OnDismissListener() {

                        @Override
                        public void onDismiss(DialogInterface dialog) {
                        }

                    });
                    builder.show();
                }
                return;
            }
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

}