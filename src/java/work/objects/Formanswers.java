/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
@Table(name = "formanswers", catalog = "work", schema = "public")
@SequenceGenerator(name = "formanswers_id_seq", sequenceName = "formanswers_id_seq", allocationSize = 1)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Formanswers.findAll", query = "SELECT f FROM Formanswers f"),
    @NamedQuery(name = "Formanswers.findAnswer", query = "SELECT f FROM Formanswers f where f.formid = :formid and f.formquestionid = :formquestionid and f.seekerid = :seekerid")

})
public class Formanswers implements Serializable {
    private static final long serialVersionUID = 1936630617846050722L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "formanswers_id_seq")
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "question", nullable = false, length = 255)
    private String question;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "answer", nullable = false, length = 2147483647)
    private String answer;
    @Column(name = "datemodified")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @JoinColumn(name = "seekerid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Seekers seekerid;
    @JoinColumn(name = "formid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Forms formid;
    @JoinColumn(name = "formquestionid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Formquestions formquestionid;

    public Formanswers() {
    }

    public Formanswers(Integer id) {
        this.id = id;
    }

    public Formanswers(Integer id, String question, String answer) {
        this.id = id;
        this.question = question;
        this.answer = answer;
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

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    public Seekers getSeekerid() {
        return seekerid;
    }

    public void setSeekerid(Seekers seekerid) {
        this.seekerid = seekerid;
    }

    public Forms getFormid() {
        return formid;
    }

    public void setFormid(Forms formid) {
        this.formid = formid;
    }

    public Formquestions getFormquestionid() {
        return formquestionid;
    }

    public void setFormquestionid(Formquestions formquestionid) {
        this.formquestionid = formquestionid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Formanswers)) {
            return false;
        }
        Formanswers other = (Formanswers) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "objects.Formanswers[ id=" + id + " ]";
    }

}
