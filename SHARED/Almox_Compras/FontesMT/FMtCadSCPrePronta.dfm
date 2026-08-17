inherited FrmMtCadSCPrePronta: TFrmMtCadSCPrePronta
  Left = 53
  Top = 72
  HelpContext = 50063
  Caption = 'Cadastro de Solicitação Pré-Pronta'
  ClientHeight = 424
  ClientWidth = 643
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 643
    Height = 338
    inherited pnlMestre: TPanel
      Width = 633
      Height = 84
      object Label2: TLabel
        Left = 19
        Top = 9
        Width = 73
        Height = 13
        Caption = 'Almoxarifado'
      end
      object Label1: TLabel
        Left = 18
        Top = 35
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object lbAlmox: TStaticText
        Left = 99
        Top = 8
        Width = 47
        Height = 17
        BorderStyle = sbsSunken
        Caption = 'lbAlmox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object EdDesc: TDBEdit
        Left = 18
        Top = 50
        Width = 595
        Height = 21
        DataField = 'DESCSCPREPRONTA'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 89
      Width = 633
      Height = 244
      inherited pgctrlDetalhe: TPageControl
        Width = 535
        Height = 185
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 527
            Height = 157
            Selected.Strings = (
              'CODARTIGO'#9'14'#9'Código'#9'F'
              'DESCRICAO'#9'35'#9'Descrição'#9'F'
              'CODMEDIDA'#9'4'#9'Unidade~Medida'#9'F'
              'QTDEPESSOA'#9'10'#9'Quantidade'#9'F'
              'NDIAS'#9'10'#9'Nº Dias'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 527
            Height = 157
            object Label4: TLabel
              Left = 24
              Top = 16
              Width = 25
              Height = 13
              Caption = 'Item'
            end
            object Label6: TLabel
              Left = 144
              Top = 16
              Width = 104
              Height = 13
              Caption = 'Descrição do Item'
            end
            object Label8: TLabel
              Left = 176
              Top = 72
              Width = 48
              Height = 13
              Caption = 'Unidade'
            end
            object Label7: TLabel
              Left = 24
              Top = 72
              Width = 103
              Height = 13
              Caption = 'Qtde. por Pessoa '
            end
            object Label3: TLabel
              Left = 320
              Top = 72
              Width = 44
              Height = 13
              Caption = 'Nº Dias'
            end
            object dblcItem: TwwDBLookupCombo
              Left = 24
              Top = 32
              Width = 91
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODARTIGO'#9'14'#9'Código'
                'DESCRICAO'#9'50'#9'Descrição')
              DataField = 'CODARTIGO'
              DataSource = dsDet
              LookupTable = cdsArtigo
              LookupField = 'CODARTIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcItemCloseUp
            end
            object dblcDesc: TwwDBLookupCombo
              Left = 144
              Top = 32
              Width = 353
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'
                'CODARTIGO'#9'14'#9'Código')
              DataField = 'CODARTIGO'
              DataSource = dsDet
              LookupTable = cdsArtigo
              LookupField = 'CODARTIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcDescCloseUp
            end
            object dblcUN: TwwDBLookupCombo
              Left = 176
              Top = 88
              Width = 109
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = dsDet
              LookupTable = cdsUnMedida
              LookupField = 'CODMEDIDA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object edQtde: TDBRealEdit
              Left = 24
              Top = 88
              Width = 117
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEPESSOA'
              DataSource = dsDet
            end
            object edDias: TEdit
              Left = 320
              Top = 88
              Width = 121
              Height = 21
              TabStop = False
              Color = clSilver
              Enabled = False
              TabOrder = 4
              Text = '                          1'
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 625
      end
      inherited Dock974: TDock97
        Left = 539
        Height = 185
      end
    end
  end
  inherited Dock972: TDock97
    Width = 643
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 643
    inherited tb97Fundo: TToolbar97
      Left = 473
      DockPos = 530
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50063
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 306
      DockPos = 332
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 794
    Top = 7
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 302
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 736
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 344
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 260
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SCPREPRONTA.DESCSCPREPRONTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'SCPREPRONTA')
    CamposChave.Strings = (
      'SCPREPRONTA.IDSCPREPRONTA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 592
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 156
    Top = 178
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 214
    Top = 178
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 9
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 177
  end
  object cdsUnMedida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 9
  end
end
