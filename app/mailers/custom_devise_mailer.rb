class CustomDeviseMailer < Devise::Mailer
    def unlock_instructions(record, token, opts={})
        if record.deleted?
            opts[:subject] = "Your account has been scheduled for deletion"
            opts[:template_name] = "deletion_lock_update"
        end
        super
    end
end
