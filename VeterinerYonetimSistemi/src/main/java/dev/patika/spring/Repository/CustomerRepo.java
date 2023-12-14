package dev.patika.spring.Repository;

import dev.patika.spring.Entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepo extends JpaRepository<Customer,Long> {

    Customer findByName(String name);

}
