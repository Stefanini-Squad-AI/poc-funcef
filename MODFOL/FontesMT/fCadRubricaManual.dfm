inherited frmCadRubricaManual: TfrmCadRubricaManual
  Left = 68
  Top = 104
  HelpContext = 210062
  Caption = 'Lançamento Manual de Histórico de Rubricas'
  ClientHeight = 421
  ClientWidth = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 670
    Height = 335
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 666
      Height = 39
      object Label1: TLabel
        Left = 146
        Top = 13
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 7
        Top = 13
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object dbtxtSituacao: TDBText
        Left = 580
        Top = 11
        Width = 74
        Height = 21
        Alignment = taCenter
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedMat: TwwDBEdit
        Left = 67
        Top = 10
        Width = 73
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 184
        Top = 10
        Width = 390
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 41
      Width = 666
      Height = 292
      Tabs.Strings = (
        'Rubricas')
      inherited pgctrlDetalhe: TPageControl
        Width = 568
        Height = 233
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited pnlControlesDet: TPanel
            Width = 560
            Height = 205
            object Label8: TLabel
              Left = 32
              Top = 113
              Width = 45
              Height = 13
              Caption = 'Rubrica'
            end
            object Label9: TLabel
              Left = 400
              Top = 55
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label3: TLabel
              Left = 32
              Top = 160
              Width = 79
              Height = 13
              Caption = 'Tipo de Folha'
            end
            object Label4: TLabel
              Left = 400
              Top = 113
              Width = 63
              Height = 13
              Caption = 'Referência'
            end
            object Label5: TLabel
              Left = 400
              Top = 7
              Width = 113
              Height = 13
              Caption = 'Data de Pagamento'
            end
            object dblkpcmbRubrica: TwwDBLookupCombo
              Left = 32
              Top = 128
              Width = 339
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRPROVDESC'#9'130'#9'Rubrica'
                'CODPROVDESC'#9'7'#9'Código')
              DataField = 'IDRUBRICA'
              DataSource = dsDet
              LookupTable = CdsProvDesc
              LookupField = 'IDRUBRICA'
              Style = csDropDownList
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object dblcMotivo: TwwDBLookupCombo
              Left = 32
              Top = 175
              Width = 339
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVO'
              DataSource = dsDet
              LookupTable = CdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object dbedRefer: TwwDBEdit
              Left = 400
              Top = 128
              Width = 121
              Height = 21
              DataField = 'REFERENCIA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedValor: TDBRealEdit
              Left = 400
              Top = 70
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VALORPROVENTO'
              DataSource = dsDet
            end
            object grpMesInicio: TGroupBox
              Left = 32
              Top = 4
              Width = 300
              Height = 45
              Caption = 'Ano e Mês de Referência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object Label7: TLabel
                Left = 9
                Top = 18
                Width = 24
                Height = 13
                Caption = 'Mês'
              end
              object Label10: TLabel
                Left = 176
                Top = 18
                Width = 23
                Height = 13
                Caption = 'Ano'
              end
              object cmbMesRef: TComboBox
                Left = 39
                Top = 16
                Width = 114
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
                Items.Strings = (
                  'Janeiro'
                  'Fevereiro'
                  'Março'
                  'Abril'
                  'Maio'
                  'Junho'
                  'Julho'
                  'Agosto'
                  'Setembro'
                  'Outubro'
                  'Novembro'
                  'Dezembro')
              end
              object spnedAnoRef: TSpinEdit
                Left = 209
                Top = 15
                Width = 68
                Height = 22
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MaxValue = 0
                MinValue = 0
                ParentFont = False
                TabOrder = 1
                Value = 1950
              end
            end
            object GroupBox1: TGroupBox
              Left = 32
              Top = 60
              Width = 300
              Height = 45
              Caption = 'Ano e Mês de Cobrança / Pagamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object Label11: TLabel
                Left = 9
                Top = 18
                Width = 24
                Height = 13
                Caption = 'Mês'
              end
              object Label12: TLabel
                Left = 176
                Top = 18
                Width = 23
                Height = 13
                Caption = 'Ano'
              end
              object cmbMesCob: TComboBox
                Left = 39
                Top = 16
                Width = 114
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
                Items.Strings = (
                  'Janeiro'
                  'Fevereiro'
                  'Março'
                  'Abril'
                  'Maio'
                  'Junho'
                  'Julho'
                  'Agosto'
                  'Setembro'
                  'Outubro'
                  'Novembro'
                  'Dezembro')
              end
              object spnedAnoCob: TSpinEdit
                Left = 209
                Top = 15
                Width = 68
                Height = 22
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MaxValue = 0
                MinValue = 0
                ParentFont = False
                TabOrder = 1
                Value = 1950
              end
            end
            object dbedDataPagamento: TCMDateTimePicker
              Left = 400
              Top = 23
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPAGAMENTO'
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
              TabOrder = 4
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 560
            Height = 205
            Selected.Strings = (
              'MES'#9'8'#9'Mês de Referência'
              'MESCOBRANCA'#9'8'#9'Mês de Cob./Pag.'
              'CODPROVDESC'#9'10'#9'Código'
              'DESCRPROVDESC'#9'40'#9'Rubrica'
              'VALORPROVENTO'#9'13'#9'Valor (R$)')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect]
            ParentFont = False
            ReadOnly = True
            OnDblClick = nil
          end
        end
      end
      inherited Dock973: TDock97
        Width = 658
      end
      inherited Dock974: TDock97
        Left = 572
        Height = 233
      end
    end
  end
  inherited Dock972: TDock97
    Width = 670
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 288
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        ParentShowHint = False
        Visible = False
      end
      object sbtnElimHistRubSal: TToolbarButton97
        Left = 180
        Top = 0
        Width = 108
        Height = 41
        Hint = 'Exclusão Seletiva ou Global  de Histórico de Rubricas'
        AllowAllUp = True
        Caption = '&Exclusão Global'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnApagarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 670
    inherited tb97Fundo: TToolbar97
      Left = 499
      DockPos = 504
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 210062
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 330
      DockPos = 335
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 560
    Top = 14
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 378
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 560
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 499
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 350
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'SITFUNC')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'SITFUNC.IDSITFUNC     = FUNCIONARIO.IDSITFUNC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    Left = 622
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 427
    Top = 73
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 449
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsDetIndex'
        DescFields = 'MES'
        Fields = 'CODPROVDESC;MES'
        Options = [ixDescending]
      end>
    IndexName = 'CdsDetIndex'
    Params = <>
    StoreDefs = True
    AfterInsert = CdsDetAfterInsert
    BeforePost = CdsDetBeforePost
    Left = 415
    Top = 1
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsMotivoIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsMotivoIndex'
    Params = <>
    StoreDefs = True
    Left = 603
    Top = 246
  end
  object CdsProvDesc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsProvDescIndex'
        CaseInsFields = 'DESCRPROVDESC'
        Fields = 'DESCRPROVDESC'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsProvDescIndex'
    Params = <>
    StoreDefs = True
    Left = 603
    Top = 233
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 603
    Top = 220
  end
end
