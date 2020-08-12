package com.sathish.service;

import java.util.List;

import com.sathish.model.Contact;

public interface ContactService {

	boolean saveContact(Contact c);

	List<Contact> getAllContacts();

	Contact getContactById(Integer cid);

	boolean updateContact(Contact c);

	boolean deleteContact(Integer cid);
	

	public String findByEmail(String email);
}
