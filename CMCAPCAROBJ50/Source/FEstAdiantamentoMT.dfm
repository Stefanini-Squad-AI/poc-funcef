inherited FrmEstAdiantamentoMT: TFrmEstAdiantamentoMT
  Left = 220
  Top = 206
  Caption = 'Estorno/Exclusão de Regularização de Adiantamento'
  ClientHeight = 337
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 298
    object Panel1: TPanel
      Left = 1
      Top = 73
      Width = 750
      Height = 224
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      Caption = 'Panel1'
      TabOrder = 0
      object LblDocPagos: TPanel
        Left = 5
        Top = 5
        Width = 740
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Adiantamentos Regularizados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgrAdtoregularizados: TwwDBGrid
        Left = 5
        Top = 35
        Width = 740
        Height = 184
        Selected.Strings = (
          'RAZAOSOCIAL'#9'54'#9'Razão Social'#9'F'
          'DATALANCTO'#9'10'#9'Data Lancto'#9'F'
          'DATAVENCTO'#9'10'#9'Data Vencto'#9'F'
          'VALOR'#9'10'#9'Valor'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = dsAdtoregularizados
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        OnTitleButtonClick = dbgrAdtoregularizadosTitleButtonClick
        IndicatorColor = icBlack
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 750
      Height = 72
      Align = alTop
      TabOrder = 1
      object GpDocumento: TGroupBox
        Left = 5
        Top = -1
        Width = 739
        Height = 67
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Dados da Regularizaçao do  Documento '
        TabOrder = 0
        object LblSisOrigem: TLabel
          Left = 145
          Top = 15
          Width = 110
          Height = 13
          Caption = 'Sistema de Origem:'
        end
        object LblFornCli: TLabel
          Left = 145
          Top = 30
          Width = 69
          Height = 13
          Caption = 'Fornecedor:'
        end
        object LblDataProg: TLabel
          Left = 337
          Top = 47
          Width = 62
          Height = 13
          Caption = 'Data Prog:'
        end
        object LblDocCompl: TLabel
          Left = 145
          Top = 47
          Width = 68
          Height = 13
          Caption = 'Doc\Compl:'
        end
        object LblSaldo: TLabel
          Left = 513
          Top = 46
          Width = 37
          Height = 13
          Caption = 'Saldo:'
        end
        object BtnSeleciona: TBitBtn
          Left = 11
          Top = 20
          Width = 127
          Height = 36
          Caption = 'Seleciona'
          TabOrder = 0
          OnClick = BtnSelecionaClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFF7777777777777FF00000000000007FF0FB8B8B8B8B707F0FB8B8B8B8B
            8707F0F8B8B8B8B8B0070F8B8B8B8B8B70070FFFFFFFFFF70807000000000000
            0B07F0F0FFCFCFCFF007F0FB0FFCFCFCFF07F0F8B0FFCFCFF00FFF0FFF0FFCFF
            07FFFFF00070FFF07FFFFFFFFFFF0F07FFFFFFFFFFFFF07FFFFF}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 298
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 445
      DockPos = 445
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 191
      DockPos = 191
      inherited ToolbarSep971: TToolbarSep97
        Left = 164
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 83
        Caption = 'E&xcluir'
        Default = False
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FFFFFF000000C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000080000080000080000080000080FF0000FF0000FFFFFFFFFFFFFFFFFF0000
          00C0C0C0C0C0C0C0C0C0C0C0C00000800000FF0000FF0000FF0000FF0000FF00
          0080FFFFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C00000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF000080FF0000FFFFFFFFFFFFFFFF
          FF000000C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF000080FFFFFFFFFFFFFF0000FFFFFFFFFFFF000000C0C0C00000FF0000FF
          FFFFFFC0C0C0FFFFFFFFFFFFC0C0C00000FF000080FF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF000080FFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C00000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF000080FFFFFFFFFFFF8080808080
          80C0C0C0C0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF00
          0080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        NumGlyphs = 1
      end
      inherited bbtnCancelar: TBitBtn
        Left = 167
        OnClick = bbtnCancelarClick
      end
      object BtnEstornar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Estornar'
        ModalResult = 1
        TabOrder = 2
        OnClick = BtnEstornarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FFFFFF000000C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000080000080000080000080000080FF0000FF0000FFFFFFFFFFFFFFFFFF0000
          00C0C0C0C0C0C0C0C0C0C0C0C00000800000FF0000FF0000FF0000FF0000FF00
          0080FFFFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C00000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF000080FF0000FFFFFFFFFFFFFFFF
          FF000000C0C0C0C0C0C00000FF0000FFC0C0C0FFFFFF0000FFFFFFFFFFFFFF00
          00FF000080FFFFFFFFFFFFFF0000FFFFFFFFFFFF000000C0C0C00000FF0000FF
          0000FFC0C0C0FFFFFFFFFFFF0000FF0000FF000080FF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFF0000000000FF0000FF0000FFFFFFFFFFFFFFC0C0C00000FF00
          00FF000080FFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C00000FF0000FF
          C0C0C0FFFFFF0000FFFFFFFFFFFFFF0000FF000080FFFFFFFFFFFF8080808080
          80C0C0C0C0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF00
          0080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 371
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'LANCTODOCUM.DATALANCTO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'LANCTODOCUM.VALOR'
      'LANCTODOCUM.HISTORICOCOMPL'
      'TIPODOCRECPAG.DESCRICAO'
      'PORTADORFORMA.DESCRICAO'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'D'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Razão Social'
      'Número do Documento'
      'Complemento'
      'Data de Lançamento'
      'Data de Vencimento'
      'Data Programada'
      'Valor Moeda Corrente'
      'Histórico'
      'Número do Cheque/Borderô'
      'Nome'
      'Sistema de Origem')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'LANCTODOCUM'
      'DOCUMENTO'
      'MOEDA'
      'TIPODOCRECPAG'
      'PORTADORFORMA'
      'MODULO')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.IDFORCLI'
      'LANCTODOCUM.DATALANCTO'
      'MODULO.NOMEMODULO'
      'LANCTODOCUM.PLNCODIGO'
      'LANCTODOCUM.VALOR'
      'LANCTODOCUM.NUMLANCTO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA =DOCUMENTO.IDFORCLI'
      'TIPODOCRECPAG.CODTIPDOC=DOCUMENTO.CODTIPDOC'
      'LANCTODOCUM.CODDOCUMENTO=DOCUMENTO.CODDOCUMENTO'
      'DOCUMENTO.IDMODULO=MODULO.IDMODULO(+)'
      'DOCUMENTO.MOECODIGO=MOEDA.MOECODIGO(+)'
      'DOCUMENTO.CODPORTFORMA=PORTADORFORMA.CODPORTFORMA(+)'
      'LANCTODOCUM.OPERACAO='#39'17'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '5'
      '10'
      '60'
      '1'
      '60'
      '10'
      '10'
      '30'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 222
    Top = 169
  end
  object dsAdtoregularizados: TwwDataSource
    DataSet = CdsAdtoRegularizados
    Left = 361
    Top = 213
  end
  object SQLAdtoRegularizados: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   D.STATUS,'
      '   P.RAZAOSOCIAL,'
      '   D.NODOCUMENTO,'
      '   D.CODDOCUMENTO,'
      '   (0) VALOR,'
      '   L.DATALANCTO,'
      '   D.DATAVENCTO,'
      '   D.COMPLDOCUMENTO,'
      '   D.MOECODIGO,'
      '   L.NUMLANCTO,'
      '   L.PLNCODIGO,'
      '   D.PLANO'
      'FROM'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L,'
      '   PESSOA P'
      'WHERE'
      '   1=2'
      ' ')
    ClientDataSet = CdsAdtoRegularizados
    Left = 361
    Top = 117
  end
  object CdsAdtoRegularizados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAdtoRegularizadosAfterOpen
    Left = 361
    Top = 166
  end
  object CMClientDataSet1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAdtoRegularizadosAfterOpen
    Left = 473
    Top = 166
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   D.STATUS,'
      '   P.RAZAOSOCIAL,'
      '   D.NODOCUMENTO,'
      '   D.CODDOCUMENTO,'
      '   (0) VALOR,'
      '   L.DATALANCTO,'
      '   D.DATAVENCTO,'
      '   D.COMPLDOCUMENTO,'
      '   D.MOECODIGO,'
      '   L.NUMLANCTO,'
      '   L.PLNCODIGO,'
      '   D.PLANO'
      'FROM'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L,'
      '   PESSOA P'
      'WHERE'
      '   1=2'
      ' ')
    ClientDataSet = CMClientDataSet1
    Left = 473
    Top = 117
  end
  object wwDataSource1: TwwDataSource
    DataSet = CMClientDataSet1
    Left = 473
    Top = 213
  end
end
