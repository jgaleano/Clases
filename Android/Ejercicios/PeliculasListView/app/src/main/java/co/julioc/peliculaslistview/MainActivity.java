package co.julioc.peliculaslistview;

import android.app.ProgressDialog;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SearchView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements PeliculasCallback, View.OnClickListener, AdapterView.OnItemClickListener {

    public static final String PELICULA_SELECCIONADA = "PELICULA_SELECCIONADA";

    private PeliculasAdapter peliculasAdapter;
    private List<Pelicula> peliculas;
    private ProgressDialog progressDialog;
    private SearchView searchViewTxt;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        searchViewTxt = (SearchView) findViewById(R.id.searchTxt);
        Button searchBtn = (Button) findViewById(R.id.searchBtn);
        searchBtn.setOnClickListener(this);

        peliculas = new ArrayList<>();
        ListView peliculasListView = (ListView) findViewById(R.id.peliculasListView);
        peliculasAdapter = new PeliculasAdapter(getApplicationContext(), peliculas);
        peliculasListView.setAdapter(peliculasAdapter);
        peliculasListView.setOnItemClickListener(this);
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    public void onFinishPeliculas(List<Pelicula> peliculaList) {
        if(progressDialog!=null && progressDialog.isShowing())
            progressDialog.dismiss();

        peliculas.addAll(peliculaList); //pelicuas = peliculaList
        peliculasAdapter.notifyDataSetChanged();
    }

    @Override
    public void onError(String mensaje) {

    }

    @Override
    public void onClick(View v) {
        if(!searchViewTxt.getQuery().toString().isEmpty()) {
            peliculas.clear();
            progressDialog = ProgressDialog.show(this,"Buscando peliculas","Por favor espere, buscando peliculas", true, true);
            SolicitudServicioAsyncTask solicitudServicioAsyncTask = new SolicitudServicioAsyncTask(this);
            solicitudServicioAsyncTask.execute(searchViewTxt.getQuery().toString());
        }
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        Pelicula peliculaSeleccionada = peliculas.get(position);
        Intent i = new Intent(this, DetalleActivity.class);
        Bundle bundle = new Bundle();
        bundle.putParcelable(PELICULA_SELECCIONADA, peliculaSeleccionada);
        i.putExtras(bundle);
        startActivity(i);
    }
}
