inherited FrmParamRegraMT: TFrmParamRegraMT
  Caption = 'Parâmetros do Regra MT'
  ClientHeight = 206
  ClientWidth = 354
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 354
    Height = 167
  end
  inherited Dock971: TDock97
    Top = 167
    Width = 354
    inherited tb97Fundo: TToolbar97
      Left = 184
      inherited sep1: TToolbarSep97
        Left = 80
      end
      inherited sep3: TToolbarSep97
        Left = 163
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 17
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 0
    Top = 0
    Width = 354
    Height = 167
    Align = alClient
    Caption = 'Forma de Visualização nos Passos da Regra'
    TabOrder = 2
    object SbtnAlterar: TSpeedButton
      Left = 244
      Top = 134
      Width = 101
      Height = 25
      Caption = '&Alterar Passos'
      Flat = True
      Visible = False
    end
    object sbtnAcertar: TSpeedButton
      Left = 135
      Top = 134
      Width = 106
      Height = 25
      Caption = '&Acertar Formulas'
      Flat = True
      Visible = False
    end
    object DbRbCampo: TDBRadioGroup
      Left = 8
      Top = 24
      Width = 338
      Height = 51
      Caption = 'Campo da Regra'
      Columns = 2
      DataField = 'FLGCAMPO'
      DataSource = ds
      Items.Strings = (
        'Identificador'
        'Descriçao')
      TabOrder = 0
      Values.Strings = (
        '1'
        '0')
    end
    object DbRbVariavel: TDBRadioGroup
      Left = 8
      Top = 82
      Width = 338
      Height = 51
      Caption = 'Variável da Regra'
      Columns = 2
      DataField = 'FLGVARIAVEL'
      DataSource = ds
      Items.Strings = (
        'Identificador'
        'Descriçao')
      TabOrder = 1
      Values.Strings = (
        '1'
        '0')
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 315
    Top = 11
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 252
    Top = 11
    object CdsFLGCAMPO: TFloatField
      FieldName = 'FLGCAMPO'
    end
    object CdsFLGVARIAVEL: TFloatField
      FieldName = 'FLGVARIAVEL'
    end
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 283
    Top = 11
  end
end
