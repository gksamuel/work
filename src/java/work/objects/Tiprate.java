/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "tiprate", catalog = "work", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tiprate.findAll", query = "SELECT t FROM Tiprate t"),
    @NamedQuery(name = "Tiprate.findSeekerTip", query = "SELECT t FROM Tiprate t where t.tipid  = :tip and t.seekerid = :seekerid"),
    @NamedQuery(name = "Tiprate.findUserTip", query = "SELECT t FROM Tiprate t where t.tipid  = :tip and t.userid = :userid"),
    @NamedQuery(name = "Tiprate.findCount", query = "SELECT count(t.id), sum(t.rate) FROM Tiprate t where t.tipid = :tip"),
})
public class Tiprate implements Serializable {
    private static final long serialVersionUID = -5373306370186537684L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "rate", nullable = false)
    private int rate;
    @JoinColumn(name = "userid", referencedColumnName = "id")
    @ManyToOne
    private Users userid;
    @JoinColumn(name = "tipid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Tip tipid;
    @JoinColumn(name = "seekerid", referencedColumnName = "id")
    @ManyToOne
    private Seekers seekerid;

    public Tiprate() {
    }

    public Tiprate(Integer id) {
        this.id = id;
    }

    public Tiprate(Integer id, int rate) {
        this.id = id;
        this.rate = rate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
    }

    public Tip getTipid() {
        return tipid;
    }

    public void setTipid(Tip tipid) {
        this.tipid = tipid;
    }

    public Seekers getSeekerid() {
        return seekerid;
    }

    public void setSeekerid(Seekers seekerid) {
        this.seekerid = seekerid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Tiprate)) {
            return false;
        }
        Tiprate other = (Tiprate) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Tiprate[ id=" + id + " ]";
    }
    
}
