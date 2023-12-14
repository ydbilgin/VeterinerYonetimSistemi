package dev.patika.spring.Repository;

import dev.patika.spring.Entity.AvailableDate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;
@Repository
public interface AvailableDateRepo extends JpaRepository<AvailableDate,Long> {
    boolean existsByDoctorIdAndAvailableDate(Long doctorId, LocalDate availableDate);

    Optional<AvailableDate> findByDoctorIdAndAvailableDate(Long doctorId, LocalDate availableDate);
}
