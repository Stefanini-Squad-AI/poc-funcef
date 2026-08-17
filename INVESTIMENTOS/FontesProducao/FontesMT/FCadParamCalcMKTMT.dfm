inherited frmCadParamCalcMKTMT: TfrmCadParamCalcMKTMT
  Left = 418
  Top = 269
  Caption = 'frmCadParamCalcMKTMT'
  ClientHeight = 284
  ClientWidth = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 469
    Height = 167
    inherited pnlControles: TPanel
      Width = 467
      Height = 165
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object lblTipoItem: TLabel
        Left = 16
        Top = 19
        Width = 94
        Height = 13
        Caption = 'Classe de Título'
      end
      object Label1: TLabel
        Left = 16
        Top = 75
        Width = 110
        Height = 13
        Caption = 'Formato de Cálculo'
      end
      object dblClasseTit: TCMDBLookupCombo
        Left = 16
        Top = 34
        Width = 281
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'30'#9'Descrição'#9'F')
        DataField = 'IDCLASSETIT'
        DataSource = ds
        LookupTable = cdsClasseTit
        LookupField = 'IDCLASSETIT'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblFormaCalc: TCMDBLookupCombo
        Left = 16
        Top = 90
        Width = 281
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFORMACALCMKT'#9'20'#9'Descrição'#9'F')
        DataField = 'IDFORMACALCMKT'
        DataSource = ds
        LookupTable = cdsFormatoCalc
        LookupField = 'IDFORMACALCMKT'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 467
      Height = 165
      Selected.Strings = (
        'DESCCLASSETIT'#9'46'#9'Classe'
        'DESCFORMACALCMKT'#9'16'#9'Tipo de Cálculo')
    end
  end
  inherited Dock972: TDock97
    Width = 469
  end
  inherited Dock971: TDock97
    Top = 245
    Width = 469
    inherited tb97Fundo: TToolbar97
      Left = 297
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
    end
    inherited fraMens: TfraMensagem
      Width = 129
      inherited pnlProgresso: TPanel
        Width = 129
        inherited pnlProgressoMensagem: TPanel
          Width = 72
          inherited lblProgressoMensagem: TfcLabel
            Width = 70
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 73
          Width = 55
          inherited pgbProcesso: TProgressBar
            Width = 53
          end
        end
      end
    end
  end
  inherited pnlTitulo: TPanel
    Width = 469
    inherited lbNomItem: TfcLabel
      Width = 442
      Caption = 'Parâmetros de Calculo do Valor de Mercado'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 250
  end
  inherited ds: TwwDataSource
    Left = 368
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 248
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 312
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 340
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CLASSETITRENFIX.DESCCLASSETIT'
      'FORMACALCMKT.DESCFORMACALCMKT')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Classe de Título'
      'Forma de Cálculo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PARAMCALCMKT'
      'FORMACALCMKT'
      'CLASSETITRENFIX')
    CamposChave.Strings = (
      'PARAMCALCMKT.IDCLASSETIT'
      'PARAMCALCMKT.IDFORMACALCMKT')
    Filtro.Strings = (
      'PARAMCALCMKT.IDFORMACALCMKT = FORMACALCMKT.IDFORMACALCMKT'
      'PARAMCALCMKT.IDCLASSETIT = CLASSETITRENFIX.IDCLASSETIT')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 248
  end
  inherited CdsAux: TCMClientDataSet
    Left = 426
    Top = 7
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 280
    Top = 4
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.DESCCLASSETIT, F.DESCFORMACALCMKT, P.IDFORMACALCMKT, P.' +
        'IDCLASSETIT, P.IDPARAMCALCMKT '
      'FROM PARAMCALCMKT P, FORMACALCMKT F, CLASSETITRENFIX C '
      'WHERE P.IDFORMACALCMKT = F.IDFORMACALCMKT '
      '  AND P.IDCLASSETIT = C.IDCLASSETIT '
      'ORDER BY C.DESCCLASSETIT, F.DESCFORMACALCMKT')
    Left = 396
    Top = 8
  end
  object cdsClasseTit: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 308
    Top = 103
    Data = {
      B30000009619E0BD010000001800000004000000000003000000B3000D444553
      43434C415353455449540100490000000100055749445448020002001E001044
      455343464F524D4143414C434D4B540100490000000100055749445448020002
      0014000E4944464F524D4143414C434D4B5408000400000000000B4944434C41
      535345544954080004000000000002000D44454641554C545F4F524445520200
      82000200000001000200044C4349440400010009080000}
  end
  object cdsFormatoCalc: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 308
    Top = 159
    Data = {
      8D0000009619E0BD01000000180000000200030000000300000063000E494446
      4F524D4143414C434D4B5408000400000000001044455343464F524D4143414C
      434D4B5401004900000001000557494454480200020014000100044C43494404
      000100090800000000000000000000F03F034E544E0000000000000000004003
      4C465400000000000000000840034C544E}
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM CLASSETITRENFIX')
    Left = 337
    Top = 103
  end
  object CMSqlParams3: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM FORMACALCMKT')
    ClientDataSet = cdsFormatoCalc
    Left = 337
    Top = 159
  end
end
