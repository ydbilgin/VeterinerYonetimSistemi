package dev.patika.spring.Controller;

import dev.patika.spring.Entity.Appointment;
import dev.patika.spring.Entity.Customer;
import dev.patika.spring.Repository.CustomerRepo;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customer")
public class CustomerController {
    private final CustomerRepo customerRepo;

    public CustomerController(CustomerRepo customerRepo) {
        this.customerRepo = customerRepo;
    }
    @GetMapping("/{id}")
    public Customer findbyId(@PathVariable("id") long id) {
        return this.customerRepo.findById(id).orElseThrow();
    }

    // id yollanırsa update ediyor, id yoksa insert ediyor
    @PostMapping("/save")
    public Customer save(@RequestBody Customer customer) {
        return this.customerRepo.save(customer);
    }

    @GetMapping("/find-all")
    public List<Customer> findAll() {
        return this.customerRepo.findAll();
    }
}
