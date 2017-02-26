defmodule PublicHtml.PageView do
  use PublicHtml.Web, :view
  
  def get_volume do
    hash = System.cmd "df", []
    snapshot = elem hash, 0
    [head | tail] = String.split snapshot, "\n"
    volume_info = String.split (List.first tail), " ", trim: true
    [disk_info | [entire_volume
		  | [used_volume | [available_volume | etc]]]] = volume_info
    [entire_volume | [used_volume | [available_volume]]] = 
      Enum.map [entire_volume, used_volume, available_volume], &(elem((Float.parse &1), 0))
    ratio_for_used = used_volume / entire_volume
    ratio_for_available = available_volume / entire_volume
    {ratio_for_used, ratio_for_available, entire_volume}
  end
end
