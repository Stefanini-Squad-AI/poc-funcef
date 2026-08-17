inherited FrmMTAltValidade: TFrmMTAltValidade
  Left = 53
  Top = 155
  HelpContext = 50023
  Caption = 'Alteração de Validade dos Produtos'
  ClientHeight = 274
  ClientWidth = 696
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 696
    Height = 188
    object dbGrd: TwwDBGrid
      Left = 5
      Top = 5
      Width = 686
      Height = 178
      Selected.Strings = (
        'DATAVALIDADE'#9'10'#9'Data~Validade'
        'CODARTIGO'#9'14'#9'Código'
        'DESCPROD'#9'30'#9'Descrção'
        'CODMEDIDA'#9'4'#9'Unid.'
        'QTDERECEBDEVOL'#9'10'#9'Qtde.'
        'VLRUNITARIO'#9'10'#9'Valor~Unitario'
        'VLRESTOQUE'#9'10'#9'Valor~Estoque ')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = sbtnAlterarClick
      IndicatorColor = icBlack
    end
    object calendario: TwwDBMonthCalendar
      Left = 5
      Top = 5
      Width = 686
      Height = 178
      Date = 37246.7357987384
      Time = 37246.7357987384
      Align = alClient
    end
  end
  inherited Dock972: TDock97
    Width = 696
    object Label1: TLabel [0]
      Left = 250
      Top = 2
      Width = 81
      Height = 16
      Caption = 'Nº da Nota:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 246
      Top = 26
      Width = 85
      Height = 16
      Caption = 'Fornecedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText [2]
      Left = 336
      Top = 26
      Width = 60
      Height = 16
      AutoSize = True
      DataField = 'RAZAOSOCIAL'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText [3]
      Left = 336
      Top = 2
      Width = 60
      Height = 16
      AutoSize = True
      DataField = 'NUMNOTA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 235
    Width = 696
    inherited tb97Fundo: TToolbar97
      Left = 526
      DockPos = 581
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50023
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 359
      DockPos = 414
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 730
    Top = 65527
  end
  inherited ds: TwwDataSource
    Left = 502
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 760
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 440
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 548
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME'
      'NFRECEBDEVOL.NUMNF'
      'NFRECEBDEVOL.COMPLNF'
      'NFRECEBDEVOL.DATAEMISNF'
      'NFRECEBDEVOL.DATAENTDEVOL'
      'NFRECEBDEVOL.VLRNOTAFISCAL'
      'ITENSRECEBDEVOL.CODARTIGO'
      'PRODUTO.DESCPROD'
      'ITENSRECEBDEVOL.DATAVALIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'D'
      'D'
      'N'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Razão Social'
      'Nome do Fornecedor'
      'Número da NF'
      'Complemento'
      'Data de Emissão'
      'Data da Entrada'
      'Valor da Nota'
      'Código do Artigo'
      'Descrição do Artigo'
      'Data de Validade')
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
      'N')
    Tabelas.Strings = (
      'NFRECEBDEVOL'
      'PESSOA'
      'ITENSRECEBDEVOL'
      'ARTIGO'
      'PRODUTO')
    CamposChave.Strings = (
      'NFRECEBDEVOL.IDNFRECEBDEVOL')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = NFRECEBDEVOL.IDFORCLI'
      'ITENSRECEBDEVOL.IDNFRECEBDEVOL = NFRECEBDEVOL.IDNFRECEBDEVOL'
      'ITENSRECEBDEVOL.CODARTIGO = ARTIGO.CODARTIGO'
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00'
      ''
      ''
      '')
    Larguras.Strings = (
      '45'
      '30'
      '10'
      '5'
      '10'
      '10'
      '10'
      '14'
      '40'
      '18')
    Left = 632
    Top = 7
  end
end
