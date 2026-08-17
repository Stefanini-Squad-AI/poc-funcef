inherited frameCndRADCotacao: TframeCndRADCotacao
  inherited pnlBody: TPanel
    inherited pnlDados: TPanel
      inherited lblEtapa: TLabel
        Top = 72
      end
      object Label7: TLabel [1]
        Left = 8
        Top = 7
        Width = 111
        Height = 13
        Caption = 'Grupo de Produtos:'
      end
      inherited dblkpNumEtapaDest: TwwDBLookupCombo
        Top = 86
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
    end
    inherited pnlGrid: TPanel
      inherited dbgrdCondicoes: TwwDBGrid
        Selected.Strings = (
          'DESCGRUPOPROD'#9'77'#9'Grupo de Produtos'
          'NUMETAPADEST'#9'10'#9'Etapa')
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
