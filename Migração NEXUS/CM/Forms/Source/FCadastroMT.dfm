inherited FrmCadastroMT: TFrmCadastroMT
  Left = 393
  Top = 335
  Caption = 'Cadastro Multi Tier'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97
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
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 26
    Top = 111
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = Cds
    Left = 126
    Top = 39
  end
  inherited ImlPadrao: TImageList
    Left = 24
    Top = 63
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnInsert = CmeCadastroInsert
    OnDelete = CmeCadastroDelete
    OnEdit = CmeCadastroEdit
    OnCancel = CmeCadastroCancel
    OnConfirma = CmeCadastroConfirma
    OnAtualizaBotoes = CmeCadastroAtualizaBotoes
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 208
    Top = 63
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 124
    Top = 87
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 208
    Top = 111
  end
end
