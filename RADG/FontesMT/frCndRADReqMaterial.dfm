inherited frameCndRADReqMaterial: TframeCndRADReqMaterial
  Width = 443
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  Font.Height = -9
  inherited pnlBody: TPanel
    Width = 443
    inherited pnlDados: TPanel
      Width = 441
      inherited lblEtapa: TLabel
        Left = 18
        Top = 185
      end
      object lblValorInicial: TLabel [1]
        Left = 19
        Top = 128
        Width = 72
        Height = 13
        Caption = 'Valor Inicial:'
        FocusControl = dbedtValorInicial
      end
      object lblValorFinal: TLabel [2]
        Left = 158
        Top = 128
        Width = 65
        Height = 13
        Caption = 'Valor Final:'
        FocusControl = dbedtValorFinal
      end
      object Label4: TLabel [3]
        Left = 18
        Top = 14
        Width = 96
        Height = 13
        Caption = 'Centro de Custo:'
      end
      object Label7: TLabel [4]
        Left = 298
        Top = 15
        Width = 111
        Height = 13
        Caption = 'Grupo de Produtos:'
      end
      object Label8: TLabel [5]
        Left = 20
        Top = 71
        Width = 112
        Height = 13
        Caption = 'Atividade / Projeto:'
      end
      inherited DockOkCancelar: TDock97
        Left = 351
      end
      object dbedtValorInicial: TDBEdit [7]
        Left = 19
        Top = 143
        Width = 110
        Height = 21
        DataField = 'VLRINICIAL'
        DataSource = dsCondicoes
        TabOrder = 3
      end
      object dbedtValorFinal: TDBEdit [8]
        Left = 158
        Top = 143
        Width = 110
        Height = 21
        DataField = 'VLRFINAL'
        DataSource = dsCondicoes
        TabOrder = 4
      end
      inherited dblkpNumEtapaDest: TwwDBLookupCombo
        Left = 18
        Top = 199
        TabOrder = 5
      end
      object dblkpCentCust: TCMDBLookupCombo
        Left = 18
        Top = 30
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODEXTERNO'#9'10'#9'Código'
          'NOME'#9'30'#9'Descrição')
        DataField = 'CODCENTROCUSTO'
        DataSource = dsCondicoes
        LookupTable = cdsCentroCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkpGrupoProd: TCMDBLookupCombo
        Left = 298
        Top = 30
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
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkpUnidNegocio: TCMDBLookupCombo
        Left = 20
        Top = 87
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNECODIGO'#9'10'#9'Código')
        DataField = 'UNIDNEGOC'
        DataSource = dsCondicoes
        LookupTable = cdsAtivProj
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    inherited pnlGrid: TPanel
      Width = 441
      inherited dbgrdCondicoes: TwwDBGrid
        Width = 441
        Selected.Strings = (
          'CODEXTERNO'#9'18'#9'Centro de Custo'
          'DESCGRUPOPROD'#9'18'#9'Grupo de Produtos'
          'UNECODIGO'#9'18'#9'Atividade x Projeto'
          'VLRINICIAL'#9'12'#9'Vl. Inicial'
          'VLRFINAL'#9'12'#9'Vl. Final'
          'NUMETAPADEST'#9'8'#9'Etapa')
        TitleFont.Height = -9
      end
      inherited Dock: TDock97
        Width = 441
      end
    end
  end
  inherited ImlPadrao: TImageList
    Left = 576
    Top = 95
  end
  inherited dsCondicoes: TDataSource
    Left = 611
    Top = 99
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 475
    Top = 13
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 203
    Top = 13
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 187
    Top = 77
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 476
    Top = 66
  end
end
