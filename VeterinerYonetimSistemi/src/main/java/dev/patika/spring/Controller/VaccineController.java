package dev.patika.spring.Controller;

import dev.patika.spring.Dto.Request.VaccineRequest;
import dev.patika.spring.Dto.Response.VaccineResponse;
import dev.patika.spring.Entity.Animal;
import dev.patika.spring.Entity.Vaccine;
import dev.patika.spring.Service.VaccineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/vaccine")
public class VaccineController {
    private final VaccineService vaccineService;

    @Autowired
    public VaccineController(VaccineService vaccineService) {
        this.vaccineService = vaccineService;
    }

    @PostMapping
    public ResponseEntity<String> saveVaccine(@RequestBody Vaccine vaccine) {
        vaccineService.saveVaccine(vaccine);
        return ResponseEntity.status(HttpStatus.CREATED).body("Aşı başarıyla kaydedildi.");
    }

    @GetMapping("/{id}")
    public ResponseEntity<List<Vaccine>> getVaccinesByAnimalId(@PathVariable Long id) {
        List<Vaccine> vaccines = vaccineService.getVaccinesByAnimalId(id);
        return ResponseEntity.ok(vaccines);
    }
    @PostMapping("/create")
    public ResponseEntity<?> createVaccine(@RequestBody VaccineRequest vaccineRequest) {
        try {
            if (!vaccineService.isAnimalExist(vaccineRequest.getAnimalId())) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body("Belirtilen id'de hayvan mevcut değil");
            }

            VaccineResponse response = vaccineService.saveVaccine(vaccineRequest);
            return new ResponseEntity<>(response, HttpStatus.CREATED);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }



    @GetMapping("/expiring")
    public ResponseEntity<List<Animal>> getAnimalsWithExpiringVaccines(
            @RequestParam("startDate") LocalDate startDate,
            @RequestParam("endDate") LocalDate endDate) {
        List<Animal> animals = vaccineService.getAnimalsWithExpiringVaccines(startDate, endDate);
        return ResponseEntity.ok(animals);
    }

}
