inherited frmMTCadConjunto: TfrmMTCadConjunto
  Left = 48
  Top = 89
  Caption = 'Cadastro de Conjuntos'
  ClientHeight = 427
  ClientWidth = 689
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 689
    Height = 341
    inherited pnlMestre: TPanel
      Width = 679
      Height = 115
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 130
        Height = 13
        Caption = 'Descrição do Conjunto'
      end
      object Label2: TLabel
        Left = 16
        Top = 72
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object Label4: TLabel
        Left = 347
        Top = 72
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object dbeDescConjunto: TDBMemo
        Left = 16
        Top = 24
        Width = 545
        Height = 41
        DataField = 'DESCCONJUNTO'
        DataSource = ds
        MaxLength = 200
        TabOrder = 0
      end
      object RgAlugado: TDBRadioGroup
        Left = 576
        Top = 8
        Width = 91
        Height = 58
        Caption = ' Alugado '
        DataField = 'ALUGADO'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 1
        Values.Strings = (
          '1'
          '0')
      end
      object dbeLocalizacao: TwwDBEdit
        Left = 16
        Top = 88
        Width = 297
        Height = 21
        DataField = 'NOME'
        DataSource = dsLocal
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelLocal: TBitBtn
        Left = 313
        Top = 88
        Width = 21
        Height = 21
        TabOrder = 3
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
      object dbeResponsavel: TwwDBEdit
        Left = 347
        Top = 88
        Width = 297
        Height = 21
        DataField = 'NOME'
        DataSource = dsResp
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelResp: TBitBtn
        Left = 645
        Top = 88
        Width = 21
        Height = 21
        TabOrder = 5
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
      Top = 120
      Width = 679
      Height = 216
      Tabs.Strings = (
        'Rateio de Custos')
      inherited pgctrlDetalhe: TPageControl
        Width = 581
        Height = 157
        inherited tbsDet: TTabSheet
          Caption = 'Rateio de Custos'
          inherited pnlControlesDet: TPanel
            Width = 573
            Height = 129
            object Label13: TLabel
              Left = 16
              Top = 8
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label14: TLabel
              Left = 176
              Top = 64
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label7: TLabel
              Left = 254
              Top = 85
              Width = 14
              Height = 16
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 16
              Top = 64
              Width = 98
              Height = 13
              Caption = 'Data de Inclusão'
            end
            object dbeCentroCusto: TwwDBEdit
              Left = 16
              Top = 24
              Width = 233
              Height = 21
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object bbtnTreeCcusto: TBitBtn
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              TabOrder = 1
              OnClick = bbtnTreeCcustoClick
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
            object dbeParticipacao: TDBRealEdit
              Left = 176
              Top = 80
              Width = 73
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
              DataField = 'PARTICIPACAO'
              DataSource = dsDet
            end
            object dbeDataInicio: TCMDateTimePicker
              Left = 16
              Top = 80
              Width = 125
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DTAINICIO'
              DataSource = dsDet
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
              TabOrder = 3
            end
            object treeCentroCusto: TCMTreeViewMT
              Left = 277
              Top = 1
              Width = 294
              Height = 150
              PodeNavegar = True
              DataSource = dsCentroCusto
              CampoChave = 'CODCENTROCUSTO'
              CampoDescricao = 'NOME'
              CampoTipo = 'STATUSGRUPOCDC'
              OnDblClick = treeCentroCustoDblClick
              OnExit = treeCentroCustoExit
              Visible = False
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 573
            Height = 129
            Selected.Strings = (
              'CODCENTROCUSTO'#9'14'#9'Centro de Custo'#9'F'
              'DESCCCUSTO'#9'58'#9'Descrição'#9'F'
              'PARTICIPACAO'#9'10'#9'Participação (%)'#9'F')
            UseTFields = False
          end
        end
      end
      inherited Dock973: TDock97
        Width = 671
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 585
        Height = 157
      end
    end
  end
  inherited Dock972: TDock97
    Width = 689
  end
  inherited Dock971: TDock97
    Top = 388
    Width = 689
    inherited tb97Fundo: TToolbar97
      Left = 519
      DockPos = 645
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 352
      DockPos = 478
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 624
    Top = 504
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 424
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 712
    Top = 504
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 384
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Conjunto'
    Colunas.Strings = (
      'CONJUNTO.DESCCONJUNTO'
      'PESSOA.NOME'
      'LOCALIZACAO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição do Conjunto'
      'Responsável'
      'Localização')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONJUNTO'
      'PESSOA'
      'LOCALIZACAO')
    CamposChave.Strings = (
      'CONJUNTO.IDCONJUNTO'
      'CONJUNTO.IDPESSOA')
    Filtro.Strings = (
      'CONJUNTO.IDRESPONSAVEL= PESSOA.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA= LOCALIZACAO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '45')
    Left = 560
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 328
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 504
    Top = 0
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 464
  end
  object dsLocal: TwwDataSource
    AutoEdit = False
    DataSet = cdsLocal
    Left = 184
    Top = 136
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
      'Código do C Custo'
      'Nome do C Custo')
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
      '(LOCALIZACAO.IDRESPONSAVEL = PESSOA.IDPESSOA(+))'
      '(LOCALIZACAO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+))'
      '(LOCALIZACAO.IDEMPRESA = CENTCUST.IDEMPRESA(+))')
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
    Left = 232
    Top = 136
  end
  object dsResp: TwwDataSource
    AutoEdit = False
    DataSet = cdsResp
    Left = 528
    Top = 136
  end
  object MSResponsavel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
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
    Left = 592
    Top = 136
  end
  object cdsLocal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 136
    Top = 136
  end
  object cdsResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 472
    Top = 136
  end
  object dsCentroCusto: TwwDataSource
    AutoEdit = False
    DataSet = cdsCentroCusto
    Left = 512
    Top = 270
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 512
    Top = 256
  end
end
