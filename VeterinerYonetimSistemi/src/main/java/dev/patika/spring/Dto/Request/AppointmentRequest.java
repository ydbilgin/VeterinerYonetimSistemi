package dev.patika.spring.Dto.Request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AppointmentRequest {

    private long appointmentId;
    private LocalDateTime appointmentDate;
    private long doctorId;
    private long animalId;
}