inherited frameCndRADDoc: TframeCndRADDoc
  Width = 443
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  Font.Height = -9
  inherited pnlBody: TPanel
    Width = 443
    inherited pnlDados: TPanel
      Width = 441
      inherited lblEtapa: TLabel
        Left = 19
        Top = 185
      end
      object lblCentRespon: TLabel [1]
        Left = 19
        Top = 14
        Width = 164
        Height = 13
        Caption = 'Centro de Responsabilidade:'
      end
      object lblTipoDoc: TLabel [2]
        Left = 19
        Top = 71
        Width = 116
        Height = 13
        Caption = 'Tipo de Documento:'
      end
      object lblValorInicial: TLabel [3]
        Left = 19
        Top = 129
        Width = 72
        Height = 13
        Caption = 'Valor Inicial:'
        FocusControl = dbedtValorInicial
      end
      object lblValorFinal: TLabel [4]
        Left = 280
        Top = 129
        Width = 65
        Height = 13
        Caption = 'Valor Final:'
        FocusControl = dbedtValorFinal
      end
      inherited DockOkCancelar: TDock97
        Left = 351
      end
      object dbedtValorInicial: TDBEdit [6]
        Left = 19
        Top = 143
        Width = 110
        Height = 21
        DataField = 'VLRINICIAL'
        DataSource = dsCondicoes
        TabOrder = 2
      end
      object dbedtValorFinal: TDBEdit [7]
        Left = 280
        Top = 143
        Width = 110
        Height = 21
        DataField = 'VLRFINAL'
        DataSource = dsCondicoes
        TabOrder = 3
      end
      object dblkpCentResp: TCMDBLookupCombo [8]
        Left = 19
        Top = 30
        Width = 372
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODEXTERNO'#9'10'#9'Código'
          'NOME'#9'30'#9'Descrição')
        DataField = 'CODCENTRORESPON'
        DataSource = dsCondicoes
        LookupTable = cdsCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkpTipoDoc: TCMDBLookupCombo [9]
        Left = 19
        Top = 87
        Width = 372
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descriçao'#9'F'
          'RECPAG'#9'16'#9'Sistema'#9'F')
        DataField = 'CODTIPDOC'
        DataSource = dsCondicoes
        LookupTable = cdsTipoDocRecPag
        LookupField = 'CODTIPDOC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      inherited dblkpNumEtapaDest: TwwDBLookupCombo
        Left = 19
        Top = 199
        TabOrder = 4
      end
    end
    inherited pnlGrid: TPanel
      Width = 441
      inherited dbgrdCondicoes: TwwDBGrid
        Width = 441
        Selected.Strings = (
          'CODEXTERNOCR'#9'27'#9'Centro de Responsabilidade'
          'NOMETIPODOC'#9'27'#9'Tipo de Documento'
          'VLRINICIAL'#9'12'#9'Valor Inicial'
          'VLRFINAL'#9'12'#9'Valor Final'
          'NUMETAPADEST'#9'7'#9'Etapa'#9'F')
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
  object cdsTipoDocRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 245
    Top = 90
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 299
    Top = 37
  end
end
