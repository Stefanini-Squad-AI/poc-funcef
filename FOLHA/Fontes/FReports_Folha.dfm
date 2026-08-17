inherited FrmReports_Folha: TFrmReports_Folha
  Left = 138
  Top = 168
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FrmReports_Folha'
  ClientHeight = 326
  ClientWidth = 411
  FormStyle = fsNormal
  Visible = False
  OnCreate = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 411
    Height = 287
    object RdoTipoFolha: TRadioGroup
      Left = 8
      Top = 5
      Width = 395
      Height = 33
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Prévia'
        'Efetivada')
      TabOrder = 0
      OnClick = RdoTipoFolhaClick
    end
    object RdoTipoFiltro: TRadioGroup
      Left = 8
      Top = 37
      Width = 395
      Height = 33
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Por Versão'
        'Por Mês')
      TabOrder = 1
      OnClick = RdoTipoFiltroClick
    end
    object PnlPreviaouEfetivada: TPanel
      Left = 8
      Top = 80
      Width = 395
      Height = 89
      BevelInner = bvLowered
      Enabled = False
      TabOrder = 2
      object PnlMesPagto: TPanel
        Left = 8
        Top = 48
        Width = 380
        Height = 35
        TabOrder = 1
        object LblMesPagto: TLabel
          Left = 8
          Top = 8
          Width = 109
          Height = 13
          Caption = 'Mês de Pagamento'
        end
        object CmbMes: TComboBox
          Left = 152
          Top = 7
          Width = 145
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
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
        object SpnedAno: TSpinEdit
          Left = 305
          Top = 6
          Width = 66
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 0
        end
      end
      object PnlLoteouVersao: TPanel
        Left = 8
        Top = 5
        Width = 380
        Height = 35
        TabOrder = 0
        object LblLoteouVersao: TLabel
          Left = 8
          Top = 8
          Width = 26
          Height = 13
          Caption = 'Lote'
        end
        object dblkLoteouVersao: TwwDBLookupCombo
          Left = 73
          Top = 6
          Width = 298
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          LookupTable = qryPreviaouEfetivada
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 287
    Width = 411
    inherited tb97Fundo: TToolbar97
      Left = 239
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 70
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 379
  end
  object qryPreviaouEfetivada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDLOTE,'
      '  DESCRICAO AS LOTE'
      ''
      'FROM'
      '  CTRLINTERFACE'
      ''
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 197
  end
  object dsPreviaouEfetivada: TwwDataSource
    DataSet = qryPreviaouEfetivada
    Left = 168
    Top = 197
  end
end
