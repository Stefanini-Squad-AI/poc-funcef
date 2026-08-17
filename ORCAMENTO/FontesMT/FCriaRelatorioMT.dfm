inherited frmCriaRelatorioMT: TfrmCriaRelatorioMT
  Left = 11
  Top = 75
  HelpContext = 520027
  Caption = 'Demonstrativo Orçamentário'
  ClientHeight = 413
  ClientWidth = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 542
    Height = 327
    inherited pnlMestre: TPanel
      Width = 540
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 106
        Height = 13
        Caption = 'Nome do Relatório'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 189
        Height = 13
        Caption = 'Nome Complementar do Relatório'
      end
      object Label3: TLabel
        Left = 408
        Top = 8
        Width = 106
        Height = 13
        Caption = 'Nº de Incrementos'
      end
      object dbeNome: TwwDBEdit
        Left = 16
        Top = 24
        Width = 377
        Height = 21
        DataField = 'NOMERELATORC'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNomeComplementar: TwwDBEdit
        Left = 16
        Top = 64
        Width = 497
        Height = 21
        DataField = 'NOMECOMPRELATORC'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object spnIncrementos: TwwDBSpinEdit
        Left = 408
        Top = 24
        Width = 105
        Height = 21
        Increment = 1
        MaxValue = 50
        DataField = 'SEQUENCIA'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 540
      Height = 227
      inherited pgctrlDetalhe: TPageControl
        Width = 442
        Height = 168
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 434
            Height = 140
            Selected.Strings = (
              'IDLINHASRELATORC'#9'7'#9'No.Linha'
              'IDCONTAORCAMEN'#9'12'#9'Conta'
              'IDCONTAPARA100'#9'12'#9'Conta p/100%'
              'NUMDECIMAIS'#9'6'#9'No.Dec.'
              'INDENT'#9'17'#9'Indentação'
              'TIPOLINHA'#9'28'#9'Tipo de Linha')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 434
            Height = 140
            object lblCodigoConta: TLabel
              Left = 8
              Top = 48
              Width = 95
              Height = 13
              Caption = 'Código da Conta'
            end
            object Label4: TLabel
              Left = 8
              Top = 88
              Width = 97
              Height = 13
              Caption = 'Conta para 100%'
            end
            object Label6: TLabel
              Left = 96
              Top = 8
              Width = 120
              Height = 13
              Caption = 'Separador das linhas'
            end
            object Label5: TLabel
              Left = 248
              Top = 8
              Width = 65
              Height = 13
              Caption = 'Indentação'
            end
            object Label8: TLabel
              Left = 360
              Top = 8
              Width = 52
              Height = 13
              Caption = 'Decimais'
              Visible = False
            end
            object Label9: TLabel
              Left = 8
              Top = 8
              Width = 50
              Height = 13
              Caption = 'Nº Linha'
            end
            object edtNomeConta: TEdit
              Left = 136
              Top = 64
              Width = 281
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtNomeConta100: TEdit
              Left = 136
              Top = 104
              Width = 281
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object bbtnBuscaConta: TBitBtn
              Left = 104
              Top = 64
              Width = 25
              Height = 22
              Hint = 'Procura a Conta'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = bbtnBuscaContaClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
            end
            object bbtnBuscaConta100: TBitBtn
              Left = 104
              Top = 104
              Width = 25
              Height = 22
              Hint = 'Procura a Conta'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = bbtnBuscaConta100Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
            end
            object dbcbSeparador: TwwDBComboBox
              Left = 96
              Top = 24
              Width = 140
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'FLGTIPOLINHA'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Com espaçamento entre as linhas'#9'E'
                'Desenha uma linha Fina'#9'F'
                'Desenha uma linha Grossa'#9'G'
                'Desenha uma linha Dupla'#9'D')
              Sorted = False
              TabOrder = 4
              UnboundDataType = wwDefault
            end
            object dbcbIndentacao: TwwDBComboBox
              Left = 248
              Top = 24
              Width = 105
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'FLGINDENTACAO'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Nível 1'#9'1'
                '..Nível 2'#9'2'
                '....Nível 3'#9'3'
                '......Nível 4'#9'4'
                '........Nível 5'#9'5')
              Sorted = False
              TabOrder = 5
              UnboundDataType = wwDefault
            end
            object spnDecimais: TwwDBSpinEdit
              Left = 360
              Top = 24
              Width = 57
              Height = 21
              Increment = 1
              MaxValue = 50
              DataField = 'NUMDECIMAIS'
              DataSource = dsDet
              TabOrder = 6
              UnboundDataType = wwDefault
              Visible = False
            end
            object dbrLinha: TDBRealEdit
              Left = 8
              Top = 24
              Width = 81
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 7
              WordWrap = False
              IntDigits = 11
              DecDigits = 0
              NumberFormat = fFixed
              Signal = False
              DataField = 'IDLINHASRELATORC'
              DataSource = dsDet
            end
            object dbeCodigoConta: TwwDBEdit
              Left = 8
              Top = 64
              Width = 97
              Height = 21
              DataField = 'IDCONTAORCAMEN'
              DataSource = dsDet
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeCodigoContaExit
            end
            object dbeCodigo100: TwwDBEdit
              Left = 8
              Top = 104
              Width = 97
              Height = 21
              DataField = 'IDCONTAPARA100'
              DataSource = dsDet
              TabOrder = 9
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeCodigo100Exit
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 532
      end
      inherited Dock974: TDock97
        Left = 446
        Height = 168
      end
    end
  end
  inherited Dock972: TDock97
    Width = 542
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 542
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520027
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 82
    Top = 63
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
  end
  inherited Cds: TCMClientDataSet
    Left = 308
    Top = 63
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RELATORC.IDRELATORC'
      'RELATORC.NOMERELATORC'
      'RELATORC.NOMECOMPRELATORC'
      'RELATORC.SEQUENCIA'
      'RELATORC.FLGIMPRIMENEG')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Código do Relatório'
      'Nome do Relatório'
      'Nome Complementar do Relatório'
      'Incrementos de Sequência'
      'Formato do Negativo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RELATORC')
    CamposChave.Strings = (
      'RELATORC.IDRELATORC')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '40'
      '10'
      '1')
    Left = 376
    Top = 63
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 252
    Top = 111
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDetalhe
    Left = 198
  end
  object cdsDetalhe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 316
    Top = 119
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Conta'
      'Nome da Conta'
      'Observação'
      'Tipo de Cálculo Realizado'
      'Tipo de Cálculo Orçado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '100'
      '60'
      '1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 446
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = cdsDetalhe
    Left = 61
    Top = 116
  end
end
