package com.example.td2.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.td2.R;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView message = (TextView) findViewById(R.id.hello);
        message.setText("Choisir l'exercice");

        Button b1 = (Button) findViewById(R.id.ex01);
        b1.setText("Exercice 1");
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
            }
        });

        Button b2 = (Button) findViewById(R.id.ex02);
        b2.setText("Exercice 2");


    }
}