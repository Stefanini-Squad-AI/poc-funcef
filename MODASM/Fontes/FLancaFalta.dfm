inherited frmLancaFalta: TfrmLancaFalta
  Left = 172
  Top = 187
  Caption = 'Lançamento de Faltas'
  ClientHeight = 200
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 161
    BorderWidth = 2
    object Label5: TLabel
      Left = 24
      Top = 76
      Width = 35
      Height = 13
      Caption = 'Faltas'
    end
    object Label4: TLabel
      Left = 477
      Top = 96
      Width = 24
      Height = 13
      Caption = 'dias'
    end
    object dblcFalta: TwwDBLookupCombo
      Left = 24
      Top = 94
      Width = 360
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub1
      LookupField = 'DESCRICAO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object redFalta: TRealEdit
      Left = 404
      Top = 94
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 24
      Top = 25
      Width = 264
      Height = 21
      Color = clGray
      DataField = 'NOME'
      DataSource = frmCadRegOcorr.ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object grpMesRef: TGroupBox
      Left = 303
      Top = 13
      Width = 200
      Height = 40
      Caption = ' Mês e Ano de Referência '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object cmbMes: TComboBox
        Left = 7
        Top = 14
        Width = 115
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
      object spnedAno: TSpinEdit
        Left = 132
        Top = 14
        Width = 58
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 161
    inherited TB97oKCancelar: TToolbar97 [0]
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
    inherited tb97Fundo: TToolbar97 [1]
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
  end
  object qryRub1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 123
    Top = 116
  end
  object tblRubInd: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;IDEMPRESA;IDRUBRICA;SEQRUBRICAINDIV'
    TableName = 'CM.RUBRICAINDIV'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 194
    Top = 116
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, DESCRICAO from MOTIVO order by DESCRICAO')
    ValidateWithMask = True
    Left = 264
    Top = 114
  end
end
