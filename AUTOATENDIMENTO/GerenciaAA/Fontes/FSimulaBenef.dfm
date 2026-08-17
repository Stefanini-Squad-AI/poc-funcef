inherited frmSimulaBenef: TfrmSimulaBenef
  Left = 84
  Top = 106
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Simulação de Benefícios'
  ClientHeight = 425
  ClientWidth = 628
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 628
    Height = 386
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 626
      Height = 384
      ActivePage = tabCampos
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object tabParticipante: TTabSheet
        Caption = 'Seleção do Participante'
        object grpParticipante: TGroupBox
          Left = 13
          Top = 14
          Width = 580
          Height = 99
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblMatricula: TLabel
            Left = 16
            Top = 29
            Width = 55
            Height = 13
            Caption = 'Matrícula'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNome: TLabel
            Left = 16
            Top = 64
            Width = 33
            Height = 13
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtMatricula: TEdit
            Left = 78
            Top = 26
            Width = 83
            Height = 21
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtNome: TEdit
            Left = 78
            Top = 60
            Width = 471
            Height = 21
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object btnConsulta: TBitBtn
            Left = 550
            Top = 60
            Width = 21
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = btnConsultaClick
            Glyph.Data = {
              0E030000424D0E030000000000003600000028000000110000000E0000000100
              180000000000D8020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000636363212121000000000000
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000636363212121000000000000FFFF
              FF00FFFFFF000000C6C6C6424242000000000000FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000C6C6C6424242000000000000FFFFFF00FFFFFF00000063636321
              2121000000000000000000000000FFFFFF000000000000000000636363212121
              000000000000FFFFFF00FFFFFF00000063636300000000000000000000000000
              0000FFFFFF000000313131313131000000000000000000000000FFFFFF00FFFF
              FF000000C6C6C642424200000000000000000031313100000000000063636363
              6363424242000000000000000000FFFFFF00FFFFFF000000C6C6C64242420000
              0000000000000063636300000000000063636363636342424200000000000000
              0000FFFFFF00FFFFFF0000006363634242420000000000000000003131310000
              00000000313131313131424242000000000000000000FFFFFF00FFFFFFFFFFFF
              0000002121210000000000000000000000000000000000000000000000002121
              21000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000636363525252
              000000000000FFFFFF000000636363525252000000000000FFFFFFFFFFFFFFFF
              FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000
              000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
              FFFF424242424242000000000000FFFFFFFFFFFF424242424242000000000000
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF21212121212100000000
              0000FFFFFFFFFFFF212121212121000000000000FFFFFFFFFFFFFFFFFF00FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          end
        end
      end
      object tabBeneficio: TTabSheet
        Caption = 'Seleção do Benefício'
        ImageIndex = 1
        object grpBeneficio: TGroupBox
          Left = 13
          Top = 14
          Width = 580
          Height = 59
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label2: TLabel
            Left = 16
            Top = 29
            Width = 33
            Height = 13
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cmbBeneficio: TDBLookupComboBox
            Left = 78
            Top = 25
            Width = 492
            Height = 21
            KeyField = 'cdfIdSimulaBenef'
            ListField = 'cdfNomeBenef'
            ListSource = dtsBeneficio
            TabOrder = 0
          end
        end
      end
      object tabCampos: TTabSheet
        Caption = 'Campos'
        ImageIndex = 2
        object scrollCampos: TScrollBox
          Left = 0
          Top = 0
          Width = 618
          Height = 356
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 628
    inherited tb97Fundo: TToolbar97
      Left = 456
      DockPos = 487
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 287
      DockPos = 318
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'tb97Fundo'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 0
      TabOrder = 2
      object btnVoltar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Voltar'
        TabOrder = 0
        OnClick = btnVoltarClick
        Glyph.Data = {
          06030000424D060300000000000036000000280000000F0000000F0000000100
          180000000000D0020000C40E0000C40E00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4000000000000000000000000000000C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4000000000000006BD7006BD700
          6BD7006BD7006BD7000000000000C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4
          808080006BD7006BD7006BD7006BD7006BD7006BD7006BD7006BD7006BD70000
          00C8D0D4C8D0D4000000C8D0D480808053A9FF006BD7006BD7006BD7006BD700
          6BD7006BD7006BD7006BD7006BD7006BD7000000C8D0D4000000C8D0D4808080
          53A9FF006BD7006BD7006BD700FFFF006BD7006BD7006BD7006BD7006BD7006B
          D7000000C8D0D400000080808053A9FF006BD7006BD7006BD700FFFF00FFFF80
          8080808080808080808080006BD7006BD7006BD700000000000080808053A9FF
          006BD7006BD700FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF808080006B
          D7006BD700000000000080808053A9FF006BD700FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF006BD7006BD700000000000080808053A9FF
          006BD7006BD700FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF006BD7006B
          D7006BD700000000000080808053A9FF006BD7006BD7006BD700FFFF00FFFF00
          6BD7006BD7006BD7006BD7006BD7006BD7006BD7000000000000C8D0D4808080
          53A9FF006BD7006BD7006BD700FFFF006BD7006BD7006BD7006BD7006BD7006B
          D7000000C8D0D4000000C8D0D480808053A9FF006BD7006BD7006BD7006BD700
          6BD7006BD7006BD7006BD7006BD7006BD7000000C8D0D4000000C8D0D4C8D0D4
          80808053A9FF53A9FF006BD7006BD7006BD7006BD7006BD7006BD7006BD70000
          00C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D480808080808053A9FF53A9FF53
          A9FF53A9FF53A9FF808080808080C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4808080808080808080808080808080C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4000000}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 527
    Top = 129
  end
  object msParticipante: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PESSOA.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Id. Pessoa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '50'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 560
    Top = 128
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 494
    Top = 129
  end
  object cdsBeneficio: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cdfIdSimulaBenef'
        DataType = ftInteger
      end
      item
        Name = 'cdfNomeBenef'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 497
    Top = 171
    object cdsBeneficiocdfIdSimulaBenef: TIntegerField
      FieldName = 'cdfIdSimulaBenef'
    end
    object cdsBeneficiocdfNomeBenef: TStringField
      FieldName = 'cdfNomeBenef'
      Size = 100
    end
  end
  object dtsBeneficio: TDataSource
    DataSet = cdsBeneficio
    Left = 529
    Top = 171
  end
end
