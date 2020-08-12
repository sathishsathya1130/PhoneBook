package com.sathish.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sathish.entity.ContactEntity;
import com.sathish.exception.PhoneBookException;
import com.sathish.model.Contact;
import com.sathish.repos.ContactRepository;


@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactRepository contactRepository;
	
	/* private EmailProperties eProperties; */

	@Override
	public boolean saveContact(Contact contact) {
		boolean issaved = false;
		try {
			/* int i=10/0; */
			ContactEntity entity = new ContactEntity();
			BeanUtils.copyProperties(contact, entity);
			ContactEntity savedEntity = contactRepository.save(entity);

			if (savedEntity.getContactId() != null) {
				issaved = true;
			}
		} catch (Exception e) {
			throw new PhoneBookException("save failed");
		}

		return issaved;
	}

	@Override
	public List<Contact> getAllContacts() {
		List<Contact> contacts = new ArrayList<Contact>();
		List<ContactEntity> EntityList = contactRepository.findAll();

		EntityList.forEach(entity -> {
			Contact c = new Contact();
			/*
			 * c.setContactId(entity.getContactId());
			 * c.setContactName(entity.getContactName());
			 * c.setContactEmail(entity.getContactEmail());
			 * c.setContactNumber(entity.getContactNumber());
			 * c.setCreatedDate(entity.getCreatedDate());
			 * c.setUpdatedDate(entity.getUpdatedDate());
			 */
			BeanUtils.copyProperties(entity, c);
			contacts.add(c);

		});
		return contacts;

	}

	@Override
	public Contact getContactById(Integer cid) {

		Optional<ContactEntity> findById = contactRepository.findById(cid);
		if (findById.isPresent()) {
			ContactEntity entity = findById.get();
			Contact c = new Contact();
			BeanUtils.copyProperties(entity, c);
			return c;
		}
		return null;
	}

	@Override
	public boolean updateContact(Contact c) {
		return false;
	}

	@Override
	public boolean deleteContact(Integer cid) {
		contactRepository.deleteById(cid);

		return false;
	}

	@Override
	public String findByEmail(String contactEmail) {

		ContactEntity entity = contactRepository.findByContactEmail(contactEmail);
		if (null != entity) {
			return "Duplicate";
		}
		return "Unique";
	}

}
