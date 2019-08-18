/*
 * To change this template, choose Tools | Templates
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
@Table(catalog = "work", schema = "public")
@XmlRootElement
@NamedQueries({ 
    @NamedQuery(name = "Agent.findAll", query = "SELECT a FROM Agent a where a.active = true"),
//    @NamedQuery(name = "Agent.findAgent", query = "select a from Agent a where substring(md5(a.id || a.agentname),1,6) =  :code")
    //TODO fix query
})
public class Agent implements Serializable {

    private static final long serialVersionUID = -5322125966352593741L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(nullable = false, length = 100)
    private String agentname;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(nullable = false, length = 100)
    private String email;
    @Size(max = 100)
    @Column(length = 100)
    private String contactperson;
    @Size(max = 15)
    @Column(length = 15)
    private String contactname;
    private Integer access;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String feedback;
    private Boolean active;
    @Basic(optional = true)
    @Size(min = 0, max = 100)
    @Column(nullable = true, length = 100)
    private String email2;
    @Size(max = 15)
    @Column(length = 15)
    private String mobile;
    @Size(max = 100)
    @Column(length = 100)
    private String mobile2;
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastmessage;
    @Temporal(TemporalType.TIMESTAMP)
    private Date accesstime;
    @JoinColumn(name = "messageid", referencedColumnName = "id")
    @ManyToOne
    private Outmessage messageid;

    public Agent() {
    }

    public Agent(Integer id) {
        this.id = id;
    }

    public Agent(Integer id, String agentname, String email, String email2) {
        this.id = id;
        this.agentname = agentname;
        this.email = email;
        this.email2 = email2;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAgentname() {
        return agentname;
    }

    public void setAgentname(String agentname) {
        this.agentname = agentname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactperson() {
        return contactperson;
    }

    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
    }

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname;
    }

    public Integer getAccess() {
        return access;
    }

    public void setAccess(Integer access) {
        this.access = access;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getEmail2() {
        return email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMobile2() {
        return mobile2;
    }

    public void setMobile2(String mobile2) {
        this.mobile2 = mobile2;
    }

    public Date getLastmessage() {
        return lastmessage;
    }

    public void setLastmessage(Date lastmessage) {
        this.lastmessage = lastmessage;
    }

    public Date getAccesstime() {
        return accesstime;
    }

    public void setAccesstime(Date accesstime) {
        this.accesstime = accesstime;
    }

    public Outmessage getMessageid() {
        return messageid;
    }

    public void setMessageid(Outmessage messageid) {
        this.messageid = messageid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof Agent)) {
            return false;
        }
        Agent other = (Agent) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Agent[ id=" + id + " ]";
    }
}
