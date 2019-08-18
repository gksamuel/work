/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import javax.inject.Named;
import work.objects.Applications;

/**
 *
 * @author gachanja
 */
@Named("rowClasses")
public class RowClasses {

    private String className = "dickhead";
    private Applications application;

    /**
     * Creates a new instance of RowClasses
     */
    public RowClasses() {
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Applications getApplication() {
        return application;
    }

    public void setApplication(Applications application) {
        this.application = application;
    }
}
