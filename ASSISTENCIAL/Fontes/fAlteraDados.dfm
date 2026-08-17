inherited frmAlteraDados: TfrmAlteraDados
  Left = 114
  Top = 128
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Alterar Dados de'
  ClientHeight = 268
  ClientWidth = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 535
    Height = 229
    object GroupBox1: TGroupBox
      Left = 9
      Top = 8
      Width = 513
      Height = 105
      Caption = '    Posição Atual    '
      TabOrder = 1
      object lblPosAtual: TLabel
        Left = 24
        Top = 32
        Width = 64
        Height = 13
        Caption = 'lblPosAtual'
      end
      object edtPosAtual: TEdit
        Left = 24
        Top = 48
        Width = 465
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 114
      Width = 513
      Height = 105
      Caption = '    Nova Posição    '
      TabOrder = 0
      object lblNovaPos: TLabel
        Left = 24
        Top = 32
        Width = 65
        Height = 13
        Caption = 'lblNovaPos'
      end
      object DtpNovo: TDateTimePicker
        Left = 24
        Top = 48
        Width = 464
        Height = 21
        CalAlignment = dtaLeft
        Date = 0.472560648202489
        Time = 0.472560648202489
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
        OnChange = DtpNovoChange
      end
      object edtNovaPos: TEdit
        Left = 24
        Top = 48
        Width = 465
        Height = 21
        TabOrder = 0
      end
      object dblNovaPos: TwwDBLookupCombo
        Left = 24
        Top = 48
        Width = 465
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = qry
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblNovaPosChange
        OnKeyPress = dblNovaPosKeyPress
      end
    end
  end
  inherited Dock971: TDock97
    Top = 229
    Width = 535
    inherited tb97Fundo: TToolbar97
      Left = 365
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
    Top = 479
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 FROM DUAL')
    ValidateWithMask = True
    Left = 256
    Top = 12
  end
  object dts: TwwDataSource
    DataSet = qry
    Left = 304
    Top = 8
  end
  object qryPlanosPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANASS,'
      '   NOME,'
      '   OPCAOAIDENT,'
      '   OPCAOBDIF,'
      '   CODPORTFORMA'
      'FROM'
      '   PLANASS'
      'WHERE'
      '   (FLGATIVO = 1) AND'
      '   (IDPLANASS = :IDPLANASS) AND'
      '   (IDPLANASS IN (SELECT P.IDPLANASS'
      '                     FROM'
      
        '                     PARTASS P, BENEFASS BA, PLANPREV PP, PLANAS' +
        'S PA,'
      '                     SITPLANOASS S'
      '                     WHERE'
      '                     (P.IDPESSOA = :IDPESSOA) AND'
      '                     (P.IDPESSOA = BA.IDTITULAR(+)) AND'
      '                     (P.IDPESSJUR = BA.IDPESSJUR(+)) AND'
      '                     (P.IDPLANOPREV = BA.IDPLANOPREV(+)) AND'
      '                     (P.IDPLANASS = BA.IDPLANASS(+)) AND'
      '                     (P.IDPESSOA = BA.IDDEPENDENTE(+)) AND'
      '                     (P.SEQPROPOSTA = BA.SEQPROPOSTA(+)) AND'
      '                     (P.IDPLANASS = PA.IDPLANASS) AND'
      '                     (P.IDPLANOPREV = PP.IDPLANOPREV) AND'
      '                     (P.IDSITPART= S.IDSITPLANOASS)))'
      '')
    ValidateWithMask = True
    Left = 363
    Top = 11
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDPLANASS'
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object StringField2: TStringField
      FieldName = 'OPCAOAIDENT'
      Size = 10
    end
    object StringField3: TStringField
      FieldName = 'OPCAOBDIF'
      Size = 10
    end
    object FloatField2: TFloatField
      FieldName = 'CODPORTFORMA'
    end
  end
  object qryContass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA'
      'FROM CONTASS'
      'WHERE (IDDEPENDENTE=:IDPESSOA) AND'
      '      (IDPLANASS=:IDPLANASS) AND'
      '      (FLGATIVO = 1) AND'
      '      (FLGCOBCARNE = 1)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
end
