/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "tip", catalog = "work", schema = "public")
@SequenceGenerator(name = "tip_id_seq", sequenceName = "tip_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tip.findAll", query = "SELECT t FROM Tip t"),
    @NamedQuery(name = "Tip.findCurrent", query = "SELECT t FROM Tip t where t.id = :id"),
    @NamedQuery(name = "Tip.findOne", query = "SELECT t FROM Tip t")
        //TODO make findOne random
})
public class Tip implements Serializable {

    private static final long serialVersionUID = 7184789136183548386L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tip_id_seq")
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Size(max = 100)
    @Column(name = "submittedby", length = 100)
    private String submittedby;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "tip", nullable = false, length = 255)
    private String tip;
    @Basic(optional = false)
    @NotNull
    @Column(name = "rate", nullable = false)
    private int rate;
    @Column(name = "datesubmited")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datesubmited;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipid")
    private Collection<Tiprate> tiprateCollection;

    public Tip() {
    }

    public Tip(Integer id) {
        this.id = id;
    }

    public Tip(Integer id, String tip, int rate) {
        this.id = id;
        this.tip = tip;
        this.rate = rate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubmittedby() {
        return submittedby;
    }

    public void setSubmittedby(String submittedby) {
        this.submittedby = submittedby;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Date getDatesubmited() {
        return datesubmited;
    }

    public void setDatesubmited(Date datesubmited) {
        this.datesubmited = datesubmited;
    }

    @XmlTransient
    public Collection<Tiprate> getTiprateCollection() {
        return tiprateCollection;
    }

    public void setTiprateCollection(Collection<Tiprate> tiprateCollection) {
        this.tiprateCollection = tiprateCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Tip)) {
            return false;
        }
        Tip other = (Tip) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Tip[ id=" + id + " ]";
    }
}
