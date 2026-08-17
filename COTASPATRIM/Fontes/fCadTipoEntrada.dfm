inherited frmCadTipoEntrada: TfrmCadTipoEntrada
  Left = 275
  Top = 208
  Caption = 'Cadastro de Tipo de Entrada'
  ClientHeight = 283
  ClientWidth = 533
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 533
    Height = 197
    inherited dbGrd: TwwDBGrid [0]
      Width = 531
      Height = 195
      Selected.Strings = (
        'NOME'#9'25'#9'Nome'
        'NOMEPARAREGRA'#9'23'#9'Nome para Regra'
        'DESCTIPOUNIDADE'#9'20'#9'Unidade')
    end
    inherited pnlControles: TPanel [1]
      Width = 531
      Height = 195
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 92
        Height = 13
        Caption = 'Tipo de Entrada'
      end
      object Label2: TLabel
        Left = 16
        Top = 72
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 344
        Top = 72
        Width = 100
        Height = 13
        Caption = 'Nome para Regra'
      end
      object dbNome: TDBEdit
        Left = 16
        Top = 32
        Width = 505
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object dbmemDescricao: TDBMemo
        Left = 16
        Top = 88
        Width = 305
        Height = 89
        DataField = 'DESCRICAO'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object dbgrdEntSai: TDBRadioGroup
        Left = 344
        Top = 120
        Width = 177
        Height = 58
        Caption = 'Unidade'
        DataField = 'TIPOUNIDADE'
        DataSource = ds
        Items.Strings = (
          '&Quantidade de Cotas'
          'Valor &Financeiro')
        TabOrder = 3
        Values.Strings = (
          'Q'
          'V')
      end
      object dbNomeParaRegra: TDBEdit
        Left = 344
        Top = 88
        Width = 177
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMEPARAREGRA'
        DataSource = ds
        TabOrder = 2
      end
    end
  end
  inherited Dock972: TDock97
    Width = 533
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 244
    Width = 533
    inherited tb97Fundo: TToolbar97
      Left = 361
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65514
    Top = 65519
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 318
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 272
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 368
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 460
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Left = 416
    Top = 7
  end
end
