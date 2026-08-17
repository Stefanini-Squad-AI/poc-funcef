inherited frmConfigContexto: TfrmConfigContexto
  Left = 214
  Top = 153
  HelpContext = 230092
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configuração de Contexto'
  ClientHeight = 481
  ClientWidth = 448
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 448
    Height = 442
    object lblContexto: TLabel
      Left = 8
      Top = 64
      Width = 55
      Height = 13
      Caption = 'Contexto:'
    end
    object grpAviso: TGroupBox
      Left = 8
      Top = 6
      Width = 431
      Height = 50
      Caption = 'Atenção'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblAviso: TLabel
        Left = 8
        Top = 16
        Width = 416
        Height = 27
        AutoSize = False
        Caption = 
          'São disponibilizados nesta janela apenas os contextos que não po' +
          'ssuem configuração própria, ou seja, não são parametrizados pelo' +
          ' sistema.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5131854
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
    end
    object dblkpContexto: TwwDBLookupCombo
      Left = 8
      Top = 80
      Width = 432
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'55'#9'DESCRICAO'#9'F')
      LookupTable = cdsContexto
      LookupField = 'IDMSGCONTEXTO'
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblkpContextoChange
    end
    object pnlDados: TPanel
      Left = 8
      Top = 112
      Width = 430
      Height = 319
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 2
      object lblEmailConexao: TLabel
        Left = 9
        Top = 81
        Width = 118
        Height = 13
        Caption = 'Conexão com e-mail:'
      end
      object lblMensagemPreDef: TLabel
        Left = 8
        Top = 129
        Width = 136
        Height = 13
        Caption = 'Mensagem pré-definida:'
      end
      object lblAssuntoMsg: TLabel
        Left = 8
        Top = 177
        Width = 132
        Height = 13
        Caption = 'Assunto da Mensagem:'
      end
      object dblkpConexaEmail: TwwDBLookupCombo
        Left = 8
        Top = 97
        Width = 414
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'#9'F')
        DataField = 'IDEMAILCONEXAO'
        DataSource = dts
        LookupTable = cdsEmailConexao
        LookupField = 'IDEMAILCONEXAO'
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dbrdgrpFlgTipoEnvio: TDBRadioGroup
        Left = 8
        Top = 8
        Width = 414
        Height = 65
        Caption = 'Forma de Envio'
        Columns = 3
        DataField = 'FLGTIPOENVIO'
        DataSource = dts
        Items.Strings = (
          'Nenhum'
          'Ambos'
          'E-mail'
          'Mensagem Funcef')
        TabOrder = 0
        Values.Strings = (
          '0'
          '3'
          '1'
          '2')
      end
      object edtMsgPreDef: TEdit
        Left = 8
        Top = 145
        Width = 412
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object pnlOutrosDestinatarios: TPanel
        Left = 8
        Top = 229
        Width = 412
        Height = 80
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 4
        object btnIncluiDest: TSpeedButton
          Left = 370
          Top = 1
          Width = 20
          Height = 20
          Hint = 'Adiciona remetente'
          Anchors = [akTop, akRight]
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF0000FFFF00848484008484
            8400FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
            FF0000FFFF0000FFFF00FF00FF00FF00FF000000000000000000FFFFFF000000
            0000FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
            FF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
            000000FFFF0000FFFF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
            FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF000000000000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
            FF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
            FF00FFFFFF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
            0000FFFFFF000000000000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0000FF
            FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
            FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FFFF00FF00FF00FF00
            FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00
            FF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFF
            FF00848484008484840000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
            FF0000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0084848400848484008484
            8400FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF0000FF
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnIncluiDestClick
        end
        object btnExcluiDest: TSpeedButton
          Left = 390
          Top = 1
          Width = 20
          Height = 20
          Hint = 'Remove remetente'
          Anchors = [akTop, akRight]
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
            840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
            0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000840000008400000084000000840000008400FF000000FF000000FFFF
            FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
            84000000FF000000FF000000FF000000FF000000FF0000008400FFFFFF00FFFF
            FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400FF00
            0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000FF000000
            FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
            FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF000000FF000000
            FF000000FF00FF00FF00FFFFFF00FFFFFF000000FF000000FF0000008400FF00
            0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
            FF000000FF00FFFFFF00FFFFFF00FF00FF000000FF000000FF0000008400FFFF
            FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF000000FF000000
            FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
            FF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF000000
            FF000000FF000000FF000000FF000000FF000000FF0000008400848484008484
            840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnExcluiDestClick
        end
        object lblDestinatarios: TLabel
          Left = 5
          Top = 4
          Width = 79
          Height = 13
          Caption = 'Destinatários:'
        end
        object dbgrdDestinatarios: TwwDBGrid
          Left = 1
          Top = 21
          Width = 410
          Height = 58
          Selected.Strings = (
            'NOME'#9'31'#9'Nome'
            'EMAIL'#9'21'#9'E-mail')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alBottom
          DataSource = dtsDestinatarios
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object dbedtAssuntoMsg: TDBEdit
        Left = 8
        Top = 193
        Width = 412
        Height = 21
        DataField = 'ASSUNTOMSG'
        DataSource = dts
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 442
    Width = 448
    inherited tb97Fundo: TToolbar97
      Left = 276
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230092
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 107
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 379
    Top = 131
  end
  object cdsContexto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 64
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 64
  end
  object dts: TDataSource
    DataSet = cds
    Left = 368
    Top = 64
  end
  object cdsEmailConexao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 184
  end
  object dtsDestinatarios: TDataSource
    DataSet = cdsDestinatarios
    Left = 323
    Top = 361
  end
  object cdsDestinatarios: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 237
    Top = 362
  end
  object msDestinatarios: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um destinatário:'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.EMAIL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'E-Mail')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.EMAIL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '55'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 75
    Top = 361
  end
end
