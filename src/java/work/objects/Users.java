/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "users", catalog = "work", schema = "public")
@SequenceGenerator(name = "users_id_seq", sequenceName = "users_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findEmail", query = "SELECT u FROM Users u where u.email = :email"),
    @NamedQuery(name = "Users.findCompanyUsers", query = "SELECT u FROM Users u where u.companyid = :companyid order by u.id desc"),
    @NamedQuery(name = "Users.findByUsernameEmail", query = "SELECT u FROM Users u where u.username = :username and u.email = :email"),
    @NamedQuery(name = "Users.findByUsernamePassword", query = "SELECT u FROM Users u where u.username = :username and u.password = :password"),
    @NamedQuery(name = "Users.findCode", query = "SELECT u FROM Users u where u.password = :password"),
    @NamedQuery(name = "Users.findUsername", query = "SELECT u FROM Users u where u.username = :username")})
public class Users implements Serializable {

    private static final long serialVersionUID = 799075017600292743L;
    @JoinColumn(name = "accountid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Accounts accountid;
    @OneToMany(mappedBy = "userid")
    private Collection<Tiprate> tiprateCollection;
    @OneToMany(mappedBy = "userid")
    private Collection<Contact> contactCollection;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "users_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Size(max = 20)
    @Column(name = "username", length = 20)
    private String username;
    @Size(min = 5, max = 64, message = "Password must be at least 5 characters")
    @Column(name = "password", length = 64)
    private String password;
    @Size(max = 50)
    @Column(name = "name", length = 50)
    private String name;
    @Size(max = 100)
    @Column(name = "description", length = 100)
    private String description;
    @Column(name = "admin")
    private Boolean admin;
    @Column(name = "active")
    private Boolean active;
    @JoinColumn(name = "groupid", referencedColumnName = "id")
    @ManyToOne
    private Groups groupid;
    @JoinColumn(name = "companyid", referencedColumnName = "id")
    @ManyToOne
    private Company companyid;
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "email", nullable = false, length = 100)
    private String email;
    @OneToMany(mappedBy = "userid")
    private Collection<Thirdshortlist> thirdshortlistCollection;
    @OneToMany(mappedBy = "userid")
    private Collection<Secondshortlist> secondshortlistCollection;
    @OneToMany(mappedBy = "userid")
    private Collection<Firstshortlist> firstshortlistCollection;
    @OneToMany(mappedBy = "userid")
    private Collection<Applications> applicationsCollection;
    @OneToMany(mappedBy = "userid")
    private Collection<Jobs> jobsCollection;
    @OneToMany(mappedBy = "userid")
    private Collection<Forms> formsCollection;
    @OneToMany(mappedBy = "userid")
    private Collection<Notes> notesCollection;

    public Users() {
    }

    public Users(Integer id) {
        this.id = id;
    }

    public Users(Integer id, Date datemodified) {
        this.id = id;
        this.datemodified = datemodified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Company getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Company companyid) {
        this.companyid = companyid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @XmlTransient
    public Collection<Thirdshortlist> getThirdshortlistCollection() {
        return thirdshortlistCollection;
    }

    public void setThirdshortlistCollection(Collection<Thirdshortlist> thirdshortlistCollection) {
        this.thirdshortlistCollection = thirdshortlistCollection;
    }

    @XmlTransient
    public Collection<Secondshortlist> getSecondshortlistCollection() {
        return secondshortlistCollection;
    }

    public void setSecondshortlistCollection(Collection<Secondshortlist> secondshortlistCollection) {
        this.secondshortlistCollection = secondshortlistCollection;
    }

    @XmlTransient
    public Collection<Firstshortlist> getFirstshortlistCollection() {
        return firstshortlistCollection;
    }

    public void setFirstshortlistCollection(Collection<Firstshortlist> firstshortlistCollection) {
        this.firstshortlistCollection = firstshortlistCollection;
    }

    @XmlTransient
    public Collection<Applications> getApplicationsCollection() {
        return applicationsCollection;
    }

    public void setApplicationsCollection(Collection<Applications> applicationsCollection) {
        this.applicationsCollection = applicationsCollection;
    }

    @XmlTransient
    public Collection<Jobs> getJobsCollection() {
        return jobsCollection;
    }

    @XmlTransient
    public Collection<Forms> getFormsCollection() {
        return formsCollection;
    }

    public void setFormsCollection(Collection<Forms> formsCollection) {
        this.formsCollection = formsCollection;
    }

    public void setJobsCollection(Collection<Jobs> jobsCollection) {
        this.jobsCollection = jobsCollection;
    }

    public Groups getGroupid() {
        return groupid;
    }

    public void setGroupid(Groups groupid) {
        this.groupid = groupid;
    }

    @XmlTransient
    public Collection<Notes> getNotesCollection() {
        return notesCollection;
    }

    public void setNotesCollection(Collection<Notes> notesCollection) {
        this.notesCollection = notesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Users[ id=" + id + " ]";
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    @XmlTransient
    public Collection<Contact> getContactCollection() {
        return contactCollection;
    }

    public void setContactCollection(Collection<Contact> contactCollection) {
        this.contactCollection = contactCollection;
    }

    @XmlTransient
    public Collection<Tiprate> getTiprateCollection() {
        return tiprateCollection;
    }

    public void setTiprateCollection(Collection<Tiprate> tiprateCollection) {
        this.tiprateCollection = tiprateCollection;
    }

    public Accounts getAccountid() {
        return accountid;
    }

    public void setAccountid(Accounts accountid) {
        this.accountid = accountid;
    }
}
