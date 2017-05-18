package co.julioc.peliculaslistview;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

/**
 * Created by JulioC on 5/17/17.
 */

public class PeliculasAdapter extends ArrayAdapter<Pelicula> {

    private final LayoutInflater inflater;

    public PeliculasAdapter(Context context, List<Pelicula> peliculasArray) {
        super(context, R.layout.list_item, peliculasArray);
        inflater = LayoutInflater.from(context);
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        if(convertView==null) {
            convertView = inflater.inflate(R.layout.list_item, null);
        }

        ImageView imgView = (ImageView) convertView.findViewById(R.id.itemImg);
        TextView tituloTxt = (TextView) convertView.findViewById(R.id.itemTitulo);
        TextView tipoTxt = (TextView) convertView.findViewById(R.id.itemType);

        Pelicula pelicula = getItem(position);
        tituloTxt.setText(pelicula.getTitle());
        tipoTxt.setText(pelicula.getId());

        if(pelicula.getPhoto()==null && pelicula.getUrlPhoto()!=null && !pelicula.getUrlPhoto().equals("null")) {
            SolicitudImagenAsyncTask solicitudImagenAsyncTask = new SolicitudImagenAsyncTask(pelicula, this);
            solicitudImagenAsyncTask.execute(pelicula.getUrlPhoto());
        }
        else if(pelicula.getPhoto()!=null)
            imgView.setImageBitmap(pelicula.getPhoto());
        else
            imgView.setImageResource(R.mipmap.ic_launcher);

        return convertView;
    }
}
