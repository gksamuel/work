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

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "applications", catalog = "work", schema = "public")
@SequenceGenerator(name = "applications_id_seq", sequenceName = "applications_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Applications.findAll", query = "SELECT a FROM Applications a"),
    @NamedQuery(name = "Applications.findJobApplications", query = "SELECT a FROM Applications a where a.jobid = :jobid order by a.id"),
    @NamedQuery(name = "Applications.findFilteredApplications", query = "SELECT a FROM Applications a where a.jobid = :jobid and a.viewed = :viewed order by a.id"),
    @NamedQuery(name = "Applications.findFirstApplication", query = "SELECT a FROM Applications a where a.jobid = :jobid order by a.id"),
    @NamedQuery(name = "Applications.findLastApplication", query = "SELECT a FROM Applications a where a.jobid = :jobid order by a.id desc"),
    @NamedQuery(name = "Applications.findNextApplication", query = "SELECT a FROM Applications a where a.jobid = :jobid and a.id > :id order by a.id"),
    @NamedQuery(name = "Applications.findSameApplication", query = "SELECT a FROM Applications a where a.jobid = :jobid and a.id = :id order by a.id"),
    @NamedQuery(name = "Applications.findPreviousApplication", query = "SELECT a FROM Applications a where a.jobid = :jobid and a.id < :id order by a.id desc"),
    @NamedQuery(name = "Applications.findSeekerID", query = "SELECT a.seekerid FROM Applications a where a.jobid = :jobid"),
    @NamedQuery(name = "Applications.findApplication", query = "SELECT a.seekerid FROM Applications a where a.jobid = :jobid and a.seekerid = :seekerid"),
    @NamedQuery(name = "Applications.findApplicant", query = "SELECT a FROM Applications a where a.jobid = :jobid and a.seekerid = :seekerid"),
    @NamedQuery(name = "Applications.findSeekerApplications", query = "SELECT a FROM Applications a where a.seekerid = :seekerid order by a.id desc"),
    @NamedQuery(name = "Applications.findSeekerCount", query = "SELECT count(a.id) FROM Applications a where a.jobid = :jobid"),
    @NamedQuery(name = "Applications.findFilteredCount", query = "SELECT count(a.id) FROM Applications a where a.jobid = :jobid and a.viewed = :viewed")

})
public class Applications implements Serializable {

    private static final long serialVersionUID = 881899647458892107L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Basic(optional = false)
    @NotNull
    @Column(name = "commentdate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date commentdate;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "applications_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "letter", length = 2147483647)
    private String letter;
    @Size(max = 255)
    @Column(name = "comment", length = 255)
    private String comment;
    @Size(max = 255)
    @Column(name = "attachment", length = 255)
    private String attachment;
    @Column(name = "viewed")
    private Boolean viewed = false;
    @JoinColumn(name = "userid", referencedColumnName = "id")
    @ManyToOne
    private Users userid;
    @JoinColumn(name = "seekerid", referencedColumnName = "id")
    @ManyToOne
    private Seekers seekerid;
    @JoinColumn(name = "jobid", referencedColumnName = "id")
    @ManyToOne
    private Jobs jobid;
    @OneToMany(mappedBy = "applicationid", fetch = FetchType.LAZY)
    private Collection<Firstshortlist> firstshortlistCollection;
    @OneToMany(mappedBy = "applicationid", fetch = FetchType.LAZY)
    private Collection<Secondshortlist> secondshortlistCollection;
    @OneToMany(mappedBy = "applicationid", fetch = FetchType.EAGER)
    private Collection<Notes> notesCollection;

    public Applications() {
    }

    public Applications(Integer id) {
        this.id = id;
    }

    public Applications(Integer id, Date datemodified, Date commentdate) {
        this.id = id;
        this.datemodified = datemodified;
        this.commentdate = commentdate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLetter() {
        return letter;
    }

    public void setLetter(String letter) {
        this.letter = letter;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public Boolean getViewed() {
        return viewed;
    }

    public void setViewed(Boolean viewed) {
        this.viewed = viewed;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
    }

    public Seekers getSeekerid() {
        return seekerid;
    }

    public void setSeekerid(Seekers seekerid) {
        this.seekerid = seekerid;
    }

    public Jobs getJobid() {
        return jobid;
    }

    public void setJobid(Jobs jobid) {
        this.jobid = jobid;
    }

    @XmlTransient
    public Collection<Firstshortlist> getFirstshortlistCollection() {
        return firstshortlistCollection;
    }

    public void setFirstshortlistCollection(Collection<Firstshortlist> firstshortlistCollection) {
        this.firstshortlistCollection = firstshortlistCollection;
    }

    @XmlTransient
    public Collection<Secondshortlist> getSecondshortlistCollection() {
        return secondshortlistCollection;
    }

    public void setSecondshortlistCollection(Collection<Secondshortlist> secondshortlistCollection) {
        this.secondshortlistCollection = secondshortlistCollection;
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

        if (!(object instanceof Applications)) {
            return false;
        }
        Applications other = (Applications) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Applications[ id=" + id + " ]";
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    public Date getCommentdate() {
        return commentdate;
    }

    public void setCommentdate(Date commentdate) {
        this.commentdate = commentdate;
    }
}
