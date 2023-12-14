package dev.patika.spring.Controller;

import dev.patika.spring.Entity.Animal;
import dev.patika.spring.Entity.Doctor;
import dev.patika.spring.Repository.DoctorRepo;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/doctor")
public class DoctorController {
    // TODO: 13.12.2023 silme eklenecek

    private final DoctorRepo doctorRepo;

    public DoctorController(DoctorRepo doctorRepo) {
        this.doctorRepo = doctorRepo;
    }

    @GetMapping("/{id}")
    public Doctor findbyId(@PathVariable("id") long id) {
        return this.doctorRepo.findById(id).orElseThrow();
    }

    // id yollanırsa update ediyor, id yoksa insert ediyor
    @PostMapping("/save")
    public Doctor save(@RequestBody Doctor doctor) {
        return this.doctorRepo.save(doctor);
    }

    @GetMapping("/find-all")
    public List<Doctor> findAll() {
        return this.doctorRepo.findAll();
    }

    @GetMapping("/name/{name}")
    public Doctor findByName(@PathVariable("name") String name) {
        return this.doctorRepo.findByName(name);
    }
    

}
