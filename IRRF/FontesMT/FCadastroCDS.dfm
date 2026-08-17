inherited frmCadastroCDS: TfrmCadastroCDS
  Left = 371
  Top = 317
  Caption = 'frmCadastroCDS'
  ClientHeight = 298
  ClientWidth = 552
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 552
    Height = 212
  end
  inherited Dock972: TDock97
    Width = 552
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        OnClick = sbtnInserirClick
      end
      inherited sbtnAlterar: TToolbarButton97
        OnClick = sbtnAlterarClick
      end
      inherited sbtnProcurar: TToolbarButton97
        OnClick = sbtnProcurarClick
      end
      inherited sbtnApagar: TToolbarButton97
        OnClick = sbtnApagarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 259
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 346
      DockPos = 346
      inherited bbtnAjuda: TmaHelpBitBtn
        Caption = 'Ajuda'
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 169
      DockPos = 169
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 24
    Top = 46
  end
  inherited ds: TwwDataSource
    Left = 147
    Top = 46
  end
  object upd: TUpdateSQL [5]
    Left = 187
    Top = 46
  end
  object MontaSelect: TMontaSelect [6]
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 269
    Top = 46
  end
  inherited ImlPadrao: TImageList
    Left = 65
    Top = 46
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnInsert = CmeCadastroInsert
    OnDelete = CmeCadastroDelete
    OnEdit = CmeCadastroEdit
    OnCancel = CmeCadastroCancel
    OnConfirma = CmeCadastroConfirma
    OnAtualizaBotoes = CmeCadastroAtualizaBotoes
    Left = 116
    Top = 104
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 47
  end
end
