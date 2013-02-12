module BiodbLinkHelper

  def url_ncbi_protein(q)
    base = "http://www.ncbi.nlm.nih.gov/protein/%GI%"
    gi = /^gi\|(\d+)/.match(q)[1]
    return base.sub(/%GI%/, gi)
  end

  def url_pfam(q)
    base = "http://pfam.sanger.ac.uk/family/%ACC%"
    raise unless /^PF\d+/.match(q)
    return base.sub(/%ACC%/, q)
  end

  def url_ncbi_taxonomy(q)
    taxid = q.to_s.strip
    base = "http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=%TAXID%"
    raise unless /^\d+$/.match(taxid)
    base.sub(/%TAXID%/, taxid)
  end

  def url_interpro(q)
    base = "http://www.ebi.ac.uk/interpro/IEntry?ac=%ACC%"
    raise unless /^IPR\d+/.match(q)
    base.sub(/%ACC%/, q)
  end

  def url_goterm(q)
    base = "http://amigo.geneontology.org/cgi-bin/amigo/term_details?term=%GOID%"
    raise unless /^GO:\d+/.match(q)
    base.sub(/%GOID%/, q)
  end

  def url_orthodb5(q)
    base = "http://cegg.unige.ch/orthodb5/results?searchtext=%ID%&level=Arthropoda&tree=Arth"
    raise unless /^EOG5/.match(q)
    base.sub(/%ID%/, q)
  end


end

