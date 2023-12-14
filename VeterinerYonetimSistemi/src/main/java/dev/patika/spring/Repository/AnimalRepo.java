package dev.patika.spring.Repository;

import dev.patika.spring.Entity.Animal;
import dev.patika.spring.Entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AnimalRepo extends JpaRepository<Animal,Long> {
    Animal findByName(String name);

    List<Animal> findByCustomer_Id(Long id);
}
