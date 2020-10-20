package com.example.td5;

import android.os.Bundle;
import android.provider.ContactsContract;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;

import java.util.ArrayList;
import java.util.List;

public class UserActivity extends AppCompatActivity {
    List<Contact> contacts = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user);

        RecyclerView rvContacts = (RecyclerView) findViewById(R.id.rvContacts);

        // Initialisation
        contacts.add(new Contact("HRAMCHI", "Hamza"));
        contacts.add(new Contact("MOUSAOUI", "Yahya"));
        contacts.add(new Contact("KHOUYA", "Ayoub"));
        contacts.add(new Contact("ATABIT", "Meryeme"));
        contacts.add(new Contact("EL HADRI", "Farah"));

        // Create adapter + initialisation
        ContactsAdapter adapter = new ContactsAdapter(contacts);
        rvContacts.setAdapter(adapter);
        rvContacts.setLayoutManager(new LinearLayoutManager(this));

    }
}
