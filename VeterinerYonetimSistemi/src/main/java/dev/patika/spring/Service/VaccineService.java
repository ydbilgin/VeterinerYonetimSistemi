package dev.patika.spring.Service;

import dev.patika.spring.Dto.Request.VaccineRequest;
import dev.patika.spring.Dto.Response.VaccineResponse;
import dev.patika.spring.Entity.Animal;
import dev.patika.spring.Entity.Vaccine;
import dev.patika.spring.Repository.AnimalRepo;
import dev.patika.spring.Repository.VaccineRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class VaccineService {
    private final VaccineRepo vaccineRepository;
    private final AnimalRepo animalRepo;

    @Autowired
    public VaccineService(VaccineRepo vaccineRepository, AnimalRepo animalRepo) {
        this.vaccineRepository = vaccineRepository;
        this.animalRepo = animalRepo;
    }

    public void saveVaccine(Vaccine vaccine) {
        validateVaccine(vaccine);
        vaccineRepository.save(vaccine);
    }

    public List<Vaccine> getVaccinesByAnimalId(Long id) {
        return vaccineRepository.findByAnimal_Id(id);
    }

    public List<Animal> getAnimalsWithExpiringVaccines(LocalDate startDate, LocalDate endDate) {
        return vaccineRepository.findAnimalsWithExpiringVaccines(startDate, endDate);
    }

    private void validateVaccine(Vaccine vaccine) {
        // Aşı koruyuculuk bitiş tarihini kontrol etme
        LocalDate currentDate = LocalDate.now();
        if (vaccine.getProtectionFinishDate().isBefore(currentDate)) {
            throw new RuntimeException("Aşı koruyuculuk süresi geçmiş bir aşı eklenemez.");
        }

        // Eğer aynı tip aşının aynı hayvana eklenip eklenmediğini kontrol etme
        boolean isDuplicate = vaccineRepository.existsByAnimal_IdAndNameAndCode(
                vaccine.getAnimal().getId(), vaccine.getName(), vaccine.getCode());
        if (isDuplicate) {
            throw new RuntimeException("Bu hayvana aynı tip aşı daha önce eklenmiştir.");
        }
    }
    public VaccineResponse saveVaccine(VaccineRequest vaccineRequest) {
        Vaccine vaccine = new Vaccine();
        vaccine.setName(vaccineRequest.getName());
        vaccine.setCode(vaccineRequest.getCode());
        vaccine.setProtectionStartDate(vaccineRequest.getProtectionStartDate());
        vaccine.setProtectionFinishDate(vaccineRequest.getProtectionFinishDate());
        vaccine.setAnimal(animalRepo.findById(vaccineRequest.getAnimalId()).orElse(null));

        List<Vaccine> vaccines = vaccineRepository.findByAnimalIdAndVaccineNameAndVaccineCode(
                vaccine.getAnimal().getId(),
                vaccine.getName(),
                vaccine.getCode()
        );

        if (!vaccines.isEmpty()) {
            throw new RuntimeException("Aynı tarihlerde aynı hayvana aynı aşıyı tekrar ekleyemezsiniz.");
        }

        // Koruma bitiş tarihinin koruma başlangıç tarihinden önce olmadığından emin olun.
        if (vaccine.getProtectionFinishDate().isBefore(vaccine.getProtectionStartDate())) {
            throw new RuntimeException("Koruma bitiş tarihi koruma başlangıç tarihinden önce olamaz.");
        }

        vaccineRepository.save(vaccine);

        VaccineResponse vaccineResponse = new VaccineResponse();
        vaccineResponse.setId(vaccine.getId());
        vaccineResponse.setName(vaccine.getName());
        vaccineResponse.setCode(vaccine.getCode());
        vaccineResponse.setProtectionStartDate(vaccine.getProtectionStartDate());
        vaccineResponse.setProtectionFinishDate(vaccine.getProtectionFinishDate());
        vaccineResponse.setAnimalId(vaccine.getAnimal().getId());

        return vaccineResponse;
    }
    public boolean isAnimalExist(Long animalId) {
        return animalRepo.existsById(animalId);
    }


}
