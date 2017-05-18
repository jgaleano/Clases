package co.julioc.peliculaslistview;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import org.w3c.dom.Text;

/**
 * Created by JulioC on 5/18/17.
 */

public class DetalleActivity extends Activity {

    private Pelicula pelicula;
    private ImageView img;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.detalle);

        Bundle bundle = getIntent().getExtras();
        pelicula = bundle.getParcelable(MainActivity.PELICULA_SELECCIONADA);

        img = (ImageView) findViewById(R.id.detallePeliculaImg);
        TextView titulo = (TextView) findViewById(R.id.detalleTituloTxt);
        TextView resumen = (TextView) findViewById(R.id.detalleResumenTxt);

        img.setImageResource(R.mipmap.ic_launcher);
        titulo.setText(pelicula.getTitle());
        resumen.setText(pelicula.getSummary());
    }

    @Override
    protected void onResume() {
        super.onResume();

        if(pelicula.getPhoto()==null) {
            SolicitudImagenAsyncTask solicitudImagenAsyncTask = new SolicitudImagenAsyncTask(pelicula, null);
            solicitudImagenAsyncTask.execute(pelicula.getUrlPhoto());
        }
        else
            img.setImageBitmap(pelicula.getPhoto());
    }
}
