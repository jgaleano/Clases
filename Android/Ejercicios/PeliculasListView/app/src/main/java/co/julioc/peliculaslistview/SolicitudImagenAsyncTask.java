package co.julioc.peliculaslistview;

import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.widget.ImageView;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

/**
 * Created by JulioC on 5/18/17.
 */

public class SolicitudImagenAsyncTask extends AsyncTask<String,Void,Bitmap> {

    private PeliculasAdapter adapter;
    private Pelicula pelicula;

    public SolicitudImagenAsyncTask(Pelicula pelicula, PeliculasAdapter adapter) {
        this.adapter = adapter;
        this.pelicula = pelicula;
    }

    @Override
    protected Bitmap doInBackground(String... params) {
        String imgPath = params[0];
        SolicitudServicio solicitudServicio = new SolicitudServicio();

        Bitmap imgBitmap = null;
        try {
            imgBitmap = solicitudServicio.getImagenPelicula(imgPath);
            return imgBitmap;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    protected void onPostExecute(Bitmap bitmap) {
        if(bitmap!=null) {
            pelicula.setPhoto(bitmap);
            adapter.notifyDataSetChanged();
        }
    }
}
