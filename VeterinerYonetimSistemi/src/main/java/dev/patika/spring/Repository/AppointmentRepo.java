package dev.patika.spring.Repository;

import dev.patika.spring.Entity.Animal;
import dev.patika.spring.Entity.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
@Repository
public interface AppointmentRepo extends JpaRepository<Appointment,Long> {
    // Randevuları tarih aralığına ve doktora göre filtreleme
    List<Appointment> findByAppointmentDateBetweenAndDoctor_Id(LocalDate startDate, LocalDate endDate, Long id);

    // Randevuları tarih aralığına ve hayvana göre filtreleme
    List<Appointment> findByAppointmentDateBetweenAndAnimalId(
            LocalDateTime startDate, LocalDateTime endDate, Long id);
    boolean existsByAppointmentDateAndDoctor_Id(LocalDateTime appointmentDate, long id);


}
