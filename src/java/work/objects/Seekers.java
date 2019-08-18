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
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.FilterCacheModeType;
import org.hibernate.search.annotations.FullTextFilterDef;
import org.hibernate.search.annotations.FullTextFilterDefs;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.hibernate.search.annotations.Store;
import work.utils.ApplicantsFilter;

/**
 *
 * @author gachanja
 */
@Entity
@Indexed
@FullTextFilterDefs({
    @FullTextFilterDef(name = "jobApplicants", impl = ApplicantsFilter.class, cache = FilterCacheModeType.NONE)
})
@Table(name = "seekers", catalog = "work", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"email"}),
    @UniqueConstraint(columnNames = {"username"})})
@SequenceGenerator(name = "seekers_id_seq", sequenceName = "seekers_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Seekers.findAll", query = "SELECT s FROM Seekers s"),
    @NamedQuery(name = "Seekers.findEmail", query = "SELECT s FROM Seekers s where s.email = :email"),
    @NamedQuery(name = "Seekers.findId", query = "SELECT s FROM Seekers s where s.id = :id"),
    @NamedQuery(name = "Seekers.findByUsernameEmail", query = "SELECT s FROM Seekers s where s.username = :username and s.email = :email"),
    @NamedQuery(name = "Seekers.findUsername", query = "SELECT s FROM Seekers s where s.username = :username")
})
public class Seekers implements Serializable {

