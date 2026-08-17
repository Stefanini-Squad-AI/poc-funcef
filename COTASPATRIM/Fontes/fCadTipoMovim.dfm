inherited frmCadTipoMovim: TfrmCadTipoMovim
  Left = 186
  Top = 539
  Caption = 'Cadastro de Tipos de Movimentações'
  ClientHeight = 299
  ClientWidth = 679
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 679
    Height = 213
    inherited dbGrd: TwwDBGrid [0]
      Width = 677
      Height = 211
      Selected.Strings = (
        'NOME'#9'46'#9'Nome'
        'DESCFLGTPMOVIM'#9'16'#9'Tipo'
        'DESCTIPOUNIDADE'#9'20'#9'Unidade'
        'FLGENTSAI'#9'6'#9'E/S')
    end
    inherited pnlControles: TPanel [1]
      Width = 677
      Height = 211
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 192
        Top = 51
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 521
        Top = 165
        Width = 100
        Height = 13
        Caption = 'Nome para Regra'
        Visible = False
      end
      object dbedtOperacao: TDBEdit
        Left = 8
        Top = 22
        Width = 660
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object DBMDescricao: TDBMemo
        Left = 192
        Top = 67
        Width = 475
        Height = 77
        DataField = 'DESCRICAO'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object dbgrdEntSai: TDBRadioGroup
        Left = 354
        Top = 148
        Width = 160
        Height = 55
        Caption = 'Entrada/saída'
        DataField = 'FLGENTSAI'
        DataSource = ds
        Items.Strings = (
          '&Entrada'
          '&Saída')
        TabOrder = 4
        Values.Strings = (
          'E'
          'S')
      end
      object dbedtNomeParaRegra: TDBEdit
        Left = 521
        Top = 181
        Width = 144
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMEPARAREGRA'
        DataSource = ds
        TabOrder = 5
        Visible = False
      end
      object dbgrdTpMovim: TDBRadioGroup
        Left = 8
        Top = 51
        Width = 175
        Height = 93
        Caption = 'Tipo'
        DataField = 'FLGTPMOVIM'
        DataSource = ds
        Items.Strings = (
          'Transferência'
          'Cotização'
          'Rentabilidade'
          'Outra operação')
        TabOrder = 1
        Values.Strings = (
          'T'
          'C'
          'R'
          'O')
        OnClick = dbgrdTpMovimClick
      end
      object Panel1: TPanel
        Left = 8
        Top = 153
        Width = 175
        Height = 49
        BevelOuter = bvLowered
        BorderWidth = 3
        TabOrder = 6
        object lblDescTipo: TLabel
          Left = 4
          Top = 4
          Width = 167
          Height = 41
          Align = alClient
          AutoSize = False
          Caption = 
            'Descrição do tipo de movimentação: será exibida conforme for sel' +
            'ecionado o tipo.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
      end
      object dbgrdUnidade: TDBRadioGroup
        Left = 192
        Top = 148
        Width = 153
        Height = 55
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
    end
  end
  inherited Dock972: TDock97
    Width = 679
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 260
    Width = 679
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 65511
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
    Left = 246
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 65528
    Top = 65511
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 288
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterScroll = CdsAfterScroll
    Left = 340
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 384
    Top = 7
  end
end
