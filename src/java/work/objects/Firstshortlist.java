/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "firstshortlist", catalog = "work", schema = "public")
@SequenceGenerator(name = "firstshortlist_id_seq", sequenceName = "firstshortlist_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Firstshortlist.findAll", query = "SELECT f FROM Firstshortlist f"),
    @NamedQuery(name = "Firstshortlist.findshortlist", query = "SELECT f FROM Firstshortlist f where f.jobid = :jobid and f.seekerid = :seekerid"),
    @NamedQuery(name = "Firstshortlist.findShortList", query = "SELECT f FROM Firstshortlist f where f.jobid = :jobid order by f.id"),
    @NamedQuery(name = "Firstshortlist.findNextApplication", query = "SELECT f FROM Firstshortlist f where f.jobid = :jobid and f.id > :id order by f.id"),
    @NamedQuery(name = "Firstshortlist.findApplication", query = "SELECT f FROM Firstshortlist f where f.applicationid = :applicationid order by f.id"),
    @NamedQuery(name = "Firstshortlist.findPreviousApplication", query = "SELECT f FROM Firstshortlist f where f.jobid = :jobid and f.id < :id order by f.id desc"),
    @NamedQuery(name = "Firstshortlist.findFirstApplication", query = "SELECT f FROM Firstshortlist f where f.jobid = :jobid order by f.id"),
    @NamedQuery(name = "Firstshortlist.findShortlistCount", query = "SELECT count(f.id) FROM Firstshortlist f where f.jobid = :jobid"),
    @NamedQuery(name = "Firstshortlist.findLastApplication", query = "SELECT f FROM Firstshortlist f where f.jobid = :jobid order by f.id desc")
})
public class Firstshortlist implements Serializable {

    private static final long serialVersionUID = 3117579489589783137L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "firstshortlist_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Size(max = 255)
    @Column(name = "internalcomment", length = 255)
    private String internalcomment;
    @Size(max = 255)
    @Column(name = "seekercomment", length = 255)
    private String seekercomment;
    @Size(max = 255)
    @Column(name = "publiccomment", length = 255)
    private String publiccomment;
    @Column(name = "hired")
    private Boolean hired;
    @JoinColumn(name = "userid", referencedColumnName = "id")
    @ManyToOne
    private Users userid;
    @JoinColumn(name = "seekerid", referencedColumnName = "id")
    @ManyToOne
    private Seekers seekerid;
    @JoinColumn(name = "jobid", referencedColumnName = "id")
    @ManyToOne
    private Jobs jobid;
    @JoinColumn(name = "applicationid", referencedColumnName = "id")
    @ManyToOne
    private Applications applicationid;

    public Firstshortlist() {
    }

    public Firstshortlist(Integer id) {
        this.id = id;
    }

    public Firstshortlist(Integer id, Date datemodified) {
        this.id = id;
        this.datemodified = datemodified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInternalcomment() {
        return internalcomment;
    }

    public void setInternalcomment(String internalcomment) {
        this.internalcomment = internalcomment;
    }

    public String getSeekercomment() {
        return seekercomment;
    }

    public void setSeekercomment(String seekercomment) {
        this.seekercomment = seekercomment;
    }

    public String getPubliccomment() {
        return publiccomment;
    }

    public void setPubliccomment(String publiccomment) {
        this.publiccomment = publiccomment;
    }

    public Boolean getHired() {
        return hired;
    }

    public void setHired(Boolean hired) {
        this.hired = hired;
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

    public Applications getApplicationid() {
        return applicationid;
    }

    public void setApplicationid(Applications applicationid) {
        this.applicationid = applicationid;
    }

    public Jobs getJobid() {
        return jobid;
    }

    public void setJobid(Jobs jobid) {
        this.jobid = jobid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Firstshortlist)) {
            return false;
        }
        Firstshortlist other = (Firstshortlist) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Firstshortlist[ id=" + id + " ]";
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }
}
