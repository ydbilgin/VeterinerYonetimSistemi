package dev.patika.spring.Repository;

import dev.patika.spring.Entity.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Repository
public interface DoctorRepo extends JpaRepository<Doctor,Long> {

    Doctor findByName(String name);
    @Query("SELECT COUNT(d) = 0 FROM Doctor d " +
            "JOIN d.appointments a " +
            "WHERE d.id = :id " +
            "AND a.appointmentDate = :appointmentDate")
    boolean isDoctorAvailableOnDateAndTime(@Param("id") Long id, @Param("appointmentDate") LocalDateTime appointmentDate);





}
