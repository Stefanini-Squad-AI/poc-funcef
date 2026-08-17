inherited frmCadLocatario: TfrmCadLocatario
  Caption = 'Cadastro de Locatários'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        ActivePage = TbsTiposCliente
        inherited tbsContato: TTabSheet
          inherited PnlTelefones_Padrao: TPanel
            inherited LblTelefones_Padrao: TLabel
              Width = 199
            end
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 288
            end
          end
        end
        inherited TbsDadosCliente: TTabSheet
          inherited TbsGeral: TPageControl
            inherited TbsDados: TTabSheet
              inherited Label2: TLabel
                Visible = False
              end
              inherited dbedCodigoCli: TwwDBEdit
                Visible = False
              end
            end
          end
        end
      end
    end
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 669
  end
  object cdsLocatario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsSubTipoAfterOpen
    Left = 597
    Top = 455
  end
end
