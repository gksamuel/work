/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils.validators;

import java.util.Date;
import java.util.ResourceBundle;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

/**
 *
 * @author gachanja
 */
@FacesValidator("validator.JobsDateValidator")
public class JobsDate implements Validator {

    @Override
    public void validate(FacesContext fc, UIComponent component, Object value) throws ValidatorException {
        if (value == null || component.getAttributes().get("startdate") == null) {
            return;
        }
        Date toDate = (Date) value;
        Date fromDate = (Date) component.getAttributes().get("startdate");
        if (fromDate.after(toDate)) {
            FacesMessage message = new FacesMessage(ResourceBundle.getBundle("/Bundle").getString("toBeforeFrom"));
            message.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(message);
        }
    }
}
