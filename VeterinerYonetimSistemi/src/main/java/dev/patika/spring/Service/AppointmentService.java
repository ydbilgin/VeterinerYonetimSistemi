package dev.patika.spring.Service;

import dev.patika.spring.Dto.Request.AppointmentRequest;
import dev.patika.spring.Entity.Animal;
import dev.patika.spring.Entity.Appointment;
import dev.patika.spring.Entity.Doctor;
import dev.patika.spring.Repository.AnimalRepo;
import dev.patika.spring.Repository.AppointmentRepo;
import dev.patika.spring.Repository.AvailableDateRepo;
import dev.patika.spring.Repository.DoctorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Service
public class AppointmentService {
    private AppointmentRepo appointmentRepository;
    private DoctorRepo doctorRepository;
    private AvailableDateRepo availableDateRepository;
    private AnimalRepo animalRepo;
    @Autowired
    public AppointmentService(AppointmentRepo appointmentRepository, DoctorRepo doctorRepository, AvailableDateRepo availableDateRepository,AnimalRepo animalRepo) {
        this.appointmentRepository = appointmentRepository;
        this.doctorRepository = doctorRepository;
        this.availableDateRepository = availableDateRepository;
        this.animalRepo = animalRepo;
    }

    // Randevu oluşturma
    public Appointment createAppointment(AppointmentRequest appointmentRequest) {
        Long doctorId = appointmentRequest.getDoctorId();
        LocalDateTime appointmentDateTime = appointmentRequest.getAppointmentDate();
        Long animalId = appointmentRequest.getAnimalId(); // get animalId from the DTO

        if (!doctorRepository.isDoctorAvailableOnDateAndTime(doctorId, appointmentDateTime)) {
            throw new RuntimeException("Doktor bu tarihte çalışmamaktadır!");
        }

        if (appointmentRepository.existsByAppointmentDateAndDoctor_Id(appointmentDateTime, doctorId)) {
            throw new RuntimeException("Girilen tarihte başka bir randevu mevcuttur.");
        }

        Appointment appointment = convertDtoToAppointment(appointmentRequest, animalId);

        return appointmentRepository.save(appointment);
    }


    private Appointment convertDtoToAppointment(AppointmentRequest appointmentRequest, Long animalId) {
        Appointment appointment = new Appointment();
        appointment.setAppointmentDate(appointmentRequest.getAppointmentDate());

        Long doctorId = appointmentRequest.getDoctorId();
        Doctor doctor = doctorRepository.findById(doctorId)
                .orElseThrow(() -> new RuntimeException("Doktor bulunamadı."));
        appointment.setDoctor(doctor);


        Animal animal = animalRepo.findById(animalId)
                .orElseThrow(() -> new RuntimeException("Hayvan bulunamadı."));
        appointment.setAnimal(animal);



        return appointment;
    }







    // Randevu bilgilerini güncelleme
    public Appointment updateAppointment(Appointment appointment) {
        return appointmentRepository.save(appointment);
    }

    // Randevu bilgilerini görüntüleme
    public Appointment getAppointment(Long appointmentId) {
        return appointmentRepository.findById(appointmentId).get();
    }

    // Randevuları tarih aralığına ve doktora göre filtreleme
    public List<Appointment> findAppointmentsByDateAndDoctor(LocalDate startDate, LocalDate endDate, Long doctorId) {
        return appointmentRepository.findByAppointmentDateBetweenAndDoctor_Id(startDate, endDate, doctorId);
    }

    // Randevuları tarih aralığına ve hayvana göre filtreleme
    public List<Appointment> findAppointmentsByDateAndAnimal(LocalDate startDate, LocalDate endDate, Long animalId) {
        LocalDateTime startDateTime = startDate.atStartOfDay();
        LocalDateTime endDateTime = endDate.atTime(23, 59, 59);

        return appointmentRepository.findByAppointmentDateBetweenAndAnimalId(startDateTime, endDateTime, animalId);
    }
    // Randevuların tamamını getirme
    public List<Appointment> findAllAppointments() {
        return appointmentRepository.findAll();
    }


}