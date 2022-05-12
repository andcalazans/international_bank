module BanksHelper
  def selected_bank(bank_type, context)
    render "banks/forms/#{bank_type}", form: context
  end
end
