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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "formquestions", catalog = "work", schema = "public")
@SequenceGenerator(name = "formquestions_id_seq", sequenceName = "formquestions_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Formquestions.findAll", query = "SELECT f FROM Formquestions f"),
    @NamedQuery(name = "Formquestions.findAllQuestions", query = "SELECT f FROM Formquestions f where f.formid = :formid"),
    @NamedQuery(name = "Formquestions.findQuestion", query = "SELECT f FROM Formquestions f where f.id > :id and f.formid = :formid ORDER BY f.id")

})
public class Formquestions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "formquestions_id_seq")
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "question", nullable = false, length = 255)
    private String question;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "formquestionid")
    private Collection<Formanswers> formanswersCollection;
    @JoinColumn(name = "questiontypeid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Questiontypes questiontypeid;
    @JoinColumn(name = "formid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Forms formid;

    public Formquestions() {
    }

    public Formquestions(Integer id) {
        this.id = id;
    }

    public Formquestions(Integer id, String question) {
        this.id = id;
        this.question = question;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    @XmlTransient
    public Collection<Formanswers> getFormanswersCollection() {
        return formanswersCollection;
    }

    public void setFormanswersCollection(Collection<Formanswers> formanswersCollection) {
        this.formanswersCollection = formanswersCollection;
    }

    public Questiontypes getQuestiontypeid() {
        return questiontypeid;
    }

    public void setQuestiontypeid(Questiontypes questiontypeid) {
        this.questiontypeid = questiontypeid;
    }

    public Forms getFormid() {
        return formid;
    }

    public void setFormid(Forms formid) {
        this.formid = formid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Formquestions)) {
            return false;
        }
        Formquestions other = (Formquestions) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "objects.Formquestions[ id=" + id + " ]";
    }

}
