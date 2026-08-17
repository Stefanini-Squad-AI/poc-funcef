inherited frmCadSubGrupoMT: TfrmCadSubGrupoMT
  Caption = 'Cadastro de Sub-Grupos'
  ClientHeight = 193
  ClientWidth = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 400
    Height = 107
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 62
      Height = 13
      Caption = 'Descrição '
    end
    object dbeNomeSubGrupo: TwwDBEdit
      Left = 24
      Top = 48
      Width = 353
      Height = 21
      DataField = 'DESCSUBGRP'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 400
  end
  inherited Dock971: TDock97
    Top = 154
    Width = 400
    inherited tb97Fundo: TToolbar97
      Left = 230
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 63
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 63
  end
  inherited ds: TwwDataSource
    Left = 342
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 368
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 248
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 300
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SUBGRUPO.DESCSUBGRP')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SUBGRUPO')
    CamposChave.Strings = (
      'SUBGRUPO.CODSUBGRP')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '25')
    Left = 280
    Top = 15
  end
end
