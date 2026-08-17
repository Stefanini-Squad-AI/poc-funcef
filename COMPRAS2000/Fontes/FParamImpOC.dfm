inherited FrmParamImpOC: TFrmParamImpOC
  Left = 307
  Top = 133
  Caption = 'Impressão de Ordem de Compras'
  ClientHeight = 298
  ClientWidth = 375
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 375
    Height = 259
    object Label1: TLabel
      Left = 16
      Top = 80
      Width = 101
      Height = 13
      Caption = 'Ordem de Compra'
    end
    object RgImp: TRadioGroup
      Left = 16
      Top = 16
      Width = 337
      Height = 45
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Não Impressas'
        'Já Impressas')
      TabOrder = 0
      OnClick = RgImpClick
    end
    object dblcOC: TCMDBLookupCombo
      Left = 16
      Top = 96
      Width = 337
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NUMOC'#9'10'#9'Nº da O.C.'
        'RAZAOSOCIAL'#9'60'#9'Fornecedor')
      LookupTable = QryOC
      LookupField = 'NUMOC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcOCCloseUp
    end
    object ChkAtend: TCheckBox
      Left = 16
      Top = 136
      Width = 238
      Height = 17
      Caption = 'Ordem de Compra já atendida'
      TabOrder = 2
      OnClick = ChkAtendClick
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 168
      Width = 337
      Height = 73
      Caption = ' Faixa de  Nº da O.C.'#39's '
      TabOrder = 3
      object Label2: TLabel
        Left = 24
        Top = 24
        Width = 17
        Height = 13
        Caption = 'De'
      end
      object Label3: TLabel
        Left = 176
        Top = 24
        Width = 20
        Height = 13
        Caption = 'Até'
      end
      object edNumI: TRealEdit
        Left = 24
        Top = 40
        Width = 137
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object edNumF: TRealEdit
        Left = 176
        Top = 40
        Width = 137
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 259
    Width = 375
    inherited tb97Fundo: TToolbar97
      Left = 203
      DockPos = 203
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 34
      DockPos = 34
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65531
  end
  object QryOC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      OC.NUMOC,'
      '      OC.IDFORCLI,'
      '      P.RAZAOSOCIAL'
      'FROM'
      '     PESSOA P,'
      '     OC'
      'WHERE'
      '      (OC.OCATENDIDA = '#39'F'#39')'
      '  AND (OC.FLGIMPRESSA = '#39'F'#39' )'
      '  AND (OC.IDFORCLI = P.IDPESSOA)'
      'ORDER BY OC.NUMOC')
    ValidateWithMask = True
    Left = 332
    Top = 11
    object QryOCNUMOC: TFloatField
      DisplayLabel = 'Nº da O.C.'
      DisplayWidth = 10
      FieldName = 'NUMOC'
      Origin = 'OC.NUMOC'
    end
    object QryOCRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object QryOCIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Origin = 'OC.IDFORCLI'
      Visible = False
    end
  end
end
