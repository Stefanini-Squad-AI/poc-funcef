inherited frmCadDiasBloqMod: TfrmCadDiasBloqMod
  Left = 231
  Top = 143
  Caption = 'Cadastro de Dias Bloqueados por Módulo'
  ClientHeight = 242
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 156
    object GroupBox1: TGroupBox
      Left = 19
      Top = 29
      Width = 470
      Height = 92
      TabOrder = 0
      object Label2: TLabel
        Left = 18
        Top = 26
        Width = 42
        Height = 13
        Caption = 'Módulo'
      end
      object Label1: TLabel
        Left = 375
        Top = 26
        Width = 68
        Height = 13
        Caption = 'No. de Dias'
      end
      object dbNumDias: TwwDBSpinEdit
        Left = 373
        Top = 41
        Width = 85
        Height = 21
        Increment = 1
        DataField = 'NUMDIAS'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object dblkModulo: TwwDBLookupCombo
        Left = 16
        Top = 40
        Width = 347
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEMODULO'#9'50'#9'Sistema de Origem')
        DataField = 'IDMODULO'
        DataSource = ds
        LookupTable = cdsModulo
        LookupField = 'IDMODULO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 203
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 258
    Top = 15
  end
  inherited ds: TwwDataSource
    Left = 454
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 312
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 412
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Left = 368
    Top = 15
  end
  object cdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 83
    Top = 132
  end
end
