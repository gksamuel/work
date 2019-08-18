/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.util.Iterator;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Filetypes;

/**
 *
 * @author gachanja
 */
public class FileValidator {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    public Boolean checkFileType(String contentType, String module) {
        Boolean isValid = false;
        String query = "Filetypes.findCvs";;
        if (module.compareTo("files") == 0) {
            query = "Filetypes.findUploads";
        }
        Iterator i = em.createNamedQuery(query).getResultList().iterator();
        while (i.hasNext()) {
            Filetypes filetype = (Filetypes) i.next();
            if (filetype.getFiletype().compareTo(contentType) == 0) {
                isValid = true;
            }
        }
        return isValid;
    }
}
