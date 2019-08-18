/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.TermDocs;
import org.apache.lucene.search.DocIdSet;
import org.apache.lucene.util.OpenBitSet;
import work.objects.Seekers;

/**
 *
 * @author gachanja
 */
public class ApplicantsFilter extends org.apache.lucene.search.Filter {
    private static final long serialVersionUID = 7951675815548078069L;

    private List<Seekers> applicants;

    public List<Seekers> getApplicants() {
        return applicants;
    }

    public void setApplicants(List<Seekers> applicants) {
        this.applicants = applicants;
    }

    @Override
    public DocIdSet getDocIdSet(IndexReader reader) throws IOException {
        OpenBitSet bitSet = new OpenBitSet(reader.maxDoc());
        int[] docs = new int[1];
        int[] freqs = new int[1];
        if (applicants.size() > 0) {
            Iterator i = applicants.iterator();
            while (i.hasNext()) {
                Seekers seeker = (Seekers) i.next();
                String applicant = String.valueOf((Integer) seeker.getId());
                TermDocs termDocs = reader.termDocs(new Term("id", applicant));
                int count = termDocs.read(docs, freqs);
                if (count == 1) {
                    bitSet.set(docs[0]);
                }
            }
        }
        return bitSet;
    }
}
