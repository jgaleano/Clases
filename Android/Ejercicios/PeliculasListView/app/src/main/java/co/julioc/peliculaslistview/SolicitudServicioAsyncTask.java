package co.julioc.peliculaslistview;

import android.os.AsyncTask;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by JulioC on 5/17/17.
 */

public class SolicitudServicioAsyncTask extends AsyncTask<String, String, List<Pelicula>> {

    public PeliculasCallback callback;

    public SolicitudServicioAsyncTask(PeliculasCallback callback) {
        this.callback = callback;
    }

    @Override
    protected void onPreExecute() {
    }

    @Override
    protected List<Pelicula> doInBackground(String... params) {
        String searchParameter = params[0];
        SolicitudServicio solicitudServicio = new SolicitudServicio();


        JSONObject jsonRespuesta = null;
        try {
            jsonRespuesta = solicitudServicio.getListaPeliculas(searchParameter);
            return obtenerListadoComoPeliculas(jsonRespuesta);
        } catch (IOException | JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    protected void onPostExecute(List<Pelicula> peliculaList) {
        if(peliculaList!=null) {
            callback.onFinishPeliculas(peliculaList);
        }
        else {
            callback.onError("Fallo la conexion!");
        }
    }

    private List<Pelicula> obtenerListadoComoPeliculas(JSONObject jsonRespuesta) throws JSONException {
        List<Pelicula> peliculaList = new ArrayList<>();
        JSONArray jsonArrayPeliculas = jsonRespuesta.optJSONArray("results");

        for ( int i=0; i<jsonArrayPeliculas.length(); i++) {
            JSONObject jsonPelicula = jsonArrayPeliculas.getJSONObject(i);
            String titulo = jsonPelicula.getString("title");
            String resumen = jsonPelicula.getString("overview");
            String urlFoto = jsonPelicula.getString("poster_path");
            String id = jsonPelicula.getString("id");
            Pelicula pelicula = new Pelicula(titulo,id,resumen,urlFoto);
            peliculaList.add(pelicula);
        }
        return peliculaList;
    }
}
