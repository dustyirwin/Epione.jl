function get_patient_data_by_MRN(MRN)
    for p in all(Patients.Patient)
        if p.MRN == MRN
            return p end end
    error("No record found with MRN $MRN") end
