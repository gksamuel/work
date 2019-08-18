/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.objects;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.search.annotations.*;
import work.utils.FilesClassBridge;

/**
 *
 * @author gachanja
 */
@Entity
@Table(name = "files", catalog = "work", schema = "public")
@SequenceGenerator(name = "files_id_seq", sequenceName = "files_id_seq", allocationSize = 1)
@ClassBridge(name = "files", store = Store.YES, impl = FilesClassBridge.class)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Files.findAll", query = "SELECT f FROM Files f"),
    @NamedQuery(name = "Files.findFile", query = "SELECT f FROM Files f where f.id = :id"),
    @NamedQuery(name = "Files.findBySeekerId", query = "SELECT c FROM Files c where c.seekerid = :seekerid order by c.id desc")})
public class Files implements Serializable {

    private static final long serialVersionUID = -6386120221157234566L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "viewable", nullable = false)
    private boolean viewable;
    @JoinColumn(name = "filecategoryid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Filecategory filecategoryid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "originalfilename", nullable = false, length = 100)
    private String originalfilename;
    @Column(name = "filesize")
    private Integer filesize;
    @Size(max = 100)
    @Column(name = "filetype", length = 100)
    private String filetype;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datemodified", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodified;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.YES)
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "files_id_seq")
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    private Integer id;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.YES)
    @Size(max = 100)
    @Column(name = "description", length = 100)
    private String description;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.YES)
    @Size(max = 100)
    @Column(name = "metadata", length = 100)
    private String metadata;
    @Field(index = org.hibernate.search.annotations.Index.YES, analyze = Analyze.YES, store = Store.YES)
    @Size(max = 100)
    @Column(name = "filename", length = 100)
    private String filename;
    @ContainedIn
    @JoinColumn(name = "seekerid", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Seekers seekerid;

    public Files() {
    }

    public Files(Integer id) {
        this.id = id;
    }

    public Files(Integer id, Date datemodified) {
        this.id = id;
        this.datemodified = datemodified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMetadata() {
        return metadata;
    }

    public void setMetadata(String metadata) {
        this.metadata = metadata;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
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

        if (!(object instanceof Files)) {
            return false;
        }
        Files other = (Files) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "work.objects.Files[ id=" + id + " ]";
    }

    public String getOriginalfilename() {
        return originalfilename;
    }

    public void setOriginalfilename(String originalfilename) {
        this.originalfilename = originalfilename;
    }

    public Integer getFilesize() {
        return filesize;
    }

    public void setFilesize(Integer filesize) {
        this.filesize = filesize;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public Date getDatemodified() {
        return datemodified;
    }

    public void setDatemodified(Date datemodified) {
        this.datemodified = datemodified;
    }

    public boolean getViewable() {
        return viewable;
    }

    public void setViewable(boolean viewable) {
        this.viewable = viewable;
    }

    public Filecategory getFilecategoryid() {
        return filecategoryid;
    }

    public void setFilecategoryid(Filecategory filecategoryid) {
        this.filecategoryid = filecategoryid;
    }
}
