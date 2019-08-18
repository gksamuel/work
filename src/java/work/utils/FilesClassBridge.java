/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.tika.Tika;
import org.apache.tika.exception.TikaException;
import org.hibernate.search.bridge.FieldBridge;
import org.hibernate.search.bridge.LuceneOptions;
import work.facade.FilesFacade;
import work.objects.Files;
import work.objects.Filetypes;

/**
 *
 * @author gachanja
 */
public class FilesClassBridge extends FilesFacade implements FieldBridge {

    private String uploadPath = ResourceBundle.getBundle("/Bundle").getString("uploadPath");
    private String content = "";

    @Override
    public void set(String name, Object value, Document document, LuceneOptions luceneOptions) {
        Files file = (Files) value;
        File upload = new File(uploadPath + file.getFilename());
        try {
            Tika tika = new Tika();
            content = tika.parseToString(upload);
        } catch (IllegalStateException | NullPointerException | IOException | TikaException ex) {
            Logger.getLogger(FilesClassBridge.class.getName()).log(Level.SEVERE, null, ex);
        }

        Field field = new Field("files_filename", file.getFilename(), luceneOptions.getStore(), luceneOptions.getIndex(), luceneOptions.getTermVector());
        document.add(field);
        field = new Field("files_description", file.getDescription(), luceneOptions.getStore(), luceneOptions.getIndex(), luceneOptions.getTermVector());
        document.add(field);
        field = new Field("files_metadata", content, luceneOptions.getStore(), luceneOptions.getIndex(), luceneOptions.getTermVector());
        document.add(field);

    }
}
