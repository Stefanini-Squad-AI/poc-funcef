inherited frmCadTarifaMT: TfrmCadTarifaMT
  Left = 197
  Top = 157
  HelpContext = 4170007
  Caption = 'Cadastro de Tarifas'
  ClientHeight = 488
  ClientWidth = 738
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 738
    Height = 402
    inherited pnlMestre: TPanel
      Width = 736
      Height = 130
      object lblDescricao: TLabel
        Left = 13
        Top = 4
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object lblMoeda: TLabel
        Left = 12
        Top = 45
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object Bevel1: TBevel
        Left = 262
        Top = 59
        Width = 145
        Height = 21
      end
      object Label1: TLabel
        Left = 16
        Top = 85
        Width = 171
        Height = 13
        Caption = 'Vinculada à Cidade (opcional)'
      end
      object dbedDescricao: TwwDBEdit
        Left = 12
        Top = 19
        Width = 395
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcMoeda: TwwDBLookupCombo
        Left = 12
        Top = 59
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'10'#9'Sigla'#9'F')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = cdsMoeda
        LookupField = 'MOECODIGO'
        DropDownWidth = 314
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dbrgTipo: TDBRadioGroup
        Left = 417
        Top = 4
        Width = 175
        Height = 118
        Caption = 'Tipo de Tarifa'
        DataField = 'INDTIPO'
        DataSource = ds
        Items.Strings = (
          'Diária'
          'Embarque'
          'Hotel'
          'Deslocamento/Abatim.'
          'Quilometragem')
        TabOrder = 4
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object chkEdicaoLivre: TDBCheckBox
        Left = 265
        Top = 61
        Width = 138
        Height = 17
        Caption = 'Percentual Livre (%)'
        DataField = 'FLGEDITAR'
        DataSource = ds
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object ProcuraCidade: TCMProcura
        Left = 12
        Top = 98
        Width = 395
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        DataSource = ds
        DataField = 'IDCIDADES'
        LookupChave = 'IDCIDADES'
        LookupDescricao = 'NOME'
        MontaSelect = MontaSelectCidade
        LookupTabela = 'CIDADES'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
      object dbrgDiasSemana: TDBRadioGroup
        Left = 598
        Top = 4
        Width = 134
        Height = 118
        Caption = 'Dias da Semana'
        DataField = 'INDDIASEMANA'
        DataSource = ds
        Items.Strings = (
          'Qualquer Dia'
          'Só Descanso'
          'Menos Descanso')
        TabOrder = 5
        Values.Strings = (
          '0'
          '1'
          '2')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 131
      Width = 736
      Height = 270
      Tabs.Strings = (
        ' Tarifa '
        ' Cargo ')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 638
        Height = 211
        inherited tbsDet: TTabSheet
          Caption = ' Tarifa '
          inherited pnlControlesDet: TPanel
            Width = 630
            Height = 183
            OnEnter = pnlControlesDetEnter
            object Label4: TLabel
              Left = 158
              Top = 41
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object Label5: TLabel
              Left = 318
              Top = 39
              Width = 85
              Height = 13
              Caption = 'Valor da Tarifa'
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 158
              Top = 55
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATADSTVALORES'
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
              TabOrder = 0
            end
            object dbredValor: TDBRealEdit
              Left = 318
              Top = 55
              Width = 121
              Height = 21
              Hint = 'Se For Abatimento, Coloque o Valor Negativo'
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VLRDST'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 630
            Height = 183
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgPerfectRowFit]
          end
        end
        object tsCargo: TTabSheet
          Caption = ' Cargo '
          ImageIndex = 1
          object pnlAssociacao: TPanel
            Left = 0
            Top = 0
            Width = 630
            Height = 183
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 0
              Top = 0
              Width = 5
              Height = 183
              Cursor = crHSplit
              Beveled = True
            end
            object pnlNaoAssociados: TPanel
              Left = 5
              Top = 0
              Width = 290
              Height = 183
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object gridCNA: TwwDBGrid
                Left = 0
                Top = 26
                Width = 290
                Height = 157
                Selected.Strings = (
                  'TITULO'#9'40'#9'TITULO')
                IniAttributes.Delimiter = ';;'
                TitleColor = clGray
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsTarifaXCargo_NS
                KeyOptions = []
                MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
                Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgMultiSelect]
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
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 290
                Height = 26
                Align = alTop
                BevelInner = bvLowered
                Caption = 'Cargos Não Associados'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
            object pnlAssociados: TPanel
              Left = 337
              Top = 0
              Width = 293
              Height = 183
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object gridCA: TwwDBGrid
                Left = 0
                Top = 25
                Width = 293
                Height = 158
                Selected.Strings = (
                  'TITULO'#9'40'#9'TITULO')
                IniAttributes.Delimiter = ';;'
                TitleColor = clGray
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsTarifaXCargo_S
                KeyOptions = []
                MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
                Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgMultiSelect]
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
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 293
                Height = 25
                Align = alTop
                BevelInner = bvLowered
                Caption = 'Cargos Associados'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
            object pnlBotoesAssociacao: TPanel
              Left = 295
              Top = 0
              Width = 42
              Height = 183
              Align = alLeft
              Constraints.MaxWidth = 42
              Constraints.MinHeight = 168
              Constraints.MinWidth = 42
              TabOrder = 2
              object sbtnAdicionarTudo: TSpeedButton
                Left = 2
                Top = 8
                Width = 39
                Height = 34
                Hint = 'Associar Todos'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88887666666666088888788888888878F887E666666666
                  608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
                  66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
                  66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
                  660878F877887788887887E6F666F666608887F87888788887F887E666666666
                  6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                  8888888778FFFF77888888888777778888888888877777888888}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAdicionarTudoClick
              end
              object sbtnAdicionar: TSpeedButton
                Left = 2
                Top = 47
                Width = 39
                Height = 34
                Hint = 'Associar Cargo(s) Selecionado(s)'
                Enabled = False
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAdicionarClick
              end
              object sbtnRemover: TSpeedButton
                Left = 2
                Top = 86
                Width = 39
                Height = 34
                Hint = 'Desassociar Cargo(s) Selecionado(s)'
                Enabled = False
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnRemoverClick
              end
              object sbtnRemoverTudo: TSpeedButton
                Left = 2
                Top = 125
                Width = 39
                Height = 34
                Hint = 'Desassociar Todos'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88887666666666088888788888888878F887E666666666
                  608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
                  66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
                  66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
                  660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
                  6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                  8888888778FFFF77888888888777778888888888877777888888}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnRemoverTudoClick
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 728
      end
      inherited Dock974: TDock97
        Left = 642
        Height = 211
      end
    end
  end
  inherited Dock972: TDock97
    Width = 738
  end
  inherited Dock971: TDock97
    Top = 449
    Width = 738
    inherited tb97Fundo: TToolbar97
      Left = 431
      DockPos = 431
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 4170007
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 262
      DockPos = 262
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 597
    Top = 65534
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 273
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 568
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    Operacao = opVazio
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 331
    Top = 65534
  end
  inherited Cds: TCMClientDataSet
    Left = 244
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecionar Tarifa'
    Colunas.Strings = (
      'DT.DESCRICAO'
      
        'DECODE(DT.INDTIPO,1,'#39'DIÁRIA'#39',2,'#39'EMBARQUE'#39',3,'#39'HOTEL'#39',4,'#39'DESLOCAME' +
        'NTO'#39',1) AS TIPO'
      'CI.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Tipo'
      'Cidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DSTTARIFA DT'
      'CIDADES CI')
    CamposChave.Strings = (
      'DT.IDDSTTARIFA'
      'DT.INDTIPO')
    Filtro.Strings = (
      'DT.IDCIDADES = CI.IDCIDADES(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '20'
      '35')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 302
    Top = 65535
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 468
    Top = 65535
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsValores
    Left = 440
    Top = 65535
  end
  object qryValores: TCMSqlParams
    SQL.Strings = (
      'select * from dstValores')
    ClientDataSet = cdsValores
    Left = 273
    Top = 27
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 98
    object cdsMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsMoedaMOEDESC: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
  end
  object cdsValores: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDDSTTARIFA'
        DataType = ftFloat
      end
      item
        Name = 'DATADSTVALORES'
        DataType = ftDateTime
      end
      item
        Name = 'VLRDST'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'DATA_DECRESCENTE'
        Fields = 'DATADSTVALORES'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 410
    Top = 1
    object cdsValoresDATADSTVALORES: TDateTimeField
      Alignment = taCenter
      DisplayLabel = ' Data'
      DisplayWidth = 26
      FieldName = 'DATADSTVALORES'
    end
    object cdsValoresVLRDST: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 38
      FieldName = 'VLRDST'
      DisplayFormat = '#,##0.00 '
    end
    object cdsValoresIDDSTTARIFA: TFloatField
      FieldName = 'IDDSTTARIFA'
      Visible = False
    end
  end
  object qryTarifas: TCMSqlParams
    SQL.Strings = (
      'select * from dstTarifa')
    ClientDataSet = Cds
    Left = 302
    Top = 27
  end
  object cdsTarifaXCargo_NS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsTarifaXCargo_NSAfterScroll
    Left = 257
    Top = 167
  end
  object dsTarifaXCargo_NS: TwwDataSource
    AutoEdit = False
    DataSet = cdsTarifaXCargo_NS
    Left = 285
    Top = 167
  end
  object cdsTarifaXCargo_S: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsTarifaXCargo_SAfterScroll
    Left = 393
    Top = 168
    object cdsTarifaXCargo_STITULO: TStringField
      DisplayWidth = 40
      FieldName = 'TITULO'
      Size = 40
    end
    object cdsTarifaXCargo_SIDCARGO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARGO'
      Visible = False
    end
    object cdsTarifaXCargo_SIDDSTTARIFA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDSTTARIFA'
      Visible = False
    end
  end
  object dsTarifaXCargo_S: TwwDataSource
    AutoEdit = False
    DataSet = cdsTarifaXCargo_S
    Left = 421
    Top = 167
  end
  object qryCargosNS: TCMSqlParams
    SQL.Strings = (
      'select /*+RULE+*/'
      '  cg.idcargo,'
      '  cg.titulo'
      'from'
      '  cargo cg'
      'where'
      '  cg.idcargo'
      '    not in'
      '    (select tc1.idcargo from dstTarifaXCargo tc1, dstTarifa tf1'
      '     where tc1.IDDSTTARIFA = tf1.IDDSTTARIFA '
      '       and tf1.INDTIPO = 1 and tf1.IDDSTTARIFA = 1)'
      ''
      'and'
      '  cg.idcargo'
      '    not in'
      '    (select tc2.idcargo from dstTarifaXCargo tc2, dstTarifa tf2'
      
        '     where  tc2.IDDSTTARIFA = tf2.IDDSTTARIFA and tf2.INDTIPO = ' +
        '1)'
      '     '
      'order by cg.titulo')
    ClientDataSet = cdsTarifaXCargo_NS
    Left = 112
    Top = 132
  end
  object qryCargoS: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  tc.iddsttarifa, tc.IDCARGO, cg.TITULO'
      'FROM '
      '  CARGO cg,'
      '  DSTTARIFAXCARGO tc,'
      '  DSTTARIFA dt'
      '  '
      'WHERE '
      '  cg.IDCARGO = tc.IDCARGO'
      '  and dt.IDDSTTARIFA = tc.IDDSTTARIFA'
      '  and dt.INDTIPO = 1'
      '  and dt.IDDSTTARIFA = 1'
      ''
      'ORDER BY TITULO')
    ClientDataSet = cdsTarifaXCargo_S
    Left = 140
    Top = 132
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from moeda')
    ClientDataSet = cdsMoeda
    Left = 197
    Top = 98
  end
  object qryPrincipal: TCMSqlParams
    SQL.Strings = (
      'select * from dsttarifa')
    ClientDataSet = Cds
    Left = 244
    Top = 27
  end
  object CmeDetalheCargoSelecionado: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    OnDelete = CmeDetalheDelete
    OnEdit = CmeDetalheEdit
    OnCancel = CmeDetalheCancel
    OnConfirma = CmeDetalheConfirma
    OnAtualizaBotoes = CmeDetalheCargoSelecionadoAtualizaBotoes
    DataSource = dsTarifaXCargo_S
    OpenDsAutomatico = False
    Left = 449
    Top = 166
  end
  object MontaSelectCidade: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cidade'
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.CODESTADO'
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Cidade'
      'Sigla UF'
      'País')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES'
      'ESTADO'
      'PAIS')
    CamposChave.Strings = (
      'CIDADES.IDCIDADES')
    Filtro.Strings = (
      'CIDADES.IDESTADO = ESTADO.IDESTADO'
      'ESTADO.IDPAIS = PAIS.IDPAIS')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 319
    Top = 140
  end
end
