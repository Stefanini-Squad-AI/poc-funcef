inherited frmCadBenefSeguro: TfrmCadBenefSeguro
  Left = 138
  Top = 101
  Caption = 'Cadastro de Beneficiários de Seguro'
  ClientHeight = 388
  ClientWidth = 524
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel [0]
    Left = 30
    Top = 60
    Width = 62
    Height = 13
    Caption = 'Percentual'
  end
  inherited pnlFundo: TPanel
    Width = 524
    Height = 355
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 121
      Height = 13
      Caption = 'Inscrição Empréstimo'
    end
    object Label2: TLabel
      Left = 144
      Top = 10
      Width = 50
      Height = 13
      Caption = 'Mutuário'
    end
    object btnTransfere: TSpeedButton
      Left = 481
      Top = 50
      Width = 32
      Height = 111
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333090333
        33333333337F7F33333333333309033333333333337373F33333333330999033
        3333333337F337F33333333330999033333333333733373F3333333309999903
        333333337F33337F33333333099999033333333373333373F333333099999990
        33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333300033333333333337773333333}
      NumGlyphs = 2
      OnClick = btnTransfereClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 168
      Width = 505
      Height = 177
      Caption = ' Beneficiário do Seguro '
      TabOrder = 3
      object Label3: TLabel
        Left = 16
        Top = 18
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 424
        Top = 18
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object Label9: TLabel
        Left = 16
        Top = 98
        Width = 111
        Height = 13
        Caption = 'Outras Informações'
      end
      object Label5: TLabel
        Left = 248
        Top = 58
        Width = 37
        Height = 13
        Caption = 'Banco'
      end
      object Label6: TLabel
        Left = 304
        Top = 58
        Width = 47
        Height = 13
        Caption = 'Agência'
      end
      object Label7: TLabel
        Left = 384
        Top = 58
        Width = 86
        Height = 13
        Caption = 'Conta Corrente'
      end
      object Label10: TLabel
        Left = 16
        Top = 58
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label11: TLabel
        Left = 80
        Top = 58
        Width = 51
        Height = 13
        Caption = 'Telefone'
      end
      object edtNome: TEdit
        Left = 16
        Top = 32
        Width = 393
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
      end
      object edtPercentual: TRealEdit
        Left = 424
        Top = 32
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object memObs: TMemo
        Left = 16
        Top = 112
        Width = 473
        Height = 53
        MaxLength = 980
        TabOrder = 7
      end
      object edtBanco: TRealEdit
        Left = 248
        Top = 72
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      '
          '0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object edtAgencia: TEdit
        Left = 304
        Top = 72
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 5
      end
      object edtConta: TEdit
        Left = 384
        Top = 72
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 6
      end
      object mskDDD: TEdit
        Left = 16
        Top = 72
        Width = 49
        Height = 21
        MaxLength = 5
        TabOrder = 2
      end
      object mskTelefone: TEdit
        Left = 80
        Top = 72
        Width = 81
        Height = 21
        MaxLength = 9
        TabOrder = 3
      end
    end
    object edtInscricao: TEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeMutuario: TEdit
      Left = 144
      Top = 24
      Width = 369
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object wwDBGrid1: TwwDBGrid
      Left = 8
      Top = 50
      Width = 474
      Height = 111
      Selected.Strings = (
        'NOME'#9'65'#9'Beneficiários do Mutuário'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsDepen
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 355
    Width = 524
    inherited tb97Fundo: TToolbar97
      Left = 352
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 180
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qryDepen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PES.NOME'
      'FROM'
      '   PESSOA   PES,'
      '   DEPENTIT DEP'
      'WHERE'
      '       DEP.IDTITULAR      =:PIDTITULAR'
      '   AND DEP.IDTITULAR     <> DEP.IDPESSOA'
      '   AND DEP.IDPESSOA      <>:PIDBENEF'
      '   AND DEP.IDDEPENDENCIA <> '#39'PRP'#39
      '   AND DEP.IDPESSOA       = PES.IDPESSOA')
    ValidateWithMask = True
    Left = 408
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptInput
        Value = '8'
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end>
    object qryDepenNOME: TStringField
      DisplayLabel = 'Beneficiários do Mutuário'
      DisplayWidth = 65
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object dsDepen: TDataSource
    DataSet = qryDepen
    Left = 344
    Top = 96
  end
  object qryInsertBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONTRATOXBENEFSEG'
      '('
      '  IDINSCRICAOEMPTMO,'
      '  IDBENEFSEGURO,'
      '  NOME,'
      '  OBS,'
      '  PERCINDENIZACAO,'
      '  NUMBANCO,'
      '  CODAGENCIA,'
      '  CONTACORRENTE'
      ')'
      'VALUES'
      '('
      '  :PIDINSCRICAOEMPTMO,'
      '  SEQCONTRATOXBENEFSEG.NEXTVAL,'
      '  :PNOME,'
      '  :POBS,'
      '  :PPERCINDENIZACAO,'
      '  :PNUMBANCO,'
      '  :PCODAGENCIA,'
      '  :PCONTACORRENTE'
      ')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 264
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PPERCINDENIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMBANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODAGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCONTACORRENTE'
        ParamType = ptInput
      end>
  end
  object qryUpdateBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CONTRATOXBENEFSEG'
      'SET'
      '  NOME            = :PNOME,'
      '  OBS             = :POBS,'
      '  PERCINDENIZACAO = :PPERCINDENIZACAO,'
      '  NUMBANCO        = :PNUMBANCO,'
      '  CODAGENCIA      = :PCODAGENCIA,'
      '  CONTACORRENTE   = :PCONTACORRENTE'
      'WHERE'
      '    IDINSCRICAOEMPTMO = :PIDINSCRICAOEMPTMO'
      'AND IDBENEFSEGURO     = :PIDBENEFSEG'
      ''
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PPERCINDENIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMBANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODAGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCONTACORRENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFSEG'
        ParamType = ptInput
      end>
  end
  object qryVerifica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    NOME,'
      '    PERCINDENIZACAO'
      'FROM'
      '    CONTRATOXBENEFSEG'
      'WHERE'
      '    IDINSCRICAOEMPTMO = :PIDINSCRICAOEMPTMO')
    ValidateWithMask = True
    Left = 112
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
    object qryVerificaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.NOME'
      Size = 60
    end
    object qryVerificaPERCINDENIZACAO: TFloatField
      FieldName = 'PERCINDENIZACAO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.PERCINDENIZACAO'
    end
  end
end
