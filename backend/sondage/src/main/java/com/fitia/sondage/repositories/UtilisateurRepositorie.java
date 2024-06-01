package com.fitia.sondage.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fitia.sondage.entity.Utilisateurs;

@Repository
public interface UtilisateurRepositorie extends CrudRepository<Utilisateurs, Long>{
    
} 
