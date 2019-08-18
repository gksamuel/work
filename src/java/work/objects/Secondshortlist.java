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
@Table(name = "secondshortlist", catalog = "work", schema = "public")
@SequenceGenerator(name = "secondshortlist_id_seq", sequenceName = "secondshortlist_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Secondshortlist.findAll", query = "SELECT s FROM Secondshortlist s"),
    @NamedQuery(name = "Secondshortlist.findSecondShortList", query = "SELECT s FROM Secondshortlist s where s.jobid = :jobid and s.seekerid = :seekerid"),
    @NamedQuery(name = "Secondshortlist.findShortList", query = "SELECT s FROM Secondshortlist s where s.jobid = :jobid order by s.id"),
    @NamedQuery(name = "Secondshortlist.findNextApplication", query = "SELECT s FROM Secondshortlist s where s.jobid = :jobid and s.id > :id order by s.id"),
    @NamedQuery(name = "Secondshortlist.findApplication", query = "SELECT s FROM Secondshortlist s where s.applicationid = :applicationid order by s.id"),
    @NamedQuery(name = "Secondshortlist.findPreviousApplication", query = "SELECT s FROM Secondshortlist s where s.jobid = :jobid and s.id < :id order by s.id desc"),
    @NamedQuery(name = "Secondshortlist.findFirstApplication", query = "SELECT s FROM Secondshortlist s where s.jobid = :jobid order by s.id"),
    @NamedQuery(name = "Secondshortlist.findLastApplication", query = "SELECT s FROM Secondshortlist s where s.jobid = :jobid order by s.id desc")
})
public class Secondshortlist implements Serializable {

    private static final long serialVersionUID = 130673985680599546L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "secondshortlist_id_seq")
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

    public Secondshortlist() {
    }

    public Secondshortlist(Integer id) {
        this.id = id;
    }

    public Secondshortlist(Integer id, Date datemodified) {
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

    public Jobs getJobid() {
        return jobid;
    }

    public void setJobid(Jobs jobid) {
        this.jobid = jobid;
    }

    public Applications getApplicationid() {
        return applicationid;
    }

    public void setApplicationid(Applications applicationid) {
        this.applicationid = applicationid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Secondshortlist)) {
            return false;
        }
        Secondshortlist other = (Secondshortlist) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Secondshortlist[ id=" + id + " ]";
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }
}
