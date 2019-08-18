/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.*;
import org.apache.tika.Tika;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.hibernate.search.bridge.StringBridge;
import work.objects.Filetypes;

/**
 *
 * @author gachanja
 */
public class FileDigester implements StringBridge {

    private String uploadPath = ResourceBundle.getBundle("/Bundle").getString("uploadPath");
    private String content = "";
    private String ftype;
    private List<Filetypes> fileTypes;
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    public String objectToString(Object o) {

        String name = (String) o;
        File upload = new File(uploadPath + name);
        Metadata metadata = new Metadata();

        try {
            metadata.set(Metadata.RESOURCE_NAME_KEY, upload.getCanonicalPath());
            Tika tika = new Tika();
            content = tika.parseToString(upload);
            FileInputStream fileInputStream = new FileInputStream(uploadPath + name);

            ftype = (String) new Tika().detect(fileInputStream);

//TODO:: validate file type here em is throwing a nullpointer exception
//            Query query = em.createNamedQuery("Filetypes.findFiletype");



//            fileTypes = (List<Filetypes>) em.createNamedQuery("Filetypes.findFiletype").setParameter("filetype", ftype).getResultList();

//            if (fileTypes.size() > 0) {
//                content = tika.parseToString(upload);
//            }
            content = tika.parseToString(upload);
            fileInputStream.close();

        } catch (IOException ex) {
            Logger.getLogger(FileDigester.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TikaException ex) {
            Logger.getLogger(FileDigester.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException npe) {
            Logger.getLogger(FileDigester.class.getName()).log(Level.SEVERE, "FILE =  " + upload + " TYPE = " + ftype, npe);

        }

        return content;
    }
}
