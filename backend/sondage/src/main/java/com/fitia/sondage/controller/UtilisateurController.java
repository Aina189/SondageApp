package com.fitia.sondage.controller;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fitia.sondage.service.UtilisateurService;
import com.fitia.sondage.entity.Utilisateurs;

@RestController
@RequestMapping(value = "/api")
public class UtilisateurController {
    
    @Autowired
    private UtilisateurService utilisateurService;

    @GetMapping(value = "/utilisateur", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Collection<Utilisateurs>> getAllUsers() {
        List<Utilisateurs> utilisateurs = utilisateurService.findAll();
        return new ResponseEntity<>(utilisateurs, HttpStatus.OK);
    }

    @PostMapping(value = "/utilisateur", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Utilisateurs> save(@RequestBody Utilisateurs utilisateurs) {
        Utilisateurs savedUtilisateur = utilisateurService.save(utilisateurs);
        return new ResponseEntity<>(savedUtilisateur, HttpStatus.CREATED);
    }

    // Add exception handling methods here if necessary
}
