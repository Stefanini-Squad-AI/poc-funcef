inherited frmCadTipoContrib: TfrmCadTipoContrib
  Left = 530
  Top = 245
  Caption = 'Cadastro de Tipo Contribuição'
  ClientHeight = 279
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 193
    object lblCodigo: TLabel
      Left = 32
      Top = 18
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object lblTipoContrib: TLabel
      Left = 32
      Top = 74
      Width = 119
      Height = 13
      Caption = 'Tipo de Contribuição'
    end
    object dbedtCodigo: TwwDBEdit
      Left = 32
      Top = 34
      Width = 65
      Height = 21
      Color = clSilver
      DataField = 'IDTPCONTRIBUICAO'
      DataSource = ds
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedtTipoContrib: TwwDBEdit
      Left = 32
      Top = 90
      Width = 401
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbchkDeficit: TDBCheckBox
      Left = 32
      Top = 122
      Width = 255
      Height = 17
      Caption = 'Tipo de Contribuições do Déficit'
      DataField = 'FLGDEFICIT'
      DataSource = ds
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited Dock971: TDock97
    Top = 240
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 288
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 411
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TPCONTRIBUICAO'
      'set'
      '  NOME = :NOME,'
      '  FLGDEFICIT= :FLGDEFICIT'
      'where'
      '  IDTPCONTRIBUICAO = :OLD_IDTPCONTRIBUICAO')
    InsertSQL.Strings = (
      'insert into TPCONTRIBUICAO'
      '  (IDTPCONTRIBUICAO, NOME, FLGDEFICIT)'
      'values'
      '  (:IDTPCONTRIBUICAO, :NOME, :FLGDEFICIT)')
    DeleteSQL.Strings = (
      'delete from TPCONTRIBUICAO'
      'where'
      '  IDTPCONTRIBUICAO = :OLD_IDTPCONTRIBUICAO')
    Left = 451
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TP.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Contribuição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TPCONTRIBUICAO TP')
    CamposChave.Strings = (
      'TP.IDTPCONTRIBUICAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    OperComparador.Strings = (
      '-1')
    ApenasLetraENum.Strings = (
      'N')
    ComparaMaiuscula.Strings = (
      '')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 477
    Top = 62
  end
  inherited ImlPadrao: TImageList
    Left = 329
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 492
    Top = 14
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    BeforePost = qryBeforePost
    SQL.Strings = (
      'select IDTPCONTRIBUICAO,'
      '       NOME,'
      '       FLGGERABENEF,'
      '       NVL(FLGDEFICIT, 0) FLGDEFICIT '
      '  from TPCONTRIBUICAO'
      'where IDTPCONTRIBUICAO = :pIDTPCONTRIBUICAO'
      ' ')
    Left = 370
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIDTPCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 477
    Top = 116
  end
end
