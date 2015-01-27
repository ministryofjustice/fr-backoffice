class BackOfficeFormBuilder < ActionView::Helpers::FormBuilder

  def date_fieldset(object, attribute, legend)
   %Q|<fieldset>
      <legend>#{legend}</legend>
      <div class="form-date">
        <div class="form-group form-group-day">
          <label for="#{object}_#{attribute}_3i">Day</label>
          <input class="moj-date-day" id="#{object}_#{attribute}_3i" maxlength="2" name="#{object}[#{attribute}(3i)]" size="2">
        </div>
        <div class="form-group form-group-day">
          <label for="#{object}_#{attribute}_2i">Month</label>
          <input class="moj-date-day" id="#{object}_#{attribute}_3i" maxlength="2" name="#{object}[#{attribute}(2i)]" size="2">
        </div>
        <div class="form-group form-group-day">
          <label for="#{object}_#{attribute}_1i">Year</label>
          <input class="moj-date-day" id="#{object}_#{attribute}_3i" maxlength="4" name="#{object}[#{attribute}(1i)]" size="4">
        </div>
      </div>
    </fieldset>|.html_safe
  end
end