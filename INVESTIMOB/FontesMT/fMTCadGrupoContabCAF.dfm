inherited frmMTCadGrupoContabCAF: TfrmMTCadGrupoContabCAF
  HelpContext = 70016
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      inherited rdgrpControle: TDBRadioGroup
        Enabled = False
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Filtro.Strings = (
      'GRUPO.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'GRUPO.FLGIMOVEL = 1')
  end
end
