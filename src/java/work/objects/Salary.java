/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Collection;
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
@Table(name = "salary", catalog = "work", schema = "public")
@SequenceGenerator(name = "salary_id_seq", sequenceName = "salary_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Salary.findAll", query = "SELECT s FROM Salary s order by s.id"),
    @NamedQuery(name = "Salary.findByID", query = "SELECT s FROM Salary s where s.id = :id")
})
public class Salary implements Serializable {

    private static final long serialVersionUID = -2531046793016194821L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "salary_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Size(max = 40)
    @Column(name = "salaryrange", length = 40)
    private String salaryrange;
    @OneToMany(mappedBy = "salaryid")
    private Collection<Seekers> seekersCollection;
    @OneToMany(mappedBy = "salaryid")
    private Collection<Jobs> jobsCollection;

    public Salary() {
    }

    public Salary(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSalaryrange() {
        return salaryrange;
    }

    public void setSalaryrange(String salaryrange) {
        this.salaryrange = salaryrange;
    }

    @XmlTransient
    public Collection<Seekers> getSeekersCollection() {
        return seekersCollection;
    }

    public void setSeekersCollection(Collection<Seekers> seekersCollection) {
        this.seekersCollection = seekersCollection;
    }

    public Collection<Jobs> getJobsCollection() {
        return jobsCollection;
    }

    public void setJobsCollection(Collection<Jobs> jobsCollection) {
        this.jobsCollection = jobsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Salary)) {
            return false;
        }
        Salary other = (Salary) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
//        return "work.objects.Salary[ id=" + id + " ]";
        return salaryrange;
    }
}
