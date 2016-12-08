module Gitlab
  module Ci
    module Status
      module Status
        class Cancelable < SimpleDelegator
          include Status::Extended

          def has_action?
            can?(user, :update_build, subject)
          end

          def action_icon
            'remove'
          end

          def action_path
            cancel_namespace_project_build_path(subject.project.namespace,
                                                subject.project,
                                                subject)
          end

          def action_method
            :post
          end

          def self.matches?(build, user)
            build.cancelable?
          end
        end
      end
    end
  end
end
