package co.julioc.peliculaslistview;

import android.graphics.Bitmap;
import android.os.Parcel;
import android.os.Parcelable;

import java.io.Serializable;

/**
 * Created by JulioC on 5/17/17.
 */

public class Pelicula implements Parcelable {

    private String title;
    private String id;
    private String summary;
    private String urlPhoto;
    private Bitmap photo;

    public Pelicula(String title, String id, String summary, String urlPhoto) {
        this.title = title;
        this.id = id;
        this.summary = summary;
        this.urlPhoto = urlPhoto;
    }

    public Pelicula(Parcel in){
        id = in.readString();
        title = in.readString();
        summary = in.readString();
        urlPhoto = in.readString();
        photo = (Bitmap) in.readValue(Bitmap.class.getClassLoader());
    }


    public String getTitle() {
        return title;
    }

    public String getSummary() {
        return summary;
    }

    public Bitmap getPhoto() {
        return photo;
    }

    public String getUrlPhoto() {
        return urlPhoto;
    }

    public String getId() {
        return id;
    }

    public void setPhoto(Bitmap photo) {
        this.photo = photo;
    }



    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(id);
        dest.writeString(title);
        dest.writeString(summary);
        dest.writeString(urlPhoto);
        dest.writeValue(photo);
    }

    public static final Parcelable.Creator<Pelicula> CREATOR = new Parcelable.Creator<Pelicula>(){
        public Pelicula createFromParcel(Parcel in){
            return new Pelicula(in);
        }

        public Pelicula[] newArray (int size){
            return new Pelicula[size];
        }
    };
}
