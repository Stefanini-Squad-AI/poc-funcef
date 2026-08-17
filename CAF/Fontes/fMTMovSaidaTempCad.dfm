inherited frmMTMovSaidaTempCad: TfrmMTMovSaidaTempCad
  Left = 16
  Top = 125
  Caption = 'Termos de Saída Temporária de Bens'
  ClientHeight = 421
  ClientWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 763
    Height = 347
    inherited pnlMestre: TPanel
      Width = 761
      Height = 116
      object Label5: TLabel
        Left = 583
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Motivo'
      end
      object Label34: TLabel
        Left = 272
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Destino'
      end
      object Label1: TLabel
        Left = 147
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Data da Saída'
      end
      object Termo: TLabel
        Left = 16
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Termo'
      end
      object Label4: TLabel
        Left = 16
        Top = 56
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object Label6: TLabel
        Left = 301
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object dbcmbSelMotivo: TwwDBLookupCombo
        Left = 584
        Top = 24
        Width = 158
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPSAITEMP'#9'60'#9'Motivo para Saída Temporária')
        DataField = 'IDTIPOSAIDATEMP'
        DataSource = ds
        LookupTable = cdsSelMotivo
        LookupField = 'IDTIPOSAIDATEMP'
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dbeLocalizacao: TwwDBEdit
        Left = 272
        Top = 24
        Width = 279
        Height = 21
        DataField = 'NOME'
        DataSource = dsLocal
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelLocal: TBitBtn
        Left = 550
        Top = 24
        Width = 21
        Height = 21
        TabOrder = 2
        OnClick = bbtnSelLocalClick
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
      object dbeData: TCMDateTimePicker
        Left = 148
        Top = 24
        Width = 112
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'STPDATA'
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
        TabOrder = 1
      end
      object dbeTermo: TwwDBEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        DataField = 'STPTERMO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeResponsavel: TwwDBEdit
        Left = 16
        Top = 72
        Width = 257
        Height = 21
        DataField = 'NOME'
        DataSource = dsResp
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeObs: TDBMemo
        Left = 302
        Top = 72
        Width = 440
        Height = 41
        DataField = 'STPOBSERVACOES'
        DataSource = ds
        TabOrder = 5
      end
      object bbtnSelResp: TBitBtn
        Left = 272
        Top = 72
        Width = 21
        Height = 21
        TabOrder = 4
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 117
      Width = 761
      Height = 229
      Tabs.Strings = (
        'Bens')
      inherited pgctrlDetalhe: TPageControl
        Width = 663
        Height = 170
        inherited tbsDet: TTabSheet
          Caption = 'Bens'
          inherited pnlControlesDet: TPanel
            Width = 655
            Height = 142
            object Label26: TLabel
              Left = 16
              Top = 8
              Width = 127
              Height = 13
              Caption = 'Placa de Tombamento'
            end
            object Label22: TLabel
              Left = 200
              Top = 8
              Width = 104
              Height = 13
              Caption = 'Descrição do Bem'
            end
            object Label2: TLabel
              Left = 328
              Top = 88
              Width = 51
              Height = 13
              Caption = 'Conjunto'
            end
            object Label7: TLabel
              Left = 16
              Top = 48
              Width = 69
              Height = 13
              Caption = 'Localização'
            end
            object Label17: TLabel
              Left = 328
              Top = 48
              Width = 74
              Height = 13
              Caption = 'Responsável'
            end
            object Label3: TLabel
              Left = 16
              Top = 88
              Width = 85
              Height = 13
              Caption = 'Grupo Contábil'
            end
            object bbtnSelBem: TBitBtn
              Left = 162
              Top = 24
              Width = 21
              Height = 21
              TabOrder = 0
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
            object dbeDesBem: TDBMemo
              Left = 200
              Top = 24
              Width = 432
              Height = 21
              DataField = 'DESBEM'
              DataSource = dsSelBem
              TabOrder = 1
            end
            object dbeConjunto: TwwDBEdit
              Left = 328
              Top = 104
              Width = 304
              Height = 21
              DataField = 'DESCCONJUNTO'
              DataSource = dsSelBem
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeDescLocalizacao: TwwDBEdit
              Left = 16
              Top = 64
              Width = 304
              Height = 21
              DataField = 'DESCLOCALIZACAO'
              DataSource = dsSelBem
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeNomeResp: TwwDBEdit
              Left = 328
              Top = 64
              Width = 304
              Height = 21
              DataField = 'NOMERESPONSAVEL'
              DataSource = dsSelBem
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeDescGrupo: TwwDBEdit
              Left = 16
              Top = 104
              Width = 304
              Height = 21
              DataField = 'DESCGRUPO'
              DataSource = dsSelBem
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbePlaca: TwwDBEdit
              Left = 16
              Top = 24
              Width = 146
              Height = 21
              DataField = 'PLACA'
              DataSource = dsSelBem
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 655
            Height = 142
            Selected.Strings = (
              'PLACA'#9'20'#9'Placa'#9'F'
              'DESBEM'#9'80'#9'Descrição'#9'F')
            TitleAlignment = taCenter
          end
        end
      end
      inherited Dock973: TDock97
        Width = 753
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 667
        Height = 170
      end
    end
  end
  inherited Dock972: TDock97
    Width = 763
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
    Top = 382
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 746
    Top = 503
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 456
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 688
    Top = 503
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 576
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 416
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Termo de Saída Temporária'
    Colunas.Strings = (
      'SAIDATEMPORARIA.STPTERMO'
      'SAIDATEMPORARIA.STPDATA'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Termo de Saída'
      'Data da Saída'
      'Local'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SAIDATEMPORARIA'
      'LOCALIZACAO'
      'PESSOA')
    CamposChave.Strings = (
      'SAIDATEMPORARIA.IDSAIDATEMPORARIA'
      'SAIDATEMPORARIA.IDPESSOA')
    Filtro.Strings = (
      'SAIDATEMPORARIA.STPFLGEXEC=0'
      'SAIDATEMPORARIA.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'SAIDATEMPORARIA.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'SAIDATEMPORARIA.IDRESPONSAVEL=PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '60'
      '60')
    Left = 504
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 648
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 608
    Top = 264
  end
  object dsLocal: TwwDataSource
    AutoEdit = False
    DataSet = cdsLocal
    Left = 440
    Top = 64
  end
  object dsSelMotivo: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelMotivo
    Left = 672
    Top = 64
  end
  object dsResp: TwwDataSource
    AutoEdit = False
    DataSet = cdsResp
    Left = 168
    Top = 112
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 251
  end
  object MSLocal: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Localização'
    Colunas.Strings = (
      'LOCALIZACAO.NOME'
      'PESSOA.NOME'
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Localização'
      'Responsável'
      'Código C. Custo'
      'Nome C. Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LOCALIZACAO'
      'PESSOA'
      'CENTCUST')
    CamposChave.Strings = (
      'LOCALIZACAO.IDLOCALIZACAO'
      'LOCALIZACAO.IDPESSOA')
    Filtro.Strings = (
      'LOCALIZACAO.FLGLOCSAITEMP = 1'
      'LOCALIZACAO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+)'
      'LOCALIZACAO.IDEMPRESA = CENTCUST.IDEMPRESA(+)'
      'LOCALIZACAO.IDRESPONSAVEL = PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '10'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 496
    Top = 64
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
      'RESPONSAVEL.IDRESPONSAVEL=PESSOA.IDPESSOA(+)')
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
    Left = 216
    Top = 112
  end
  object sqlDet: TCMSqlParams
    SQL.Strings = (
      'SELECT STB.IDSAIDATEMPORARIA, STB.IDPESSOA, STB.IDBEM, '
      '       STB.STBCUSTO, STB.STBDATARETORNO, '
      '       B.PLACA, B.DESBEM'
      'FROM SAIDATEMPBENS STB,'
      '     BEM B '
      'WHERE (STB.IDSAIDATEMPORARIA = :IDSAIDATEMPORARIA)'
      '  AND (STB.IDPESSOA = :IDPESSOA)'
      '  AND (STB.IDBEM = B.IDBEM)'
      '  AND (STB.IDPESSOA = B.IDPESSOA)'
      'ORDER BY STB.IDSAIDATEMPORARIA, STB.IDBEM')
    Left = 608
    Top = 237
  end
  object cdsLocal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 51
  end
  object cdsSelMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 51
  end
  object cdsResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 99
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelBem
    Left = 496
    Top = 276
  end
  object cdsSelBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 262
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
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
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO(+)'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
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
    Left = 496
    Top = 248
  end
end
