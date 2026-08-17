inherited FrmCadObjeto: TFrmCadObjeto
  Left = 436
  Top = 267
  Caption = 'Cadastro de Objeto para Autorização'
  ClientHeight = 161
  ClientWidth = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 399
    Height = 75
    object lblObjeto: TLabel
      Left = 24
      Top = 19
      Width = 38
      Height = 13
      Caption = 'Objeto'
    end
    object dbedtObjeto: TwwDBEdit
      Left = 24
      Top = 33
      Width = 345
      Height = 21
      DataField = 'NOMEOBJETO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 399
  end
  inherited Dock971: TDock97
    Top = 122
    Width = 399
    inherited tb97Fundo: TToolbar97
      Left = 227
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 58
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 472
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 349
    Top = 13
  end
  inherited ImlPadrao: TImageList
    Left = 471
    Top = 65530
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 257
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 349
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OBJETO.NOMEOBJETO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Objeto')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'OBJETO')
    CamposChave.Strings = (
      'OBJETO.IDOBJETO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    OperComparador.Strings = (
      '0')
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
    Left = 256
    Top = 1
  end
end
