module PaginationHelper
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected

      def page_number(page)
        unless page == current_page
          link(page, page, :rel => rel_value(page))
        else
          link(page, "#", :class => 'active')
        end
      end
      def gap
        text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
        %(<li class="disabled"><a>#{text}</a></li>)
      end
      def previous_page
        num = @collection.current_page > 1 && @collection.current_page - 1
        previous_or_next_page(num, '', 'glyphicon glyphicon-arrow-left')
      end
      def next_page
        num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
        previous_or_next_page(num, '', 'glyphicon glyphicon-arrow-right')
      end
      def previous_or_next_page(page, text, classname)
        if page
          link(text, page, :class => classname)
        else
          link(text, "#", :class => classname + ' disabled')
        end
      end
      def html_container(html)
        tag(:div, html, container_attributes)
      end

    private

      def link(text, target, attributes = {})
        if target.is_a? Fixnum
          attributes[:rel] = rel_value(target)
          target = url(target)
        end

        unless target == "#"
          attributes[:href] = target
        end

        attributes.delete(:classname)
        tag(:a, text, attributes)
      end
  end
end