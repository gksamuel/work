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
@Table(name = "thirdshortlist", catalog = "work", schema = "public")
@SequenceGenerator(name = "thirdshortlist_id_seq", sequenceName = "thirdshortlist_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Thirdshortlist.findAll", query = "SELECT t FROM Thirdshortlist t")})
public class Thirdshortlist implements Serializable {

    private static final long serialVersionUID = -7717911619726345151L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "thirdshortlist_id_seq")
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

    public Thirdshortlist() {
    }

    public Thirdshortlist(Integer id) {
        this.id = id;
    }

    public Thirdshortlist(Integer id, Date datemodified) {
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Thirdshortlist)) {
            return false;
        }
        Thirdshortlist other = (Thirdshortlist) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Thirdshortlist[ id=" + id + " ]";
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }
}
