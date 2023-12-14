package dev.patika.spring.Controller;

import dev.patika.spring.Dto.Request.AppointmentRequest;
import dev.patika.spring.Entity.Appointment;
import dev.patika.spring.Service.AppointmentService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/appointment")
public class AppointmentController {

    private final AppointmentService appointmentService;

    public AppointmentController(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    @GetMapping("/{id}")
    public Appointment findById(@PathVariable("id") long id) {
        return appointmentService.getAppointment(id);
    }

    @PostMapping("/create")
    public ResponseEntity<Appointment> createAppointment(@RequestBody AppointmentRequest appointmentRequest) {
        Appointment createdAppointment = appointmentService.createAppointment(appointmentRequest);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdAppointment);
    }


    @PutMapping("/update")
    public Appointment updateAppointment(@RequestBody Appointment appointment) {
        return appointmentService.updateAppointment(appointment);
    }

    @GetMapping("/find-all")
    public List<Appointment> findAll() {
        return appointmentService.findAllAppointments();
    }


    // Diğer endpoint'ler buraya eklenebilir, örneğin tarih aralığına göre filtreleme gibi
}
