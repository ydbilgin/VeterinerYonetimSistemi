package dev.patika.spring.Controller;

import dev.patika.spring.Entity.Animal;
import dev.patika.spring.Repository.AnimalRepo;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/animal")
public class AnimalController {
    private final AnimalRepo animalRepo;

    public AnimalController(AnimalRepo animalRepo) {
        this.animalRepo = animalRepo;
    }

    @GetMapping("/{id}")
    public Animal findbyId(@PathVariable("id") long id){
        return this.animalRepo.findById(id).orElseThrow();
    }

    // id yollanırsa update ediyor, id yoksa insert ediyor
    @PostMapping("/save")
    public Animal save(@RequestBody Animal animal){
        return this.animalRepo.save(animal);
    }

    @GetMapping("/find-all")
    public List<Animal> findAll(){
        return this.animalRepo.findAll();
    }

    @GetMapping("/name/{name}")
    public Animal findByName(@PathVariable("name") String name){
        return this.animalRepo.findByName(name);
    }



}
