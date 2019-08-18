/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.math.BigDecimal;
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
import javax.persistence.SequenceGenerator;
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
@Table(name = "mpesa", catalog = "work", schema = "public")
@SequenceGenerator(name = "mpesa_id_seq", sequenceName = "mpesa_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mpesa.findAll", query = "SELECT m FROM Mpesa m"),
    @NamedQuery(name = "Mpesa.findSeekerPayments", query = "SELECT m FROM Mpesa m where m.seekerid = :seekerid order by m.processtime desc"),
    @NamedQuery(name = "Mpesa.findCompanyPayments", query = "SELECT m FROM Mpesa m where m.companyid = :companyid  order by m.processtime desc"),
    @NamedQuery(name = "Mpesa.findSource", query = "SELECT m FROM Mpesa m where m.source = :source and m.processed = false order by m.id")
})
public class Mpesa implements Serializable {

    private static final long serialVersionUID = -2064584307269788001L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mpesa_id_seq")
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "source", nullable = false)
    private long source;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "code", nullable = false, length = 9)
    private String code;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount", nullable = false, precision = 7, scale = 2)
    private BigDecimal amount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "paytime", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date paytime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "receivetime", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date receivetime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "processed", nullable = false)
    private boolean processed;
    @Basic(optional = false)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;
    @Column(name = "processtime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date processtime;
    @Column(name = "fromtime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fromtime;
    @Column(name = "totime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date totime;
    @JoinColumn(name = "seekerid", referencedColumnName = "id")
    @ManyToOne
    private Seekers seekerid;
    @JoinColumn(name = "inmessageid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Inmessage inmessageid;
    @JoinColumn(name = "companyid", referencedColumnName = "id")
    @ManyToOne
    private Company companyid;

    public Mpesa() {
    }

    public Mpesa(Integer id) {
        this.id = id;
    }

    public Mpesa(long source, String code, BigDecimal amount, Date paytime, Date receivetime, boolean processed) {
        this.source = source;
        this.code = code;
        this.amount = amount;
        this.paytime = paytime;
        this.receivetime = receivetime;
        this.processed = processed;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public long getSource() {
        return source;
    }

    public void setSource(long source) {
        this.source = source;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    public Date getReceivetime() {
        return receivetime;
    }

    public void setReceivetime(Date receivetime) {
        this.receivetime = receivetime;
    }

    public boolean getProcessed() {
        return processed;
    }

    public void setProcessed(boolean processed) {
        this.processed = processed;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getProcesstime() {
        return processtime;
    }

    public void setProcesstime(Date processtime) {
        this.processtime = processtime;
    }

    public Date getFromtime() {
        return fromtime;
    }

    public void setFromtime(Date fromtime) {
        this.fromtime = fromtime;
    }

    public Date getTotime() {
        return totime;
    }

    public void setTotime(Date totime) {
        this.totime = totime;
    }

    public Seekers getSeekerid() {
        return seekerid;
    }

    public void setSeekerid(Seekers seekerid) {
        this.seekerid = seekerid;
    }

    public Inmessage getInmessageid() {
        return inmessageid;
    }

    public void setInmessageid(Inmessage inmessageid) {
        this.inmessageid = inmessageid;
    }

    public Company getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Company companyid) {
        this.companyid = companyid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Mpesa)) {
            return false;
        }
        Mpesa other = (Mpesa) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Mpesa[ id=" + id + " ]";
    }
}
