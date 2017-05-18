package co.julioc.peliculaslistview;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by JulioC on 5/17/17.
 */

public class SolicitudServicio {

    private static final String URL_SEARCH_PELICULAS = "https://api.themoviedb.org/3/search/movie?api_key=c039b854e11fae44ee49bde01bad3b74&language=es&page=1&include_adult=false&query=";
    private static final String URL_IMAGEN_PELICULA = "https://image.tmdb.org/t/p/w500/";

    public JSONObject getListaPeliculas(String parametro) throws IOException, JSONException {
        HttpURLConnection urlConnection = null;
        URL url = new URL(URL_SEARCH_PELICULAS+parametro);
        urlConnection = (HttpURLConnection) url.openConnection();
        urlConnection.setRequestMethod("GET");
        urlConnection.setDoOutput(true);
        urlConnection.connect();
        return convertToJSONObject(convertStremToString(url.openStream()));
    }

    public Bitmap getImagenPelicula(String urlPath) throws IOException {
        HttpURLConnection urlConnection = null;
        URL url = new URL(URL_IMAGEN_PELICULA+urlPath);
        urlConnection = (HttpURLConnection) url.openConnection();
        urlConnection.setRequestMethod("GET");
        urlConnection.setDoOutput(true);
        urlConnection.connect();

        InputStream is = url.openStream();
        Bitmap decoded = null;
        if(is!=null) {
            Bitmap original = BitmapFactory.decodeStream(url.openStream());
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            original.compress(Bitmap.CompressFormat.PNG, 80, out);
            decoded = getResizedBitmap(original, 400);
        }
        return decoded;
    }

    private String convertStremToString(InputStream in) throws IOException {
        InputStreamReader inputStreamReader = new InputStreamReader(in);
        BufferedReader bf = new BufferedReader(inputStreamReader);
        String line;
        StringBuilder sb = new StringBuilder();
        while((line=bf.readLine())!=null) {
            sb.append(line);
        }
        bf.close();
        return sb.toString();
    }

    private JSONObject convertToJSONObject(String respuesta) throws JSONException {
        return new JSONObject(respuesta);
    }

    public Bitmap getResizedBitmap(Bitmap image, int maxSize) {
        int width = image.getWidth();
        int height = image.getHeight();

        float bitmapRatio = (float) width / (float) height;
        if (bitmapRatio > 1) {
            width = maxSize;
            height = (int) (width / bitmapRatio);
        } else {
            height = maxSize;
            width = (int) (height * bitmapRatio);
        }

        return Bitmap.createScaledBitmap(image, width, height, true);
    }



}
