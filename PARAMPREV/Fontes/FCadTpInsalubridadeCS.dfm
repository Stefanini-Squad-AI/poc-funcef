inherited frmCadTpInsalubridadeCS: TfrmCadTpInsalubridadeCS
  Left = 135
  Top = 93
  HelpContext = 160176
  Caption = 'Cadastro de Tipos de Periculosidade/Insalubridade'
  ClientHeight = 397
  ClientWidth = 438
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 438
    Height = 311
    object Label1: TLabel
      Left = 28
      Top = 20
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 28
      Top = 65
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object lblFator: TLabel
      Left = 28
      Top = 256
      Width = 106
      Height = 13
      Caption = 'Fator Multiplicador'
    end
    object lblRegra: TLabel
      Left = 28
      Top = 257
      Width = 222
      Height = 13
      Caption = 'Regra Alteradora do Tempo de Serviço'
    end
    object Label5: TLabel
      Left = 28
      Top = 114
      Width = 179
      Height = 13
      Caption = 'Tempo de Permanência Mínimo'
    end
    object Label3: TLabel
      Left = 148
      Top = 134
      Width = 36
      Height = 13
      Caption = 'meses'
    end
    object dbedCodTpInsalubri: TwwDBEdit
      Left = 28
      Top = 33
      Width = 121
      Height = 21
      DataField = 'CODTPINSALUBRI'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDescricao: TwwDBEdit
      Left = 28
      Top = 78
      Width = 379
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedFator: TwwDBEdit
      Left = 28
      Top = 271
      Width = 191
      Height = 21
      DataField = 'FATOR'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblkpcmbIdRegraInsalubri: TwwDBLookupCombo
      Left = 28
      Top = 270
      Width = 377
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Regra')
      DataField = 'IDREGRAINSALUBRI'
      DataSource = ds
      LookupTable = qryRegra
      LookupField = 'IDREGRA'
      ParentFont = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dbedTempoPermanMinimo: TwwDBEdit
      Left = 28
      Top = 127
      Width = 115
      Height = 21
      DataField = 'TEMPOPERMANMINIMO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object rgUtilizarFatorouRegra: TRadioGroup
      Left = 28
      Top = 194
      Width = 383
      Height = 51
      Caption = 'Para calcular o tempo de serviço, utilizar:'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Fator Multiplicador'
        'Regra Alteradora')
      TabOrder = 4
      OnClick = rgUtilizarFatorouRegraClick
    end
    object dbchkFlgTempoContinuo: TDBCheckBox
      Left = 28
      Top = 162
      Width = 255
      Height = 17
      Caption = 'Período para bônus deve ser contínuo'
      DataField = 'FLGTEMPOCONTINUO'
      DataSource = ds
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited Dock972: TDock97
    Width = 438
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 438
    inherited tb97Fundo: TToolbar97
      Left = 266
      DockPos = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      DockPos = 100
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 339
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TPINSALUBRI'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  FATOR = :FATOR,'
      '  IDREGRAINSALUBRI = :IDREGRAINSALUBRI,'
      '  TEMPOPERMANMINIMO = :TEMPOPERMANMINIMO,'
      '  FLGTEMPOCONTINUO = :FLGTEMPOCONTINUO'
      'where'
      '  CODTPINSALUBRI = :OLD_CODTPINSALUBRI')
    InsertSQL.Strings = (
      'insert into TPINSALUBRI'
      '  (CODTPINSALUBRI, DESCRICAO, FATOR, IDREGRAINSALUBRI, '
      'TEMPOPERMANMINIMO, '
      '   FLGTEMPOCONTINUO)'
      'values'
      '  (:CODTPINSALUBRI, :DESCRICAO, :FATOR, :IDREGRAINSALUBRI, '
      ':TEMPOPERMANMINIMO, '
      '   :FLGTEMPOCONTINUO)')
    DeleteSQL.Strings = (
      'delete from TPINSALUBRI'
      'where'
      '  CODTPINSALUBRI = :OLD_CODTPINSALUBRI')
    Left = 259
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CODTPINSALUBRI'
      'DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'TPINSALUBRI')
    CamposChave.Strings = (
      'CODTPINSALUBRI')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT CODTPINSALUBRI, DESCRICAO, FATOR,'
      
        '              IDREGRAINSALUBRI, TEMPOPERMANMINIMO, FLGTEMPOCONTI' +
        'NUO'
      'FROM TPINSALUBRI'
      'WHERE CODTPINSALUBRI =:pCodTpInsalubri'
      'ORDER BY CODTPINSALUBRI')
    Left = 299
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodTpInsalubri'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA  FROM REGRA '
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 17
    Top = 354
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 56
    Top = 355
  end
end