    private static final long serialVersionUID = -7574610115096021587L;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Paypal> paypalCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "seekerid")
    private Collection<Abuse> abuseCollection;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Tiprate> tiprateCollection;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Contact> contactCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "seekerid")
    private Collection<Tellafriend> tellafriendCollection;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Mpesa> mpesaCollection;
    @Basic(optional = false)
    @NotNull
    @Column(name = "expiry", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date expiry;
    @Column(name = "dateofbirth")
    @Temporal(TemporalType.DATE)
    private Date dateofbirth;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datecreated", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datecreated;
    @JoinColumn(name = "groupid", referencedColumnName = "id")
    @ManyToOne
    private Groups groupid;
    @Field(index = Index.YES, analyze = Analyze.NO, store = Store.YES)
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seekers_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "username", nullable = false, length = 30)
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 64, max = 64)
    @Column(name = "password", nullable = false, length = 64)
    private String password;
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "email", nullable = false, length = 100)
    private String email;
    @Size(max = 12)
    @Column(name = "mobile", length = 12)
    private String mobile;
    @Size(max = 12)
    @Column(name = "othernumber", length = 12)
    private String othernumber;
    @Size(max = 100)
    @Column(name = "photo", length = 100)
    private String photo;
    @Size(max = 15)
    @Column(name = "firstname", length = 15)
    private String firstname;
    @Size(max = 15)
    @Column(name = "lastname", length = 15)
    private String lastname;
    @Size(max = 15)
    @Column(name = "middlename", length = 15)
    private String middlename;
    @Size(max = 50)
    @Column(name = "address", length = 50)
    private String address;
    @Column(name = "gender")
    private Boolean gender;
    @Size(max = 100)
    @Column(name = "website", length = 100)
    private String website;
    @Size(max = 20)
    @Column(name = "maritalstatus")
    private String maritalstatus;
    @Size(max = 12)
    @Column(name = "idnumber", length = 12)
    private String idnumber;
    @Size(max = 20)
    @Column(name = "pinnumber", length = 20)
    private String pinnumber;
    @Size(max = 20)
    @Column(name = "passport", length = 20)
    private String passport;
    @Size(max = 20)
    @Column(name = "driverslicence", length = 20)
    private String driverslicence;
    @Column(name = "points")
    private Integer points;
    @IndexedEmbedded(prefix = "work_", depth = 1)
    @OneToMany(mappedBy = "seekerid", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Work> workCollection;
    @IndexedEmbedded(prefix = "files_")
    @OneToMany(mappedBy = "seekerid", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Files> filesCollection;
    @IndexedEmbedded(prefix = "coverletters_")
    @OneToMany(mappedBy = "seekerid", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Coverletters> coverlettersCollection;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Thirdshortlist> thirdshortlistCollection;
    @IndexedEmbedded(prefix = "pages_")
    @OneToMany(mappedBy = "seekerid", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Pages> pagesCollection;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Secondshortlist> secondshortlistCollection;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Firstshortlist> firstshortlistCollection;
    @IndexedEmbedded(prefix = "education_")
    @OneToMany(mappedBy = "seekerid", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Education> educationCollection;
    @JoinColumn(name = "statusid", referencedColumnName = "id")
    @ManyToOne
    private Status statusid;
    @JoinColumn(name = "salaryid", referencedColumnName = "id")
    @ManyToOne
    private Salary salaryid;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Applications> applicationsCollection;
    @OneToMany(mappedBy = "seekerid")
    private Collection<Formanswers> formanswersCollection;

    public Seekers() {
    }

    public Seekers(Integer id) {
        this.id = id;
    }

    public Seekers(Integer id, String username, String password, Date expiry, String email, Date datemodified) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.expiry = expiry;
        this.email = email;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getOthernumber() {
        return othernumber;
    }

    public void setOthernumber(String othernumber) {
        this.othernumber = othernumber;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getMiddlename() {
        return middlename;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getMaritalstatus() {
        return maritalstatus;
    }

    public void setMaritalstatus(String maritalstatus) {
        this.maritalstatus = maritalstatus;
    }

    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber;
    }

    public String getPinnumber() {
        return pinnumber;
    }

    public void setPinnumber(String pinnumber) {
        this.pinnumber = pinnumber;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getDriverslicence() {
        return driverslicence;
    }

    public void setDriverslicence(String driverslicence) {
        this.driverslicence = driverslicence;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    @XmlTransient
    public Collection<Work> getWorkCollection() {
        return workCollection;
    }

    public void setWorkCollection(Collection<Work> workCollection) {
        this.workCollection = workCollection;
    }

    @XmlTransient
    public Collection<Files> getFilesCollection() {
        return filesCollection;
    }

    public void setFilesCollection(Collection<Files> filesCollection) {
        this.filesCollection = filesCollection;
    }

    @XmlTransient
    public Collection<Coverletters> getCoverlettersCollection() {
        return coverlettersCollection;
    }

    public void setCoverlettersCollection(Collection<Coverletters> coverlettersCollection) {
        this.coverlettersCollection = coverlettersCollection;
    }

    @XmlTransient
    public Collection<Thirdshortlist> getThirdshortlistCollection() {
        return thirdshortlistCollection;
    }

    public void setThirdshortlistCollection(Collection<Thirdshortlist> thirdshortlistCollection) {
        this.thirdshortlistCollection = thirdshortlistCollection;
    }

    @XmlTransient
    public Collection<Pages> getPagesCollection() {
        return pagesCollection;
    }

    public void setPagesCollection(Collection<Pages> pagesCollection) {
        this.pagesCollection = pagesCollection;
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
    public Collection<Education> getEducationCollection() {
        return educationCollection;
    }

    public void setEducationCollection(Collection<Education> educationCollection) {
        this.educationCollection = educationCollection;
    }

    public Status getStatusid() {
        return statusid;
    }

    public void setStatusid(Status statusid) {
        this.statusid = statusid;
    }

    public Salary getSalaryid() {
        return salaryid;
    }

    public void setSalaryid(Salary salaryid) {
        this.salaryid = salaryid;
    }

    @XmlTransient
    public Collection<Applications> getApplicationsCollection() {
        return applicationsCollection;
    }

    public void setApplicationsCollection(Collection<Applications> applicationsCollection) {
        this.applicationsCollection = applicationsCollection;
    }

    @XmlTransient
    public Collection<Formanswers> getFormanswersCollection() {
        return formanswersCollection;
    }

    public void setFormanswersCollection(Collection<Formanswers> formanswersCollection) {
        this.formanswersCollection = formanswersCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Seekers)) {
            return false;
        }
        Seekers other = (Seekers) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return username;
    }

    public Groups getGroupid() {
        return groupid;
    }

    public void setGroupid(Groups groupid) {
        this.groupid = groupid;
    }

    public Date getExpiry() {
        return expiry;
    }

    public void setExpiry(Date expiry) {
        this.expiry = expiry;
    }

    public Date getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(Date dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    public Date getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(Date datecreated) {
        this.datecreated = datecreated;
    }

    @XmlTransient
    public Collection<Mpesa> getMpesaCollection() {
        return mpesaCollection;
    }

    public void setMpesaCollection(Collection<Mpesa> mpesaCollection) {
        this.mpesaCollection = mpesaCollection;
    }

    @XmlTransient
    public Collection<Tellafriend> getTellafriendCollection() {
        return tellafriendCollection;
    }

    public void setTellafriendCollection(Collection<Tellafriend> tellafriendCollection) {
        this.tellafriendCollection = tellafriendCollection;
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

    @XmlTransient
    public Collection<Abuse> getAbuseCollection() {
        return abuseCollection;
    }

    public void setAbuseCollection(Collection<Abuse> abuseCollection) {
        this.abuseCollection = abuseCollection;
    }

    @XmlTransient
    public Collection<Paypal> getPaypalCollection() {
        return paypalCollection;
    }

    public void setPaypalCollection(Collection<Paypal> paypalCollection) {
        this.paypalCollection = paypalCollection;
    }
}
