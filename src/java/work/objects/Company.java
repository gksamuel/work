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
import org.hibernate.search.annotations.ContainedIn;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "company", catalog = "work", schema = "public")
@SequenceGenerator(name = "company_id_seq", sequenceName = "company_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Company.findAll", query = "SELECT c FROM Company c"),
    @NamedQuery(name = "Company.findOne", query = "SELECT c FROM Company c where c.id = :id"),
    @NamedQuery(name = "Company.findCompany", query = "SELECT c FROM Company c where c.id = :id"),
    @NamedQuery(name = "Company.findEmail", query = "SELECT c FROM Company c where c.email = :email")
})
public class Company implements Serializable {

    private static final long serialVersionUID = -2877735319058138208L;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "companyid")
    private Collection<Accounts> accountsCollection;
    @OneToMany(mappedBy = "companyid")
    private Collection<Paypal> paypalCollection;
    @OneToMany(mappedBy = "companyid")
    private Collection<Contact> contactCollection;
    @OneToMany(mappedBy = "companyid")
    private Collection<Forms> formsCollection;
    @OneToMany(mappedBy = "companyid")
    private Collection<Mpesa> mpesaCollection;
    @Column(name = "expiry")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expiry;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "company_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Size(max = 100)
    @Column(name = "name", length = 100)
    private String name;
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Company email is not valid")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "email", length = 100)
    private String email;
    @Size(max = 15)
    @Column(name = "mobile", length = 15)
    private String mobile;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 15)
    @Column(name = "phone", length = 15)
    private String phone;
    @Size(max = 100)
    @Column(name = "website", length = 100)
    private String website;
    @Size(max = 100)
    @Column(name = "address", length = 100)
    private String address;
    @Size(max = 100)
    @Column(name = "location", length = 100)
    private String location;
    @Size(max = 100)
    @Column(name = "contactperson", length = 100)
    private String contactperson;
    @Size(max = 15)
    @Column(name = "contactmobile", length = 15)
    private String contactmobile;
    @Size(max = 100)
    @Column(name = "contactemail", length = 100)
    private String contactemail;
    @Size(max = 2147483647)
    @Column(name = "description", length = 2147483647)
    private String description;
    @Size(max = 100)
    @Column(name = "logo", length = 100)
    private String logo;
    @Size(max = 100)
    @Column(name = "applicationemail", length = 100)
    private String applicationemail;
    @OneToMany(mappedBy = "companyid")
    private Collection<Users> usersCollection;
        @ContainedIn
    @OneToMany(mappedBy = "companyid")
    private Collection<Jobs> jobsCollection;
    @JoinColumn(name = "statusid", referencedColumnName = "id")
    @ManyToOne
    private Status statusid;

    public Company() {
    }

    public Company(Integer id) {
        this.id = id;
    }

    public Company(Integer id, Date datemodified) {
        this.id = id;
        this.datemodified = datemodified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getContactperson() {
        return contactperson;
    }

    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
    }

    public String getContactmobile() {
        return contactmobile;
    }

    public void setContactmobile(String contactmobile) {
        this.contactmobile = contactmobile;
    }

    public String getContactemail() {
        return contactemail;
    }

    public void setContactemail(String contactemail) {
        this.contactemail = contactemail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getApplicationemail() {
        return applicationemail;
    }

    public void setApplicationemail(String applicationemail) {
        this.applicationemail = applicationemail;
    }

    @XmlTransient
    public Collection<Users> getUsersCollection() {
        return usersCollection;
    }

    public void setUsersCollection(Collection<Users> usersCollection) {
        this.usersCollection = usersCollection;
    }

    @XmlTransient
    public Collection<Jobs> getJobsCollection() {
        return jobsCollection;
    }

    public void setJobsCollection(Collection<Jobs> jobsCollection) {
        this.jobsCollection = jobsCollection;
    }

    public Status getStatusid() {
        return statusid;
    }

    public void setStatusid(Status statusid) {
        this.statusid = statusid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Company)) {
            return false;
        }
        Company other = (Company) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return name;
    }

    public Date getExpiry() {
        return expiry;
    }

    public void setExpiry(Date expiry) {
        this.expiry = expiry;
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    @XmlTransient
    public Collection<Mpesa> getMpesaCollection() {
        return mpesaCollection;
    }

    public void setMpesaCollection(Collection<Mpesa> mpesaCollection) {
        this.mpesaCollection = mpesaCollection;
    }

    @XmlTransient
    public Collection<Contact> getContactCollection() {
        return contactCollection;
    }

    public void setContactCollection(Collection<Contact> contactCollection) {
        this.contactCollection = contactCollection;
    }

    @XmlTransient
    public Collection<Forms> getFormsCollection() {
        return formsCollection;
    }

    public void setFormsCollection(Collection<Forms> formsCollection) {
        this.formsCollection = formsCollection;
    }

    @XmlTransient
    public Collection<Paypal> getPaypalCollection() {
        return paypalCollection;
    }

    public void setPaypalCollection(Collection<Paypal> paypalCollection) {
        this.paypalCollection = paypalCollection;
    }

    @XmlTransient
    public Collection<Accounts> getAccountsCollection() {
        return accountsCollection;
    }

    public void setAccountsCollection(Collection<Accounts> accountsCollection) {
        this.accountsCollection = accountsCollection;
    }
}
