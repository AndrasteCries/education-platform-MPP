# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent subject" do
          ul do
            Subject.recent(5).map do |subj|
              li link_to(subj.title, admin_subject_path(subj))
            end
          end
        end
      end

      column do
        panel "Recent teachers" do
          ul do
            Teacher.recent(5).map do |teacher|
              li link_to(teacher.first_initials, admin_teacher_path(teacher))
            end
          end
        end
      end
    end
  end
end
