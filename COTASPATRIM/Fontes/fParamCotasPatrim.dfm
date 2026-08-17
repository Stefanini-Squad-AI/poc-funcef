inherited frmParamCotasPatrim: TfrmParamCotasPatrim
  Left = 475
  Top = 178
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 463
  ClientWidth = 422
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 422
    Height = 424
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 420
      Height = 422
      ActivePage = tabNomesParaRegra
      Align = alClient
      TabOrder = 0
      object tabGeral: TTabSheet
        Caption = 'Configurações gerais'
        object lblGrupoRegra: TLabel
          Left = 10
          Top = 8
          Width = 96
          Height = 13
          Caption = 'Grupo de regras:'
        end
        object lblRoteiroSaldoAplicado: TLabel
          Left = 10
          Top = 64
          Width = 225
          Height = 13
          Caption = 'Roteiro de apuração do saldo aplicado:'
        end
        object dblkpGrupoRegra: TwwDBLookupCombo
          Left = 10
          Top = 24
          Width = 359
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'45'#9'DESCRICAO'#9'F')
          DataField = 'IDGRUPOREGRA'
          DataSource = dts
          LookupTable = cdsGrupoRegra
          LookupField = 'IDGRUPOREGRA'
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpRoteiroSaldoAplicado: TwwDBLookupCombo
          Left = 10
          Top = 80
          Width = 359
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'65'#9'NOME'#9'F')
          DataField = 'IDCPROTEIRO'
          DataSource = dts
          LookupTable = cdsTipoRoteiro
          LookupField = 'IDCPROTEIRO'
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object dbCotaDiaUtil: TDBCheckBox
          Left = 10
          Top = 120
          Width = 263
          Height = 17
          Caption = 'Calcular cotas apenas em dias úteis.'
          DataField = 'FLGCOTADIAUTIL'
          DataSource = dts
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tabNomesParaRegra: TTabSheet
        Caption = 'Nomes para Regra'
        ImageIndex = 1
        object lblSLDAPLICADO: TLabel
          Left = 10
          Top = 8
          Width = 244
          Height = 13
          Caption = 'Saldo total dos investimentos no fim do dia'
        end
        object lblSLDATIVOANT: TLabel
          Left = 10
          Top = 56
          Width = 270
          Height = 13
          Caption = 'Saldo do ativo no fim do dia anterior (em cotas)'
        end
        object lblSAIDAINVEST: TLabel
          Left = 10
          Top = 104
          Width = 224
          Height = 13
          Caption = 'Valor total das saídas de investimentos'
        end
        object lblENTRINVEST: TLabel
          Left = 10
          Top = 152
          Width = 237
          Height = 13
          Caption = 'Valor total das entradas em investimentos'
        end
        object lblSALDOANTCTA: TLabel
          Left = 10
          Top = 200
          Width = 264
          Height = 13
          Caption = 'Saldo em conta-corrente no fim do dia anterior'
        end
        object lblSALDOATUCTA: TLabel
          Left = 10
          Top = 248
          Width = 217
          Height = 13
          Caption = 'Saldo em conta-corrente no fim do dia'
        end
        object lblENTRRENT: TLabel
          Left = 10
          Top = 296
          Width = 313
          Height = 13
          Caption = 'Entradas em conta-corrente que afetam a rentabilidade'
        end
        object lblSAIDARENT: TLabel
          Left = 10
          Top = 344
          Width = 301
          Height = 13
          Caption = 'Saídas de conta-corrente que afetam a rentabilidade'
        end
        object dbedtSLDAPLICADO: TDBEdit
          Left = 10
          Top = 24
          Width = 390
          Height = 21
          DataField = 'NRSLDAPLICADO'
          DataSource = dts
          TabOrder = 0
        end
        object dbedtSLDATIVOANT: TDBEdit
          Left = 10
          Top = 72
          Width = 390
          Height = 21
          DataField = 'NRSLDATIVOANT'
          DataSource = dts
          TabOrder = 1
        end
        object dbedtSAIDAINVEST: TDBEdit
          Left = 10
          Top = 120
          Width = 390
          Height = 21
          DataField = 'NRSAIDAINVEST'
          DataSource = dts
          TabOrder = 2
        end
        object dbedtENTRINVEST: TDBEdit
          Left = 10
          Top = 168
          Width = 390
          Height = 21
          DataField = 'NRENTRINVEST'
          DataSource = dts
          TabOrder = 3
        end
        object dbedtSALDOANTCTA: TDBEdit
          Left = 10
          Top = 216
          Width = 390
          Height = 21
          DataField = 'NRSALDOANTCTA'
          DataSource = dts
          TabOrder = 4
        end
        object dbedtSALDOATUCTA: TDBEdit
          Left = 10
          Top = 264
          Width = 390
          Height = 21
          DataField = 'NRSALDOATUCTA'
          DataSource = dts
          TabOrder = 5
        end
        object dbedtENTRRENT: TDBEdit
          Left = 10
          Top = 312
          Width = 390
          Height = 21
          DataField = 'NRENTRRENT'
          DataSource = dts
          TabOrder = 6
        end
        object dbedtSAIDARENT: TDBEdit
          Left = 10
          Top = 360
          Width = 390
          Height = 21
          DataField = 'NRSAIDARENT'
          DataSource = dts
          TabOrder = 7
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 422
    inherited tb97Fundo: TToolbar97
      Left = 250
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 81
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 515
    Top = 313
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 312
  end
  object cdsGrupoRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 312
  end
  object dts: TDataSource
    DataSet = cds
    Left = 595
    Top = 312
  end
  object cdsTipoRoteiro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 312
  end
end
