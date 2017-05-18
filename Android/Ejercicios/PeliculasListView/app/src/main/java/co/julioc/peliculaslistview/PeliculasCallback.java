package co.julioc.peliculaslistview;

import java.util.List;

/**
 * Created by JulioC on 5/17/17.
 */

public interface PeliculasCallback {
    void onFinishPeliculas(List<Pelicula> peliculaList);
    void onError(String mensaje);
}
