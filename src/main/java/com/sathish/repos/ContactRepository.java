package com.sathish.repos;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sathish.entity.ContactEntity;

public interface ContactRepository extends JpaRepository<ContactEntity, Serializable> {

	public ContactEntity findByContactEmail(String email);
}
