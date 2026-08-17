inherited frmCadWebTipoUsuario: TfrmCadWebTipoUsuario
  Left = 200
  Top = 230
  Caption = 'Cadastro de Tipo de Usuário da Web'
  ClientHeight = 150
  ClientWidth = 513
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 513
    Height = 64
    object lblDesc: TLabel
      Left = 8
      Top = 24
      Width = 185
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Descrição do Tipo de Usuário:'
    end
    object dbedtDescTipoUsuario: TDBEdit
      Left = 200
      Top = 22
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCTIPOUSUARIO'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock972: TDock97
    Width = 513
  end
  inherited Dock971: TDock97
    Top = 111
    Width = 513
    inherited tb97Fundo: TToolbar97
      Left = 343
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 176
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 290
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 256
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 392
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 7
    object CdsIDTIPOUSUARIO: TFloatField
      FieldName = 'IDTIPOUSUARIO'
    end
    object CdsDESCTIPOUSUARIO: TStringField
      FieldName = 'DESCTIPOUSUARIO'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'WEBTIPOUSUARIO.DESCTIPOUSUARIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Tipo de Usuário')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'WEBTIPOUSUARIO')
    CamposChave.Strings = (
      'WEBTIPOUSUARIO.IDTIPOUSUARIO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '20')
    Left = 424
    Top = 7
  end
end
