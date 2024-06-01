package com.fitia.sondage.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitia.sondage.entity.Utilisateurs;
import com.fitia.sondage.repositories.UtilisateurRepositorie;

@Service
public class UtilisateurService {
    
    @Autowired
    UtilisateurRepositorie utilisateurRepositorie;

    
    
    public List<Utilisateurs> findAll(){
        return (List<Utilisateurs>)utilisateurRepositorie.findAll();
    }

    public Utilisateurs save(Utilisateurs utilisateurs){
        return utilisateurRepositorie.save(utilisateurs);
    }
}
