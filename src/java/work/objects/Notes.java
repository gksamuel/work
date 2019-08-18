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
@Table(name = "notes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Notes.findAll", query = "SELECT n FROM Notes n"),
    @NamedQuery(name = "Notes.findById", query = "SELECT n FROM Notes n WHERE n.id = :id"),
    @NamedQuery(name = "Notes.findByParent", query = "SELECT n FROM Notes n WHERE n.parent = :parent"),
    @NamedQuery(name = "Notes.findByStage", query = "SELECT n FROM Notes n WHERE n.stage = :stage"),
    @NamedQuery(name = "Notes.findByComment", query = "SELECT n FROM Notes n WHERE n.comment = :comment"),
    @NamedQuery(name = "Notes.findByDatecreated", query = "SELECT n FROM Notes n WHERE n.datecreated = :datecreated"),
    @NamedQuery(name = "Notes.findByDatemodified", query = "SELECT n FROM Notes n WHERE n.datemodified = :datemodified")})
public class Notes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "parent")
    private Integer parent;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "stage")
    private String stage;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "comment")
    private String comment;
    @Column(name = "datecreated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datecreated;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @JoinColumn(name = "userid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Users userid;
    @JoinColumn(name = "applicationid", referencedColumnName = "id")
    @ManyToOne
    private Applications applicationid;

    public Notes() {
    }

    public Notes(Integer id) {
        this.id = id;
    }

    public Notes(Integer id, String stage, String comment, Date datemodified) {
        this.id = id;
        this.stage = stage;
        this.comment = comment;
        this.datemodified = datemodified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(Date datecreated) {
        this.datecreated = datecreated;
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
    }


    public Applications getApplicationid() {
        return applicationid;
    }

    public void setApplicationid(Applications applicationid) {
        this.applicationid = applicationid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Notes)) {
            return false;
        }
        Notes other = (Notes) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "objects.Notes[ id=" + id + " ]";
    }

}
