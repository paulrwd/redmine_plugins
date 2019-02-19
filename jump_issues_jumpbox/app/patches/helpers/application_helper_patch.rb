require_dependency 'application_helper'

module JumpToIssuesJumpbox
    module ApplicationHelperPatch
        extend ActiveSupport::Concern

        included do
            unloadable
            alias_method_chain :render_projects_for_jump_box, :jump_to_issues_jumpbox
        end

        def render_projects_for_jump_box_with_jump_to_issues_jumpbox(projects, selected=nil)
            jump = 'issues'
            s = ''.html_safe
            project_tree(projects) do |project, level|
              padding = level * 16
              text = content_tag('span', project.name, :style => "padding-left:#{padding}px;")
              s << link_to(text, project_path(project, :jump => jump), :title => project.name, :class => (project == selected ? 'selected' : nil))
            end
            s
        end
        
    end
end

module JumpToIssues
    module ApplicationHelperPatch
        extend ActiveSupport::Concern

        included do
            unloadable
            alias_method_chain :link_to_project, :jump_to_issues
        end

        def link_to_project_with_jump_to_issues(project, options={}, html_options = nil)
            if project.archived?
              h(project.name)
            else
             options[:jump]='issues' 
             link_to project.name,
                project_url(project, {:only_path => true}.merge(options)),
                html_options
            end
          end
        
    end
end

JumpToIssuesJumpbox::ApplicationHelperPatch.tap do |mod|
    ApplicationHelper.send :include, mod unless ApplicationHelper.include?(mod)
end

JumpToIssues::ApplicationHelperPatch.tap do |mod|
    ApplicationHelper.send :include, mod unless ApplicationHelper.include?(mod)
end