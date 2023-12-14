package dev.patika.spring.Service;

import dev.patika.spring.Entity.Animal;
import dev.patika.spring.Entity.Customer;
import dev.patika.spring.Repository.AnimalRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AnimalService {
    private final AnimalRepo animalRepository;

    @Autowired
    public AnimalService(AnimalRepo animalRepository) {
        this.animalRepository = animalRepository;
    }

    public void saveAnimal(Animal animal) {
        validateAnimal(animal);
        animalRepository.save(animal);
    }

    public List<Animal> getAllAnimals() {
        return animalRepository.findAll();
    }

    public Optional<Animal> getAnimalById(Long id) {
        return animalRepository.findById(id);
    }




    public List<Animal> getAnimalsByCustomer(Customer customer) {
        return animalRepository.findByCustomer_Id(customer.getId());
    }

    public void deleteAnimal(Long id) {
        animalRepository.deleteById(id);
    }

    private void validateAnimal(Animal animal) {
        // Gerekli doğrulamaları burada yapabilirsiniz.
        // Örneğin, animal nesnesinin adı boş olmamalı gibi.
    }
}


