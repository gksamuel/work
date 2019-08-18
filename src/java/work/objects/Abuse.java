/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "abuse", catalog = "work", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Abuse.findAll", query = "SELECT a FROM Abuse a"),
    @NamedQuery(name = "Abuse.findReport", query = "SELECT a FROM Abuse a where a.jobid = :jobid and a.seekerid = :seekerid")
})
public class Abuse implements Serializable {

    private static final long serialVersionUID = -8924240528226597652L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "comment", nullable = false, length = 255)
    private String comment;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datesubmitted", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datesubmitted;
    @JoinColumn(name = "seekerid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Seekers seekerid;
    @JoinColumn(name = "jobid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Jobs jobid;

    public Abuse() {
    }

    public Abuse(Integer id) {
        this.id = id;
    }

    public Abuse(Integer id, String comment, Date datesubmitted) {
        this.id = id;
        this.comment = comment;
        this.datesubmitted = datesubmitted;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDatesubmitted() {
        return datesubmitted;
    }

    public void setDatesubmitted(Date datesubmitted) {
        this.datesubmitted = datesubmitted;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Abuse)) {
            return false;
        }
        Abuse other = (Abuse) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Abuse[ id=" + id + " ]";
    }
}
