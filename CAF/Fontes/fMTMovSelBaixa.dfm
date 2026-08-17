inherited frmMTMovSelBaixa: TfrmMTMovSelBaixa
  Left = 88
  Top = 131
  Caption = 'Seleção de Bens para Baixa'
  ClientHeight = 418
  ClientWidth = 755
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 755
    Height = 348
    inherited pnlMestre: TPanel
      Width = 753
      Height = 96
      object Label1: TLabel
        Left = 16
        Top = 5
        Width = 89
        Height = 13
        Caption = 'Termo de Baixa'
      end
      object Label4: TLabel
        Left = 16
        Top = 48
        Width = 141
        Height = 13
        Caption = 'Responsável pelo Termo'
      end
      object Processo: TLabel
        Left = 176
        Top = 5
        Width = 53
        Height = 13
        Caption = 'Processo'
      end
      object Label2: TLabel
        Left = 611
        Top = 6
        Width = 85
        Height = 13
        Caption = 'Data do Termo'
      end
      object Label6: TLabel
        Left = 387
        Top = 48
        Width = 69
        Height = 13
        Caption = 'Destinatário'
      end
      object dbeSbxTermo: TwwDBEdit
        Left = 16
        Top = 21
        Width = 145
        Height = 21
        DataField = 'SBXTERMO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeResponsavel: TwwDBEdit
        Left = 16
        Top = 64
        Width = 337
        Height = 21
        DataField = 'NOME'
        DataSource = dsResp
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelResp: TBitBtn
        Left = 352
        Top = 64
        Width = 21
        Height = 21
        TabOrder = 3
        OnClick = bbtnSelRespClick
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
      object dbeSbxProcesso: TwwDBEdit
        Left = 176
        Top = 21
        Width = 425
        Height = 21
        DataField = 'SBXPROCESSO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSbxData: TCMDateTimePicker
        Left = 611
        Top = 21
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'SBXDATA'
        DataSource = ds
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
        ShowButton = True
        TabOrder = 2
      end
      object dbeDestBaixa: TwwDBEdit
        Left = 388
        Top = 64
        Width = 323
        Height = 21
        DataField = 'NOME'
        DataSource = dsDestBaixa
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnDestBaixa: TBitBtn
        Left = 711
        Top = 64
        Width = 21
        Height = 21
        TabOrder = 4
        OnClick = bbtnDestBaixaClick
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
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 97
      Width = 753
      Height = 250
      Tabs.Strings = (
        'Bens')
      inherited pgctrlDetalhe: TPageControl
        Width = 655
        Height = 191
        inherited tbsDet: TTabSheet
          Caption = 'Bens'
          inherited pnlControlesDet: TPanel
            Width = 647
            Height = 163
            object Label26: TLabel
              Left = 16
              Top = 8
              Width = 127
              Height = 13
              Caption = 'Placa de Tombamento'
            end
            object Label22: TLabel
              Left = 184
              Top = 8
              Width = 104
              Height = 13
              Caption = 'Descrição do Bem'
            end
            object Label5: TLabel
              Left = 16
              Top = 104
              Width = 51
              Height = 13
              Caption = 'Conjunto'
            end
            object Label7: TLabel
              Left = 16
              Top = 56
              Width = 69
              Height = 13
              Caption = 'Localização'
            end
            object Label17: TLabel
              Left = 336
              Top = 56
              Width = 74
              Height = 13
              Caption = 'Responsável'
            end
            object edPlaca: TEdit
              Left = 16
              Top = 24
              Width = 137
              Height = 21
              TabOrder = 0
              Text = 'edPlaca'
              OnExit = edPlacaExit
            end
            object bbtnSelBem: TBitBtn
              Left = 152
              Top = 24
              Width = 21
              Height = 21
              TabOrder = 1
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
              Margin = 0
              NumGlyphs = 2
            end
            object dbmDesBem: TDBMemo
              Left = 184
              Top = 24
              Width = 441
              Height = 21
              DataField = 'DESBEM'
              DataSource = dsSelBem
              TabOrder = 2
            end
            object dbeConjunto: TwwDBEdit
              Left = 16
              Top = 120
              Width = 609
              Height = 21
              DataField = 'DESCCONJUNTO'
              DataSource = dsSelBem
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeLocal: TwwDBEdit
              Left = 16
              Top = 72
              Width = 305
              Height = 21
              DataField = 'DESCLOCALIZACAO'
              DataSource = dsSelBem
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeResp: TwwDBEdit
              Left = 336
              Top = 72
              Width = 289
              Height = 21
              DataField = 'NOMERESPONSAVEL'
              DataSource = dsSelBem
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 647
            Height = 163
            Selected.Strings = (
              'PLACA'#9'15'#9'Placa'#9'F'
              'DESBEM'#9'82'#9'Descrição'#9'F')
            TitleAlignment = taCenter
          end
        end
      end
      inherited Dock973: TDock97
        Width = 745
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Flat = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Enabled = False
            Flat = False
            Visible = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Flat = False
          end
          object bbtnGeraDet: TBitBtn
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Carrega o grid com uma seleção de bens|'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = bbtnGeraDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
              000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
              99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
              0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
              FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
              0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
              000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
              00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
              00FF33337FFF7FF77733333300000000033F3333777777777333}
            NumGlyphs = 2
          end
          object bbtnLimpar: TBitBtn
            Left = 100
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Limpa o grid|'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = bbtnLimparClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888FF8888888888888008888888888888F77F8888888888800F08888
              8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
              88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
              888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
              0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
              03088878F88878F878788887F8888090B03088878F888787878788887888880B
              0B038888788888787878888888888880B0B38888888888878788888888888888
              0BBB88888888888878F888888888888880BB8888888888888788}
            NumGlyphs = 2
          end
        end
      end
      inherited Dock974: TDock97
        Left = 659
        Height = 191
      end
    end
  end
  inherited Dock972: TDock97
    Width = 755
    Height = 35
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 85
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 255
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 170
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 755
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep1: TToolbarSep97
        Left = 173
      end
      inherited sep3: TToolbarSep97
        Left = 85
      end
      inherited bbtnSair: TBitBtn
        Width = 85
        Height = 29
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 88
        Width = 85
        Height = 29
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 85
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 85
        Height = 29
      end
      inherited bbtnCancelar: TBitBtn
        Left = 88
        Width = 85
        Height = 29
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 650
    Top = 431
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 414
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 720
    Top = 503
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 464
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 372
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Termo de Baixa'
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
      'Termo de Baixa'
      'Processo'
      'Data da Seleção'
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
      'SBTIPOMOV = 0'
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
    Left = 624
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 536
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 509
    Top = 254
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 509
    Top = 240
  end
  object sqlDet: TCMSqlParams
    SQL.Strings = (
      'SELECT SBB.IDSELBAIXA, SBB.IDBEM, SBB.IDPESSOA,'
      
        '       SBB.IDCONJATUAL, SBB.IDLOCALATUAL,  SBB.IDRESPATUAL,   SB' +
        'B.IDGRUPATUAL,'
      
        '       SBB.IDCONJUNTO,  SBB.IDLOCALIZACAO, SBB.IDRESPONSAVEL, SB' +
        'B.IDGRUPO,'
      '       B.PLACA, B.DESBEM, C.DESCCONJUNTO,'
      '       G.NOME AS DESCGRUPO,'
      '       L.NOME AS DESCLOCAL, R.NOME AS NOMERESP,'
      '       B.IDCONJUNTO    AS IDCONJUNTOATUAL,'
      '       B.IDGRUPO       AS IDGRUPOATUAL,'
      '       C.IDLOCALIZACAO AS IDLOCALIZACAOATUAL,'
      '       C.IDRESPONSAVEL AS IDRESPONSAVELATUAL,'
      '       B.IDCLASSEBEM'
      'FROM SELBAIXABENS SBB,'
      '     BEM B, CONJUNTO C, GRUPO G, LOCALIZACAO L, PESSOA R'
      'WHERE SBB.IDSELBAIXA = :PIDSELBAIXA'
      '  AND SBB.IDPESSOA = :IDPESSOA'
      '  AND SBB.IDBEM = B.IDBEM'
      '  AND SBB.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      '  AND C.IDRESPONSAVEL = R.IDPESSOA'
      'ORDER BY B.PLACA  '
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 509
    Top = 226
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Responsável'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Responsável')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RESPONSAVEL'
      'PESSOA')
    CamposChave.Strings = (
      'RESPONSAVEL.IDRESPONSAVEL')
    Filtro.Strings = (
      'RESPONSAVEL.FLGATIVOFIXO = 1'
      'RESPONSAVEL.IDRESPONSAVEL=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 288
    Top = 89
  end
  object MSDestBaixa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Destinatário'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome Destinatário')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TERCEIRO'
      'PESSOA')
    CamposChave.Strings = (
      'TERCEIRO.IDPESSOA')
    Filtro.Strings = (
      'TERCEIRO.TIPOTERCEIRO = 1'
      'TERCEIRO.IDPESSOA=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 651
    Top = 87
  end
  object dsResp: TwwDataSource
    AutoEdit = False
    DataSet = cdsResp
    Left = 224
    Top = 88
  end
  object dsDestBaixa: TwwDataSource
    AutoEdit = False
    DataSet = cdsDestBaixa
    Left = 576
    Top = 88
  end
  object cdsResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 74
  end
  object cdsDestBaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 74
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelBem
    Left = 576
    Top = 280
  end
  object cdsSelBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 266
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
      'BEM.CONTROLE'
      '(BEM.VALORG+BEM.CMBEM-BEM.DEPLANC-BEM.CMDEP)')
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
      'C'
      'N')
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
      'Controle'
      'Valor Residual')
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
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 576
    Top = 252
  end
end
