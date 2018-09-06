package com.tlite.dao.contractor;

import java.util.List;

import com.tlite.pojo.Document;
import com.tlite.pojo.Employee;

public interface IDocument {

	
	List<Document> getAllDocuments(int contractor_id);
	
	int saveDocument(Document document);
	
	int disableDocument(int document_id);

	Document getDocument(int document_id);

	int updateDocument(Document document);

	int shareDocument(int document_id, int employee_id);

	boolean validateSharing(int document_id, int employee_id);

	List<Employee> getSharedList(int document_id);

	
}
