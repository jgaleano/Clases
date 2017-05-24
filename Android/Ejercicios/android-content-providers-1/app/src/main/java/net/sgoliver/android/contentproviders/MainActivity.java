package net.sgoliver.android.contentproviders;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends Activity implements View.OnClickListener {

    List<String> listaDatos;
    ArrayAdapter<String> adapter;

    @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		Button insertar = (Button) findViewById(R.id.insertar);
		Button borrar = (Button) findViewById(R.id.borrar);
		Button consultar = (Button) findViewById(R.id.consultar);
		insertar.setOnClickListener(this);
		borrar.setOnClickListener(this);
		consultar.setOnClickListener(this);

        ListView lista = (ListView) findViewById(R.id.lista);
        listaDatos = new ArrayList<String>();
        adapter = new ArrayAdapter<String>(this,android.R.layout.simple_dropdown_item_1line, listaDatos);
        lista.setAdapter(adapter);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
			case R.id.consultar:
				consultar();
				break;
			case R.id.insertar:
				insertItem();
				break;
			case R.id.borrar:
				deleteAllRows();
				break;
		}
	}

	private void consultar() {
        listaDatos.clear();
		String[]  projection = new String[] {ClientesProvider.Clientes.COL_NOMBRE, ClientesProvider.Clientes.COL_EMAIL};
		Cursor cursor = getContentResolver().query(ClientesProvider.CONTENT_URI,projection,null, null, null);
		cursor.moveToFirst();
        while(!cursor.isAfterLast()) {
            String nombre = cursor.getString(0);
            String email = cursor.getString(1);
            listaDatos.add(nombre+" - "+email);
            cursor.moveToNext();
        }
        adapter.notifyDataSetChanged();
	}

	private void insertItem() {
		ContentValues values = new ContentValues();
		values.put(ClientesProvider.Clientes.COL_EMAIL, "Email");
		values.put(ClientesProvider.Clientes.COL_NOMBRE, "Nombre");
		getContentResolver().insert(ClientesProvider.CONTENT_URI, values);
	}

	private void deleteAllRows() {
		ContentResolver resolver = getContentResolver();
		String selection = null;
		String[] selectionArgs = null;
		int numberRowsDeleted = resolver.delete(	ClientesProvider.CONTENT_URI,selection,selectionArgs);
		Toast.makeText(this,"Se borraron todos los registros",Toast.LENGTH_LONG).show();
	}

}
