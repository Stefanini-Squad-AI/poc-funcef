inherited frmPessoaLocatarioMT: TfrmPessoaLocatarioMT
  Left = 0
  Top = 2
  HelpContext = 640036
  Caption = 'Cadastro de Locatários'
  ClientHeight = 709
  ClientWidth = 1016
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1016
    Height = 623
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 1014
      Height = 516
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados do Cliente')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 916
        Height = 457
        ActivePage = tsCliente
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 908
            Height = 429
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 908
            Height = 429
            inherited pnlItemsDoc: TPanel
              Height = 427
            end
            inherited pnlFoto: TPanel
              Width = 418
              Height = 427
              inherited BvlImagem: TBevel
                Height = 396
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 396
                Width = 418
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 416
                Height = 396
              end
            end
            inherited lstDocumentos: TListView
              Height = 427
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 908
            Height = 429
            inherited grpTipoEnd: TGroupBox
              Left = 711
              Height = 429
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 908
            Height = 429
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Left = 679
            Height = 429
          end
          inherited Panel1: TPanel
            Width = 679
            Height = 429
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 679
            Height = 429
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 682
            Height = 429
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Left = 706
            Height = 429
          end
          inherited Panel2: TPanel
            Width = 706
            Height = 429
          end
          inherited dbgContato: TwwDBGrid
            Width = 706
            Height = 429
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 709
            Height = 429
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 908
            Height = 429
          end
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 908
            Height = 429
          end
        end
        object tsCliente: TTabSheet
          Caption = 'Dados do Cliente'
          ImageIndex = 5
          object lblSubConta: TLabel
            Left = 8
            Top = 194
            Width = 122
            Height = 13
            Caption = 'Sub-Conta Associada'
          end
          object Label2: TLabel
            Left = 512
            Top = 250
            Width = 87
            Height = 13
            Caption = 'Tipo do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object BtnDelTipos: TSpeedButton
            Left = 356
            Top = 100
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnDelTiposClick
          end
          object BtnAddTipos: TSpeedButton
            Left = 356
            Top = 60
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnAddTiposClick
          end
          object DBcboSubConta: TwwDBLookupCombo
            Left = 8
            Top = 208
            Width = 369
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'No')
            DataField = 'CODSUBCONTA'
            DataSource = dsSubTipo
            LookupTable = cdsSubConta
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBcboTipoCliente: TwwDBLookupCombo
            Left = 512
            Top = 264
            Width = 249
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'DESCRICAO')
            LookupTable = cdsTipoCliente
            LookupField = 'IDTIPOCLIENTE'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            Visible = False
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object GrdTipos: TwwDBGrid
            Left = 7
            Top = 36
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Tipo Cliente')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTipos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 2
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object PnlTipos: TPanel
            Left = 8
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Cliente'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object GrdTiposCli: TwwDBGrid
            Left = 386
            Top = 36
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTiposCli
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 4
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object PnlTiposCli: TPanel
            Left = 386
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos do Cliente'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1006
      end
      inherited Dock974: TDock97
        Left = 920
        Height = 457
      end
    end
    inherited pnlMestre: TPanel
      Width = 1014
    end
  end
  inherited Dock972: TDock97
    Width = 1016
  end
  inherited Dock971: TDock97
    Top = 670
    Width = 1016
  end
  inherited ds: TwwDataSource
    Left = 44
    Top = 565
  end
  inherited Cds: TCMClientDataSet
    Left = 52
    Top = 519
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF / CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'LOCATARIO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = LOCATARIO.IDLOCATARIO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '60')
  end
  inherited dsSubTipo: TwwDataSource
    Left = 684
    Top = 565
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 313
    Top = 565
  end
  inherited ImlDocumentos: TImageList
    Left = 841
    Top = 63
  end
  inherited dsTelefone: TwwDataSource
    Left = 225
    Top = 565
  end
  inherited dsEndereco: TwwDataSource
    Left = 177
    Top = 565
  end
  inherited dsContato: TwwDataSource
    Left = 271
    Top = 565
  end
  inherited dsTelContato: TwwDataSource
    Left = 503
    Top = 565
  end
  inherited dsDocumento: TwwDataSource
    Left = 114
    Top = 565
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 591
    Top = 565
  end
  inherited dsImagem: TwwDataSource
    Left = 546
    Top = 565
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 639
    Top = 565
  end
  inherited MSGrupo: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N')
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 417
    Top = 533
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 82
    Top = 519
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 129
    Top = 519
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 175
    Top = 519
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 221
    Top = 519
  end
  inherited CdsContato: TCMClientDataSet
    Left = 268
    Top = 519
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 500
    Top = 519
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 546
    Top = 519
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 592
    Top = 519
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 639
    Top = 519
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 685
    Top = 519
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 314
    Top = 519
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 361
    Top = 519
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 415
    Top = 487
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 453
    Top = 519
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 129
    Top = 618
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 82
    Top = 618
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 178
    Top = 618
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 559
    Top = 92
  end
  object cdsTipoCliente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 559
    Top = 109
  end
  object cdsForCli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 631
    Top = 92
  end
  object dsForCli: TwwDataSource
    AutoEdit = False
    DataSet = CdsSubTipo
    Left = 631
    Top = 110
  end
  object DsTipos: TwwDataSource
    DataSet = CdsTipos
    Left = 784
    Top = 452
  end
  object CdsTipos: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRICAO'
    Params = <>
    Left = 784
    Top = 404
  end
  object DsTiposCli: TwwDataSource
    DataSet = CdsTiposCli
    Left = 856
    Top = 452
  end
  object CdsTiposCli: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRICAO'
    Params = <>
    Left = 856
    Top = 412
  end
  object cdsClientePess: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 799
    Top = 309
  end
  object cdsCliente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 809
    Top = 319
  end
end
