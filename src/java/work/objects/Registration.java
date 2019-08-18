/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Date;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import javax.faces.bean.ManagedProperty;

import javax.faces.context.FacesContext;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author gachanja
 */
@Named("Registration")
@SessionScoped
@Entity
@Table(name = "registration", catalog = "work", schema = "public")
@SequenceGenerator(sequenceName = "registration_id_seq", name = "registration_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Registration.findAll", query = "SELECT r FROM Registration r"),
    @NamedQuery(name = "Registration.findEmail", query = "SELECT r FROM Registration r where r.email = :email"),
    @NamedQuery(name = "Registration.findRegistration", query = "SELECT r FROM Registration r where r.username = :username and r.code = :code"),
    @NamedQuery(name = "Registration.findUsername", query = "SELECT r FROM Registration r where r.username = :username")
})
public class Registration implements Serializable {

    private static final long serialVersionUID = -6143222135332985798L;
    @Column(name = "createdate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdate = new Date();
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "registration_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "The email you have entered is not valid")//if the field contains email address consider using this annotation to enforce field validation
//    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "The email you have entered is not valid")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "email", length = 100)
    private String email;
    @Size(max = 100)
    @Column(name = "username", length = 100)
    private String username;
    @Size(min = 5, max = 100, message = "Password must be at least 5 characters")
    @Column(name = "password", length = 100)
    private String password;
    @Size(max = 100)
    @Column(name = "passphrase", length = 100)
    private String passphrase;
    @ManagedProperty(value = "#{code}")
    @Size(max = 6)
    @Column(name = "code", length = 6)
    private String code;
    @JoinColumn(name = "groupid", referencedColumnName = "id")
    @ManyToOne
    private Groups groupid;

    public Registration() {
    }

    public Registration(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassphrase() {
        return passphrase;
    }

    public void setPassphrase(String passphrase) {
        this.passphrase = passphrase;
    }

    public String getCode() {
        if (FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().containsKey("asdewedhyfse")) {
            code = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("asdewedhyfse");
        }
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Groups getGroupid() {
        return groupid;
    }

    public void setGroupid(Groups groupid) {
        this.groupid = groupid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Registration)) {
            return false;
        }
        Registration other = (Registration) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Registration[ id=" + id + " ]";
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }
}
