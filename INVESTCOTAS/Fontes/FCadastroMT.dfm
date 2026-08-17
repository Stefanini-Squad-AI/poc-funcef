inherited FrmCadastroMT: TFrmCadastroMT
  Top = 246
  Caption = 'Cadastro Multi Tier'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Bevel: TBevel
      Left = 1
      Top = 32
      Width = 505
      Height = 3
      Align = alTop
      Shape = bsBottomLine
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 505
      Height = 31
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lbNomItem: TfcLabel
        Left = 13
        Top = 3
        Width = 92
        Height = 24
        Caption = 'Cadastro'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
  end
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
    Left = 410
    Top = 167
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
    Left = 350
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 344
    Top = 103
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnInsert = CmeCadastroInsert
    OnDelete = CmeCadastroDelete
    OnEdit = CmeCadastroEdit
    OnCancel = CmeCadastroCancel
    OnConfirma = CmeCadastroConfirma
    OnAtualizaBotoes = CmeCadastroAtualizaBotoes
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 384
    Top = 7
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 316
    Top = 7
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
    Left = 408
    Top = 95
  end
end
