class PagesController < ApplicationController
  def home
    render :home
  end

  def setup
    @keynotes = Keynote.all
    render :setup
  end

  def cards
    @selected_keys = params.keys
    @display_keys = []
    @selected_keys.each do |id|
      if !id.include?('all')
        if id.to_i != 0
          @display_keys.push(Keynote.find(id.to_i))
        end
      end
    end
    if @selected_keys.include?('all_keys')
      Keynote.all.each { |keynote| @display_keys.push(keynote) }
    else
      if @selected_keys.include?('all_major')
        Keynote.all.each { |keynote| @display_keys.push(keynote) if keynote.mode == "Major" }
      end
      if @selected_keys.include?('all_minor')
        Keynote.all.each { |keynote| @display_keys.push(keynote) if keynote.mode == "minor" }
      end
    end
    if @selected_keys.include?('all_randomize')
      @random = "T"
    else
      @random = "F"
    end
      @display_keys.uniq! { |e| e[:id] }
    render :cards
  end
end
