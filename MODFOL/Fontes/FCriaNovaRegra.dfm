inherited frmCriaNovaRegra: TfrmCriaNovaRegra
  Caption = 'Cria Nova Regra'
  ClientHeight = 203
  ClientWidth = 430
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 430
    Height = 164
    object Label1: TLabel
      Left = 172
      Top = 43
      Width = 68
      Height = 13
      Caption = 'Num. Inicial'
    end
    object Label2: TLabel
      Left = 25
      Top = 86
      Width = 82
      Height = 13
      Caption = 'Tipo de Regra'
    end
    object spedNumRegra: TSpinEdit
      Left = 171
      Top = 55
      Width = 88
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 10000
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 25
      Top = 101
      Width = 380
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCREGRA'#9'60'#9'DESCREGRA'#9'F')
      LookupTable = qryTipoRegra
      LookupField = 'IDTIPOREGRA'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 164
    Width = 430
    inherited tb97Fundo: TToolbar97
      Left = 260
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 93
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryRubRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.*,'
      '  '#39'Novíssima '#39' || SUBSTR(P1.DESCRPROVDESC,1,40) AS DESCRICAO,'
      
        '  DECODE(R.FLGACAOINCIDE,0,'#39'+ '#39', '#39'- '#39') || '#39'R('#39' || TRIM(P2.CODPRO' +
        'VDESC) || '#39') '#39' AS CODIGO'
      'FROM RUBXRUB R, RUBRICAXPESS P1, RUBRICAXPESS P2'
      'WHERE IDRUBSECUND = P1.IDRUBRICA'
      'AND   P1.IDPESSOA = :IDPESSOA'
      'AND   IDRUBPRINC  = P2.IDRUBRICA'
      'AND   P2.IDPESSOA = P1.IDPESSOA'
      'ORDER BY IDRUBSECUND'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM REGRA')
    UpdateObject = updRegra
    ValidateWithMask = True
    Left = 296
    Top = 56
  end
  object updRegra: TUpdateSQL
    ModifySQL.Strings = (
      'update REGRA'
      'set'
      '  NOMEREGRA = :NOMEREGRA,'
      '  IDTIPOREGRA = :IDTIPOREGRA,'
      '  DESCRICAOREGRA = :DESCRICAOREGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA')
    InsertSQL.Strings = (
      'insert into REGRA'
      '  (IDREGRA, NOMEREGRA, IDTIPOREGRA, DESCRICAOREGRA)'
      'values'
      '  (:IDREGRA, :NOMEREGRA, :IDTIPOREGRA, :DESCRICAOREGRA)')
    DeleteSQL.Strings = (
      'delete from REGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA')
    Left = 296
    Top = 16
  end
  object qryTipoRegra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOREGRA, DESCREGRA'
      'FROM TIPOREGRA'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 88
    Top = 24
  end
end
