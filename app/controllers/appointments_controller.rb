class AppointmentsController < ApplicationController
  
  
  
  before_action :set_doctor
  
  def index
    @doctors = @doctor.appointments.where(role: 'doctor')
    @patients = @doctor.appointments.where(role: 'patient')

  end

  def new
    @patients = Patient.all - @doctor.patients
    @appointment = @doctor.appointments.new


  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:role, :date, :time, :patient_id)
  end
end
