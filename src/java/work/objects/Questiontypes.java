/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "questiontypes", catalog = "work", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"questiontype"})})
@SequenceGenerator(name = "questiontypes_id_seq", sequenceName = "questiontypes_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Questiontypes.findAll", query = "SELECT q FROM Questiontypes q"),
    @NamedQuery(name = "Questiontypes.findOne", query = "SELECT q FROM Questiontypes q where q.id = :id")
})
public class Questiontypes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "questiontypes_id_seq")
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "questiontype", nullable = false, length = 30)
    private String questiontype;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "questiontypeid")
    private Collection<Formquestions> formquestionsCollection;

    public Questiontypes() {
    }

    public Questiontypes(Integer id) {
        this.id = id;
    }

    public Questiontypes(Integer id, String questiontype) {
        this.id = id;
        this.questiontype = questiontype;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestiontype() {
        return questiontype;
    }

    public void setQuestiontype(String questiontype) {
        this.questiontype = questiontype;
    }

    @XmlTransient
    public Collection<Formquestions> getFormquestionsCollection() {
        return formquestionsCollection;
    }

    public void setFormquestionsCollection(Collection<Formquestions> formquestionsCollection) {
        this.formquestionsCollection = formquestionsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Questiontypes)) {
            return false;
        }
        Questiontypes other = (Questiontypes) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "objects.Questiontypes[ id=" + id + " ]";
    }

}
