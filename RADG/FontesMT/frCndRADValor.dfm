inherited frameCndRADValor: TframeCndRADValor
  Width = 443
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  Font.Height = -9
  inherited pnlBody: TPanel
    Width = 443
    inherited pnlDados: TPanel
      Width = 441
      inherited lblEtapa: TLabel
        Left = 20
        Top = 183
      end
      object lblValorInicial: TLabel [1]
        Left = 20
        Top = 17
        Width = 72
        Height = 13
        Caption = 'Valor Inicial:'
        FocusControl = dbedtValorInicial
      end
      object lblValorFinal: TLabel [2]
        Left = 20
        Top = 81
        Width = 65
        Height = 13
        Caption = 'Valor Final:'
        FocusControl = dbedtValorFinal
      end
      inherited DockOkCancelar: TDock97
        Left = 351
      end
      object dbedtValorInicial: TDBEdit [4]
        Left = 20
        Top = 31
        Width = 110
        Height = 21
        DataField = 'VLRINICIAL'
        DataSource = dsCondicoes
        TabOrder = 0
      end
      object dbedtValorFinal: TDBEdit [5]
        Left = 20
        Top = 95
        Width = 110
        Height = 21
        DataField = 'VLRFINAL'
        DataSource = dsCondicoes
        TabOrder = 1
      end
      inherited dblkpNumEtapaDest: TwwDBLookupCombo
        Left = 20
        Top = 197
        TabOrder = 2
      end
    end
    inherited pnlGrid: TPanel
      Width = 441
      inherited dbgrdCondicoes: TwwDBGrid
        Width = 441
        Selected.Strings = (
          'VLRINICIAL'#9'30'#9'Valor Inicial'
          'VLRFINAL'#9'30'#9'Valor Final'
          'NUMETAPADEST'#9'27'#9'Etapa'#9'F')
        TitleFont.Height = -9
      end
      inherited Dock: TDock97
        Width = 441
      end
    end
  end
  inherited ImlPadrao: TImageList
    Left = 568
    Top = 71
  end
  inherited dsCondicoes: TDataSource
    Left = 603
    Top = 75
  end
end
