module ApplicationHelper
  SRM_COLORS = { 0 => '#FFFFFF',
                 1 => '#F3F993', 2 => '#F5F75C', 3 => '#F6F513', 4 => '#EAE615', 5 => '#E0D01B',
                 6 => '#D5BC26', 7 => '#CDAA37', 8 => '#C1963C', 9 => '#BE8C3A', 10 => '#BE823A',
                11 => '#C17A37', 12 => '#BF7138', 13 => '#BC6733', 14 => '#B26033', 15 => '#A85839',
                16 => '#985336', 17 => '#8D4C32', 18 => '#7C452D', 19 => '#6B3A1E', 20 => '#5D341A',
                21 => '#4E2A0C', 22 => '#4A2727', 23 => '#361F1B', 24 => '#261716', 25 => '#231716',
                26 => '#19100F', 27 => '#16100F', 28 => '#120D0C', 29 => '#100B0A', 30 => '#050B0A' }
  # SRM_COLORS = { 0 => '#FFFFFF',
  #                1 => '#FFE699',  2 => '#FFD878',  3 => '#FFCA5A',  4 => '#FFBF42',  5 => '#FBB123',
  #                6 => '#F8A600',  7 => '#F39C00',  8 => '#EA8F00',  9 => '#E58500', 10 => '#DE7C00',
  #               11 => '#D77200', 12 => '#CF6900', 13 => '#CB6200', 14 => '#C35900', 15 => '#BB5100',
  #               16 => '#B54C00', 17 => '#B04500', 18 => '#A63E00', 19 => '#A13700', 20 => '#9B3200',
  #               21 => '#952D00', 22 => '#8E2900', 23 => '#882300', 24 => '#821E00', 25 => '#7B1A00',
  #               26 => '#771900', 27 => '#701400', 28 => '#6A0E00', 29 => '#660D00', 30 => '#5E0B00',
  #               31 => '#5A0A02', 32 => '#600903', 33 => '#520907', 34 => '#4C0505', 35 => '#470606',
  #               36 => '#440607', 37 => '#3F0708', 38 => '#3B0607', 39 => '#3A070B', 40 => '#36080A'}

  def tiny_glass_range low_srm, high_srm
    return 'Color Varies' unless low_srm.present? && high_srm.present?
    raw "<div nowrap>#{tiny_glass(low_srm)}#{low_srm} - #{high_srm}#{tiny_glass(high_srm)}</div>"
  end

  def tiny_glass srm
    glass :srm=>srm, :width=>25, :height=>25
  end

  def glass opts={}
    opts = {:srm=>0, :width=>100, :height=>100}.merge(opts)
    raw "<div class='srm_range' title='hi there' style='#{srm_style(opts[:srm])}; width: #{opts[:width]}px; height: #{opts[:height]}px; display: inline-block;'>
      <img src='/images/glass.png' width='#{opts[:width]}px' height='#{opts[:height]}px' alt='#{opts[:srm]} SRM'/>
    </div>"
  end

  def srm_style srm
    srm = formatted_srm srm
    font = "color: #CCCCCC;" if srm > 16
    "background-color: #{color srm}; #{font}"
  end

  def color srm
    srm  = formatted_srm srm
    SRM_COLORS[srm]
  end

  def with_header style, val, header_text=nil
    raw "<b>#{header_text || val.to_s.capitalize}:</b> #{style.send(val.to_s.downcase)}"
  end

  private
  def formatted_srm srm
    srm = srm.to_i
    max = SRM_COLORS.keys.last
    srm > max ? max : srm
  end

end
