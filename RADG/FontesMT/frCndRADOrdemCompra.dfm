inherited frameCndRADOrdemCompra: TframeCndRADOrdemCompra
  inherited pnlBody: TPanel
    inherited pnlGrid: TPanel [0]
      inherited dbgrdCondicoes: TwwDBGrid
        Selected.Strings = (
          'DESCGRUPOPROD'#9'50'#9'Grupo de Produtos'
          'VLRINICIAL'#9'15'#9'Vl. Inicial'
          'VLRFINAL'#9'15'#9'Vl. Final'
          'NUMETAPADEST'#9'7'#9'Etapa')
      end
    end
    inherited pnlDados: TPanel [1]
      inherited lblEtapa: TLabel
        Top = 120
      end
      object Label7: TLabel [1]
        Left = 8
        Top = 7
        Width = 111
        Height = 13
        Caption = 'Grupo de Produtos:'
      end
      object lblValorInicial: TLabel [2]
        Left = 9
        Top = 64
        Width = 72
        Height = 13
        Caption = 'Valor Inicial:'
        FocusControl = dbedtValorInicial
      end
      object lblValorFinal: TLabel [3]
        Left = 148
        Top = 64
        Width = 65
        Height = 13
        Caption = 'Valor Final:'
        FocusControl = dbedtValorFinal
      end
      inherited dblkpNumEtapaDest: TwwDBLookupCombo
        Top = 134
        TabOrder = 3
      end
      object dblkpGrupoProd: TCMDBLookupCombo
        Left = 8
        Top = 22
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCGRUPOPROD'#9'30'#9'Descrição'
          'CODGRUPOPROD'#9'10'#9'Código')
        DataField = 'CODGRUPOPROD'
        DataSource = dsCondicoes
        LookupTable = cdsGrupoProd
        LookupField = 'CODGRUPOPROD'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbedtValorInicial: TDBEdit
        Left = 9
        Top = 79
        Width = 110
        Height = 21
        DataField = 'VLRINICIAL'
        DataSource = dsCondicoes
        TabOrder = 1
      end
      object dbedtValorFinal: TDBEdit
        Left = 148
        Top = 79
        Width = 110
        Height = 21
        DataField = 'VLRFINAL'
        DataSource = dsCondicoes
        TabOrder = 2
      end
    end
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 187
    Top = 77
  end
end
