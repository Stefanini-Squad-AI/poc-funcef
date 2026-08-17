inherited FrmPRelDivergContrib: TFrmPRelDivergContrib
  Left = 182
  Top = 195
  HelpContext = 180104
  Caption = 'Relatório de Divergência de Contribuições'
  ClientHeight = 200
  ClientWidth = 418
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 418
    Height = 161
    object pnlOrdenacaoeCor: TPanel
      Left = 1
      Top = 109
      Width = 416
      Height = 51
      Align = alBottom
      TabOrder = 0
      object rdoTipoOrdem: TRadioGroup
        Left = 5
        Top = 5
        Width = 294
        Height = 41
        Caption = 'Ordenação do Recebedor'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Matrícula'
          'Inscrição'
          'Recebedor')
        TabOrder = 0
      end
      object grbCor: TGroupBox
        Left = 301
        Top = 5
        Width = 102
        Height = 41
        Caption = 'Escolha a Cor'
        TabOrder = 1
        object lblCor: TLabel
          Left = 8
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Cor :'
        end
        object ccbEscolheCor: TfcColorCombo
          Left = 56
          Top = 14
          Width = 37
          Height = 21
          AutoDropDown = True
          ButtonStyle = cbsEllipsis
          Color = clWhite
          ColorDialog = dlgColor
          ColorListOptions.Font.Charset = DEFAULT_CHARSET
          ColorListOptions.Font.Color = clWindowText
          ColorListOptions.Font.Height = -11
          ColorListOptions.Font.Name = 'MS Sans Serif'
          ColorListOptions.Font.Style = []
          DropDownCount = 8
          ReadOnly = False
          SelectedColor = clWhite
          TabOrder = 0
        end
      end
    end
    object pnlLoteMes: TPanel
      Left = 1
      Top = 1
      Width = 416
      Height = 108
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object lblLote: TLabel
        Left = 10
        Top = 13
        Width = 26
        Height = 13
        Caption = 'Lote'
      end
      object dblkLote: TwwDBLookupCombo
        Left = 48
        Top = 9
        Width = 329
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'LOTE'#9'30'#9'Lote'#9'F')
        LookupTable = qryLote
        LookupField = 'IDLOTE'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object grbMesAnoComparacao: TGroupBox
        Left = 2
        Top = 44
        Width = 412
        Height = 62
        Align = alBottom
        Caption = 'Mês de Referência para Comparação'
        TabOrder = 1
        object lblMes: TLabel
          Left = 16
          Top = 21
          Width = 108
          Height = 13
          Caption = 'Mês de Referência'
        end
        object lblAno: TLabel
          Left = 266
          Top = 21
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object cmbMes: TComboBox
          Left = 16
          Top = 35
          Width = 217
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object speAno: TSpinEdit
          Left = 266
          Top = 35
          Width = 87
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 161
    Width = 418
    inherited tb97Fundo: TToolbar97
      Left = 246
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 77
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 171
  end
  object dlgColor: TColorDialog
    Ctl3D = True
    Left = 307
    Top = 128
  end
  object dsLote: TwwDataSource
    DataSet = qryLote
    Left = 103
    Top = 49
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDLOTE,'
      '  MESREFERENCIA,'
      '  IDLOTE||'#39' - '#39'||DESCRICAO AS LOTE'
      ''
      'FROM'
      '  CTRLINTERFACE'
      ''
      'ORDER BY'
      '  IDLOTE DESC'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 159
    Top = 49
  end
end
