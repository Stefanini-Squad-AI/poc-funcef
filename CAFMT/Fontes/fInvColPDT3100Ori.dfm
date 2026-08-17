inherited frmInvColPDT3100: TfrmInvColPDT3100
  Left = 231
  Top = 191
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Coletor de Dados Seal - PDT 3100'
  ClientHeight = 163
  ClientWidth = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 393
    Height = 124
    object gbConfig: TGroupBox
      Left = 5
      Top = 58
      Width = 383
      Height = 61
      Align = alClient
      Caption = 'Configuração'
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 26
        Width = 67
        Height = 13
        Caption = 'Porta Serial'
      end
      object Label2: TLabel
        Left = 194
        Top = 26
        Width = 64
        Height = 13
        Caption = 'Velocidade'
      end
      object cmbSerial: TComboBox
        Left = 87
        Top = 23
        Width = 97
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8')
      end
      object cmbVeloc: TComboBox
        Left = 271
        Top = 23
        Width = 97
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          '38400'
          '19200'
          '9600'
          '4800'
          '2400'
          '1200'
          '300')
      end
    end
    object pnlOperacao: TPanel
      Left = 5
      Top = 5
      Width = 383
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object rdgpOper: TRadioGroup
        Left = 0
        Top = 0
        Width = 383
        Height = 53
        Align = alClient
        Caption = 'Operação'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Transmissão'
          'Recepção')
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 124
    Width = 393
    inherited tb97Fundo: TToolbar97
      Left = 223
      DockPos = 223
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 55
      DockPos = 55
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Executar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 160
      Top = 40
      Width = 185
      Height = 105
      Caption = 'GroupBox1'
      TabOrder = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryParam: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, CDPORTA, CDVELOC, CDPATH, DIGMASCPLACA'
      'FROM PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDEMPRESA)')
    UpdateObject = updParam
    ValidateWithMask = True
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryParamCDPORTA: TFloatField
      FieldName = 'CDPORTA'
      Origin = 'PARAMETROSCAFMANUT.CDPORTA'
    end
    object qryParamCDVELOC: TStringField
      FieldName = 'CDVELOC'
      Origin = 'PARAMETROSCAFMANUT.CDVELOC'
      Size = 6
    end
    object qryParamIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMETROSCAFMANUT.IDPESSOA'
    end
    object qryParamCDPATH: TStringField
      FieldName = 'CDPATH'
      Size = 128
    end
    object qryParamDIGMASCPLACA: TFloatField
      FieldName = 'DIGMASCPLACA'
    end
  end
  object updParam: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMETROSCAFMANUT'
      'set'
      '  CDPORTA = :CDPORTA,'
      '  CDVELOC = :CDVELOC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMETROSCAFMANUT'
      '  (CDPORTA, CDVELOC)'
      'values'
      '  (:CDPORTA, :CDVELOC)')
    DeleteSQL.Strings = (
      'delete from PARAMETROSCAFMANUT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 88
    Top = 240
  end
  object qryBuscaConjunto: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDCONJUNTO'
      'FROM CONJUNTO'
      'WHERE (IDLOCALIZACAO = :PIDLOCAL)'
      '  AND (IDPESSOA      = :PIDEMPRESA)')
    ValidateWithMask = True
    Left = 168
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryBuscaConjuntoIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.CONJUNTO".IDCONJUNTO'
    end
  end
  object qryBuscaBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDINVENTARIOBENS, IDEMPRESA, IIBPLACA, IIBLOCALATUAL, IIB' +
        'CONJUNTOATUAL,'
      
        '       IIBFLGPLACA, IIBLOCALNOVO, IIBCONJUNTONOVO, IIBFLGSITFISI' +
        'CA'
      'FROM ITENSINVBENS'
      'WHERE (IDINVENTARIOBENS = :IDINVENTARIOBENS)'
      '  AND (IDEMPRESA = :IDEMPRESA)'
      '  AND (IIBPLACA = :IIBPLACA)')
    ValidateWithMask = True
    Left = 256
    Top = 240
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVENTARIOBENS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IIBPLACA'
        ParamType = ptUnknown
      end>
    object qryBuscaBemIDINVENTARIOBENS: TFloatField
      FieldName = 'IDINVENTARIOBENS'
      Origin = '"CM.ITENSINVBENS".IDINVENTARIOBENS'
    end
    object qryBuscaBemIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = '"CM.ITENSINVBENS".IDEMPRESA'
    end
    object qryBuscaBemIIBPLACA: TFloatField
      FieldName = 'IIBPLACA'
      Origin = '"CM.ITENSINVBENS".IIBPLACA'
    end
    object qryBuscaBemIIBLOCALATUAL: TFloatField
      FieldName = 'IIBLOCALATUAL'
      Origin = '"CM.ITENSINVBENS".IIBLOCALATUAL'
    end
    object qryBuscaBemIIBCONJUNTOATUAL: TFloatField
      FieldName = 'IIBCONJUNTOATUAL'
      Origin = '"CM.ITENSINVBENS".IIBCONJUNTOATUAL'
    end
    object qryBuscaBemIIBFLGPLACA: TFloatField
      FieldName = 'IIBFLGPLACA'
      Origin = '"CM.ITENSINVBENS".IIBFLGPLACA'
    end
    object qryBuscaBemIIBLOCALNOVO: TFloatField
      FieldName = 'IIBLOCALNOVO'
      Origin = '"CM.ITENSINVBENS".IIBLOCALNOVO'
    end
    object qryBuscaBemIIBCONJUNTONOVO: TFloatField
      FieldName = 'IIBCONJUNTONOVO'
      Origin = '"CM.ITENSINVBENS".IIBCONJUNTONOVO'
    end
    object qryBuscaBemIIBFLGSITFISICA: TFloatField
      FieldName = 'IIBFLGSITFISICA'
      Origin = '"CM.ITENSINVBENS".IIBFLGSITFISICA'
    end
  end
  object qryLancResult: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'update ITENSINVBENS'
      'set'
      '  IIBFLGPLACA = :IIBFLGPLACA,'
      '  IIBLOCALNOVO = :IIBLOCALNOVO,'
      '  IIBCONJUNTONOVO = :IIBCONJUNTONOVO,'
      '  IIBFLGSITFISICA = :IIBFLGSITFISICA'
      'where'
      '  IDINVENTARIOBENS = :IDINVENTARIOBENS and'
      '  IDEMPRESA = :IDEMPRESA and'
      '  IIBPLACA = :IIBPLACA')
    ValidateWithMask = True
    Left = 336
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IIBFLGPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IIBLOCALNOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IIBCONJUNTONOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IIBFLGSITFISICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDINVENTARIOBENS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IIBPLACA'
        ParamType = ptUnknown
      end>
  end
  object qryInsPlaca: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'INSERT INTO ITENSINVBENS'
      
        '(IDINVENTARIOBENS,IDEMPRESA,IIBPLACA,IIBFLGPLACA,IIBLOCALATUAL,I' +
        'IBCONJUNTOATUAL,'
      ' IIBLOCALNOVO,IIBCONJUNTONOVO,IIBFLGSITFISICA)'
      'VALUES'
      
        '(:IDINVENTARIOBENS,:IDEMPRESA,:IIBPLACA,:IIBFLGPLACA,:IIBLOCALAT' +
        'UAL,:IIBCONJUNTOATUAL,'
      ' :IIBLOCALNOVO,:IIBCONJUNTONOVO,:IIBFLGSITFISICA)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVENTARIOBENS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IIBPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IIBFLGPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IIBLOCALATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IIBCONJUNTOATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IIBLOCALNOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IIBCONJUNTONOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IIBFLGSITFISICA'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaBens: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT B.IDBEM,B.IDCONJUNTO,C.IDLOCALIZACAO'
      'FROM BEM B,'
      '     CONJUNTO C'
      'WHERE (B.PLACA = :PPLACA)'
      '  AND (B.IDPESSOA = :PIDEMPRESA)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)')
    ValidateWithMask = True
    Left = 320
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryBuscaBensIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = '"CM.BEM".IDBEM'
    end
    object qryBuscaBensIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.BEM".IDCONJUNTO'
    end
    object qryBuscaBensIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.CONJUNTO".IDLOCALIZACAO'
    end
  end
end
