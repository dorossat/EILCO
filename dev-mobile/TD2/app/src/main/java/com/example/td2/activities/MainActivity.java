package com.example.td2.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import com.example.td2.R;

public class MainActivity extends AppCompatActivity {
    private Context context = this;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        TextView message = (TextView) findViewById(R.id.hello);
        message.setText("Choisir l'exercice");

        Button b1 = (Button) findViewById(R.id.ex01);
        b1.setText("Exercice 1");
        b1.setOnClickListener(view -> {
            Intent intent = new Intent(context, RepasActivity.class);
            startActivity(intent);
        });

        Button b2 = (Button) findViewById(R.id.ex02);
        b2.setText("Exercice 2");
        b2.setOnClickListener(view -> {
            Intent intent = new Intent(context, MeteoActivity.class);
            startActivity(intent);
        });


    }
}