inherited frmMTUtilCorrGrupoBem: TfrmMTUtilCorrGrupoBem
  Left = 166
  Top = 247
  HelpContext = 70030
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Correção de Grupo Contábil'
  ClientHeight = 248
  ClientWidth = 770
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 770
    Height = 214
    object pgctlTransf: TPageControl
      Left = 1
      Top = 1
      Width = 768
      Height = 205
      ActivePage = TabBem
      Align = alTop
      TabOrder = 0
      OnChanging = pgctlTransfChanging
      object TabSelBem: TTabSheet
        Caption = 'Seleção de Bens'
        object pnlSelBens: TPanel
          Left = 0
          Top = 0
          Width = 760
          Height = 177
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label8: TLabel
            Left = 149
            Top = 8
            Width = 136
            Height = 13
            Caption = 'Termo de Transferência'
          end
          object Label9: TLabel
            Left = 11
            Top = 8
            Width = 128
            Height = 13
            Caption = 'Data da Transferência'
          end
          object Label10: TLabel
            Left = 472
            Top = 8
            Width = 141
            Height = 13
            Caption = 'Responsável pelo Termo'
          end
          object Processo: TLabel
            Left = 296
            Top = 8
            Width = 53
            Height = 13
            Caption = 'Processo'
          end
          object Label11: TLabel
            Left = 11
            Top = 56
            Width = 109
            Height = 13
            Caption = 'Bens Selecionados'
          end
          object bbtnTermoTransf: TBitBtn
            Left = 264
            Top = 24
            Width = 21
            Height = 21
            TabOrder = 0
            OnClick = bbtnTermoTransfClick
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
          object edDataSel: TCMDateTimePicker
            Left = 11
            Top = 24
            Width = 128
            Height = 21
            Hint = 'Data Programada para Pagamento'
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 1
            OnExit = edDataSelExit
          end
          object dbeSbxProcesso: TwwDBEdit
            Left = 296
            Top = 24
            Width = 169
            Height = 21
            DataField = 'SBXPROCESSO'
            DataSource = dsSelTermo
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeResp: TwwDBEdit
            Left = 472
            Top = 24
            Width = 268
            Height = 21
            DataField = 'NOMERESP'
            DataSource = dsSelTermo
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeTermo: TwwDBEdit
            Left = 149
            Top = 24
            Width = 115
            Height = 21
            DataField = 'SBXTERMO'
            DataSource = dsSelTermo
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbgDet: TwwDBGrid
            Left = 1
            Top = 72
            Width = 750
            Height = 104
            Selected.Strings = (
              'PLACA'#9'12'#9'Placa'#9#9
              'DESBEM'#9'80'#9'Descrição do Bem'#9#9
              'DESCCONJATUAL'#9'80'#9'Conjunto Atual'#9#9
              'NOMELOCAATUAL'#9'60'#9'Localização Atual'#9#9
              'NOMERESPATUAL'#9'60'#9'Responsável Atual'#9#9
              'DESCGRUPATUAL'#9'60'#9'Grupo Contábil Atual'#9#9
              'DESCCONJNOVO'#9'80'#9'Novo Conjunto'#9#9
              'NOMELOCANOVO'#9'60'#9'Nova Localização'#9#9
              'NOMERESPNOVO'#9'60'#9'Novo Responsável'#9#9
              'DESCGRUPNOVO'#9'60'#9'Novo Grupo Contábil'#9#9)
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 1
            ShowHorzScrollBar = True
            DataSource = dsDet9
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
      end
      object TabBem: TTabSheet
        Caption = 'Bem'
        object pnlMestre: TPanel
          Left = 0
          Top = 0
          Width = 760
          Height = 177
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Data: TLabel
            Left = 16
            Top = 8
            Width = 128
            Height = 13
            Caption = 'Data da Transferência'
          end
          object Label22: TLabel
            Left = 368
            Top = 8
            Width = 104
            Height = 13
            Caption = 'Descrição do Bem'
          end
          object Label26: TLabel
            Left = 192
            Top = 8
            Width = 127
            Height = 13
            Caption = 'Placa de Tombamento'
          end
          object Label1: TLabel
            Left = 16
            Top = 48
            Width = 51
            Height = 13
            Caption = 'Conjunto'
          end
          object Label7: TLabel
            Left = 16
            Top = 88
            Width = 69
            Height = 13
            Caption = 'Localização'
          end
          object Label17: TLabel
            Left = 368
            Top = 88
            Width = 74
            Height = 13
            Caption = 'Responsável'
          end
          object Label2: TLabel
            Left = 16
            Top = 128
            Width = 35
            Height = 13
            Caption = 'Grupo'
          end
          object Label4: TLabel
            Left = 368
            Top = 128
            Width = 80
            Height = 13
            Caption = 'Grupo Correto'
          end
          object dbeDesBem: TDBMemo
            Left = 368
            Top = 24
            Width = 369
            Height = 62
            DataField = 'DESBEM'
            DataSource = dsSelBem
            TabOrder = 6
          end
          object edData: TCMDateTimePicker
            Left = 16
            Top = 24
            Width = 163
            Height = 21
            Hint = 'Data Programada para Pagamento'
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 0
            OnExit = edDataExit
          end
          object bbtnSelBem: TBitBtn
            Left = 338
            Top = 24
            Width = 21
            Height = 21
            TabOrder = 2
            OnClick = bbtnSelBemClick
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
          object edPlaca: TEdit
            Left = 192
            Top = 24
            Width = 146
            Height = 21
            TabOrder = 1
            OnEnter = edPlacaEnter
            OnExit = edPlacaExit
          end
          object dbeConjunto: TwwDBEdit
            Left = 16
            Top = 64
            Width = 345
            Height = 21
            DataField = 'DESCCONJUNTO'
            DataSource = dsSelBem
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeDescLocalizacao: TwwDBEdit
            Left = 16
            Top = 104
            Width = 345
            Height = 21
            DataField = 'DESCLOCALIZACAO'
            DataSource = dsSelBem
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeNomeResp: TwwDBEdit
            Left = 368
            Top = 104
            Width = 369
            Height = 21
            DataField = 'NOMERESPONSAVEL'
            DataSource = dsSelBem
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeDescGrupo: TwwDBEdit
            Left = 16
            Top = 144
            Width = 345
            Height = 21
            DataField = 'DESCGRUPO'
            DataSource = dsSelBem
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeGrupoNovo: TwwDBEdit
            Left = 368
            Top = 144
            Width = 353
            Height = 21
            DataField = 'NOME'
            DataSource = dsGrupo
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object bbtnGrupo: TBitBtn
            Left = 720
            Top = 144
            Width = 21
            Height = 21
            TabOrder = 9
            OnClick = bbtnGrupoClick
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 770
    Height = 34
    inherited tb97Fundo: TToolbar97
      Left = 568
      DockPos = 578
      inherited sep1: TToolbarSep97
        Left = 96
      end
      inherited sep3: TToolbarSep97
        Left = 195
      end
      inherited bbtnSair: TBitBtn
        Width = 96
        Height = 28
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 99
        Width = 96
        Height = 28
        HelpContext = 70030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 369
      DockPos = 379
      inherited ToolbarSep971: TToolbarSep97
        Left = 96
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 96
        Height = 28
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 99
        Width = 96
        Height = 28
        Caption = '&Estornar'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 722
    Top = 463
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        '*'
        'Filter'
        0))
  end
  object dsDet9: TwwDataSource
    AutoEdit = False
    DataSet = cdsDet9
    Left = 679
    Top = 149
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelBem
    Left = 568
    Top = 76
  end
  object cdsSelBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 62
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle')
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
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1')
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
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 568
    Top = 48
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = cdsGrupo
    Left = 509
    Top = 155
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 509
    Top = 141
  end
  object MSGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Grupo Contábil'
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO'
      'PLANOGRUPO.IDPESSOA')
    Filtro.Strings = (
      'GRUPO.TIPO = '#39'A'#39
      'GRUPO.STATUS = '#39'A'#39
      'GRUPO.IDGRUPO=PLANOGRUPO.IDGRUPO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 509
    Top = 128
  end
  object cdsDet9: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 680
    Top = 136
  end
  object sqlDet9: TCMSqlParams
    SQL.Strings = (
      'SELECT B.PLACA, '
      '       B.DESBEM, '
      '       CA.DESCCONJUNTO AS DESCCONJATUAL, '
      '       LA.NOME AS NOMELOCAATUAL, '
      '       PA.NOME AS NOMERESPATUAL, '
      '       GA.NOME AS DESCGRUPATUAL, '
      '       CN.DESCCONJUNTO AS DESCCONJNOVO, '
      '       LN.NOME AS NOMELOCANOVO, '
      '       PN.NOME AS NOMERESPNOVO, '
      '       GN.NOME AS DESCGRUPNOVO, '
      '       SBB.IDSELBAIXA, '
      '       SBB.IDBEM, '
      '       SBB.IDPESSOA, '
      '       SBB.IDCONJUNTO, B.IDCONJUNTO AS IDCONJATUAL, '
      '       SBB.IDGRUPO, B.IDGRUPO AS IDGRUPOATUAL, '
      '       SBB.IDLOCALIZACAO, LA.IDLOCALIZACAO AS IDLOCALATUAL, '
      '       SBB.IDRESPONSAVEL '
      'FROM SELBAIXABENS SBB, '
      '     BEM B,            '
      '     CONJUNTO CA,      '
      '     GRUPO GA,         '
      '     LOCALIZACAO LA,   '
      '     PESSOA PA,        '
      '     CONJUNTO CN,      '
      '     GRUPO GN,         '
      '     LOCALIZACAO LN,   '
      '     PESSOA PN         '
      'WHERE SBB.IDSELBAIXA = :IDSELBAIXA'
      '  AND SBB.IDPESSOA = :IDPESSOA'
      '  AND B.BAIXATOTAL <> '#39'S'#39' '
      '  AND SBB.IDBEM = B.IDBEM '
      '  AND SBB.IDPESSOA = B.IDPESSOA '
      '  AND B.IDCONJUNTO = CA.IDCONJUNTO '
      '  AND B.IDPESSOA = CA.IDPESSOA '
      '  AND CA.IDLOCALIZACAO = LA.IDLOCALIZACAO '
      '  AND CA.IDPESSOA = LA.IDPESSOA '
      '  AND CA.IDRESPONSAVEL = PA.IDPESSOA '
      '  AND B.IDGRUPO = GA.IDGRUPO '
      '  AND SBB.IDCONJUNTO = CN.IDCONJUNTO '
      '  AND SBB.IDPESSOA = CN.IDPESSOA '
      '  AND SBB.IDLOCALIZACAO = LN.IDLOCALIZACAO '
      '  AND SBB.IDPESSOA = LN.IDPESSOA '
      '  AND SBB.IDRESPONSAVEL = PN.IDPESSOA '
      '  AND SBB.IDGRUPO = GN.IDGRUPO'
      'ORDER BY B.PLACA'
      '')
    ClientDataSet = cdsDet9
    Left = 680
    Top = 122
  end
  object cdsSelTermo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 207
    Top = 109
  end
  object dsSelTermo: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelTermo
    Left = 208
    Top = 96
  end
  object MSTermo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Termo de Transferência'
    Colunas.Strings = (
      'SELBAIXA.SBXTERMO'
      'SELBAIXA.SBXPROCESSO'
      'SELBAIXA.SBXDATA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Termo Transferência'
      'Processo'
      'Data Termo'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SELBAIXA'
      'PESSOA')
    CamposChave.Strings = (
      'SELBAIXA.IDSELBAIXA'
      'SELBAIXA.IDPESSOA')
    Filtro.Strings = (
      'SELBAIXA.SBTIPOMOV > 0'
      'SELBAIXA.IDRESPONSAVEL=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 208
    Top = 83
  end
  object cdsGrupoTaxaDep2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 113
    Top = 150
  end
  object cdsGrupoTaxaDep1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 113
    Top = 136
  end
  object cdsReavaliacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 136
  end
  object sqlReavaliacao: TCMSqlParams
    SQL.Strings = (
      'SELECT IDREAVALIACAO, DATAREAVALIACAO'
      '  FROM REAVALIACAO'
      'WHERE IDBEM = :IDBEM'
      '  AND IDPESSOA = :IDPESSOA')
    ClientDataSet = cdsReavaliacao
    Left = 384
    Top = 122
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = cdsDet
    Left = 615
    Top = 149
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 136
  end
end
