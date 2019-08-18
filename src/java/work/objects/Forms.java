/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "forms", catalog = "work", schema = "public")
@SequenceGenerator(name = "forms_id_seq", sequenceName = "forms_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Forms.findAll", query = "SELECT f FROM Forms f"),
    @NamedQuery(name = "Forms.findForms", query = "SELECT f FROM Forms f where f.companyid = :companyid ORDER BY f.id"),
    @NamedQuery(name = "Forms.findOne", query = "SELECT f FROM Forms f where f.id = :id")
})
public class Forms implements Serializable {

    private static final long serialVersionUID = -65464729784585649L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "forms_id_seq")
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "title", nullable = false, length = 100)
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "description", nullable = false, length = 100)
    private String description;
    @Column(name = "datemodified")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @OneToMany(mappedBy = "formid")
    private Collection<Formanswers> formanswersCollection;
    @OneToMany(mappedBy = "formid", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Jobs> jobsCollection;
    @OneToMany(mappedBy = "formid", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Formquestions> formquestionsCollection;
    @JoinColumn(name = "userid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Users userid;
    @JoinColumn(name = "companyid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Company companyid;

    public Forms() {
    }

    public Forms(Integer id) {
        this.id = id;
    }

    public Forms(Integer id, String title, String description) {
        this.id = id;
        this.title = title;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    @XmlTransient
    public Collection<Formanswers> getFormanswersCollection() {
        return formanswersCollection;
    }

    public void setFormanswersCollection(Collection<Formanswers> formanswersCollection) {
        this.formanswersCollection = formanswersCollection;
    }

    public Collection<Jobs> getJobsCollection() {
        return jobsCollection;
    }

    public void setJobsCollection(Collection<Jobs> jobsCollection) {
        this.jobsCollection = jobsCollection;
    }

    @XmlTransient
    public Collection<Formquestions> getFormquestionsCollection() {
        return formquestionsCollection;
    }

    public void setFormquestionsCollection(Collection<Formquestions> formquestionsCollection) {
        this.formquestionsCollection = formquestionsCollection;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
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

        if (!(object instanceof Forms)) {
            return false;
        }
        Forms other = (Forms) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return title;
    }

}
