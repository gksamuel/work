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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.search.annotations.*;

/**
 *
 * @author gachanja
 */
@Entity
@Indexed
@Table(name = "jobs", catalog = "work", schema = "public")
@SequenceGenerator(name = "jobs_id_seq", sequenceName = "jobs_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Jobs.findAll", query = "SELECT j FROM Jobs j order by j.id desc"),
    @NamedQuery(name = "Jobs.findOne", query = "SELECT j FROM Jobs j left join fetch j.abuseCollection where  j.id = :id"),
    @NamedQuery(name = "Jobs.findCompanyJobs", query = "SELECT j FROM Jobs j where j.companyid =  :companyid order by j.id DESC"),
    @NamedQuery(name = "Jobs.findAccountJobs", query = "SELECT j FROM Jobs j where j.companyid =  :companyid and j.accountid = :accountid order by j.id DESC"),
    @NamedQuery(name = "Jobs.findCompanyJobsCount", query = "SELECT count(j.id) FROM Jobs j where j.companyid =  :companyid"),
    @NamedQuery(name = "Jobs.findJobsCount", query = "SELECT count(j.id) FROM Jobs j"),
    @NamedQuery(name = "Jobs.findUserJobsCount", query = "SELECT count(j.id) FROM Jobs j where j.userid =  :userid"),
    @NamedQuery(name = "Jobs.findUserJobs", query = "SELECT j FROM Jobs j where j.userid =  :userid order by j.id DESC"),
    @NamedQuery(name = "Jobs.searchReference", query = "SELECT j FROM Jobs j where j.referenceno =  :referenceno order by j.id DESC")})
public class Jobs implements Serializable {

    private static final long serialVersionUID = -6766107792617870561L;
    @JoinColumn(name = "accountid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Accounts accountid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jobid")
    private Collection<Abuse> abuseCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jobid")
    private Collection<Tellafriend> tellafriendCollection;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "startdate")
    @Temporal(TemporalType.DATE)
    private Date startdate;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "enddate")
    @Temporal(TemporalType.DATE)
    private Date enddate;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.YES)
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "jobs_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.YES)
    @Size(max = 20)
    @Column(name = "referenceno", length = 20)
    private String referenceno;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Size(max = 100)
    @Column(name = "title", length = 100)
    private String title;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Size(max = 255)
    @Column(name = "summary", length = 255)
    private String summary;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Size(max = 2147483647)
    @Column(name = "jobdescription", length = 2147483647)
    private String jobdescription;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Size(max = 2147483647)
    @Column(name = "qualifications", length = 2147483647)
    private String qualifications;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Size(max = 2147483647)
    @Column(name = "experience", length = 2147483647)
    private String experience;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Size(max = 2147483647)
    @Column(name = "instructions", length = 2147483647)
    private String instructions;
//    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "email", length = 100, nullable = true)
    private String email;
    @Column(name = "maxapplications")
    private Integer maxapplications;
    @Size(max = 100)
    @Column(name = "attachment", length = 100)
    private String attachment;
//    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
//    @Size(max = 100)
//    @Column(name = "salary", length = 100)
//    private String salary;
    @JoinColumn(name = "salaryid", referencedColumnName = "id")
    @ManyToOne
    private Salary salaryid;
    @JoinColumn(name = "categoryid", referencedColumnName = "id")
    @ManyToOne
    private Category categoryid;
    @IndexedEmbedded(prefix = "company_", depth = 1)
    @JoinColumn(name = "companyid", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Company companyid;
    @JoinColumn(name = "userid", referencedColumnName = "id")
    @ManyToOne
    private Users userid;
    @JoinColumn(name = "positionsid", referencedColumnName = "id")
    @ManyToOne
    private Positions positionsid;
    @JoinColumn(name = "formid", referencedColumnName = "id", nullable = true)
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    private Forms formid;
    @OneToMany(mappedBy = "jobid", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Thirdshortlist> thirdshortlistCollection;
    @OneToMany(mappedBy = "jobid")
    private Collection<Secondshortlist> secondshortlistCollection;
    @OneToMany(mappedBy = "jobid")
    private Collection<Firstshortlist> firstshortlistCollection;
    @OneToMany(mappedBy = "jobid", fetch = FetchType.LAZY)
    private Collection<Applications> applicationsCollection;

    public Jobs() {
    }

    public Jobs(Integer id) {
        this.id = id;
    }

    public Jobs(Integer id, Date datemodified) {
        this.id = id;
        this.datemodified = datemodified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReferenceno() {
        return referenceno;
    }

    public void setReferenceno(String referenceno) {
        this.referenceno = referenceno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getJobdescription() {
        return jobdescription;
    }

    public void setJobdescription(String jobdescription) {
        this.jobdescription = jobdescription;
    }

    public String getQualifications() {
        return qualifications;
    }

    public void setQualifications(String qualifications) {
        this.qualifications = qualifications;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getMaxapplications() {
        return maxapplications;
    }

    public void setMaxapplications(Integer maxapplications) {
        this.maxapplications = maxapplications;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public Positions getPositionsid() {
        return positionsid;
    }

    public void setPositionsid(Positions positionsid) {
        this.positionsid = positionsid;
    }

    public Forms getFormid() {
        return formid;
    }

    public void setFormid(Forms formid) {
        this.formid = formid;
    }

    public Salary getSalaryid() {
        return salaryid;
    }

    public void setSalaryid(Salary salaryid) {
        this.salaryid = salaryid;
    }

    public Category getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Category categoryid) {
        this.categoryid = categoryid;
    }

    public Company getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Company companyid) {
        this.companyid = companyid;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Jobs)) {
            return false;
        }
        Jobs other = (Jobs) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Jobs[ id=" + id + " ]";
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    @XmlTransient
    public Collection<Tellafriend> getTellafriendCollection() {
        return tellafriendCollection;
    }

    public void setTellafriendCollection(Collection<Tellafriend> tellafriendCollection) {
        this.tellafriendCollection = tellafriendCollection;
    }

    @XmlTransient
    public Collection<Abuse> getAbuseCollection() {
        return abuseCollection;
    }

    public void setAbuseCollection(Collection<Abuse> abuseCollection) {
        this.abuseCollection = abuseCollection;
    }

    public Accounts getAccountid() {
        return accountid;
    }

    public void setAccountid(Accounts accountid) {
        this.accountid = accountid;
    }
}
