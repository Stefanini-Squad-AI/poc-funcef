inherited frmCadRepactua: TfrmCadRepactua
  Left = 68
  Top = 67
  Caption = 'Repactuação Contratual'
  ClientHeight = 448
  ClientWidth = 662
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 662
    Height = 362
    object gbContrato: TGroupBox
      Left = 17
      Top = 8
      Width = 616
      Height = 102
      Caption = 'Contrato'
      TabOrder = 0
      object Label3: TLabel
        Left = 14
        Top = 57
        Width = 61
        Height = 13
        Caption = 'Comprador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 326
        Top = 57
        Width = 139
        Height = 13
        Caption = 'Condição de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inline molProposta1: TmolProposta
        Left = 6
        Top = 14
        Width = 595
        inherited Label1: TLabel
          Width = 44
          Caption = 'Número'
        end
        inherited Label2: TLabel
          Width = 58
          Caption = 'Descrição'
        end
        inherited edtNomProp: TEdit
          Width = 425
        end
        inherited btnBuscaProp: TBitBtn
          Left = 538
          OnClick = molProposta1btnBuscaPropClick
        end
        inherited btnLimpaProp: TBitBtn
          Left = 562
          OnClick = molProposta1btnLimpaPropClick
        end
      end
      object edtComprador: TEdit
        Left = 14
        Top = 73
        Width = 291
        Height = 21
        TabStop = False
        Enabled = False
        TabOrder = 1
      end
      object dblcbCondPag: TCMDBLookupCombo
        Left = 326
        Top = 73
        Width = 269
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DSCCOND'#9'10'#9'Vencimento    Valor Finaciado   Nr. Parcelas'#9'F')
        DataField = 'IDCONDINICIAL'
        DataSource = ds
        LookupTable = qryCondPag
        LookupField = 'IDCONDPAGIMOVEL'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcbCondPagChange
      end
    end
    object gbInicio: TGroupBox
      Left = 16
      Top = 114
      Width = 305
      Height = 57
      Caption = 'Início da Repactuação'
      TabOrder = 1
      object Label5: TLabel
        Left = 16
        Top = 15
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label6: TLabel
        Left = 183
        Top = 15
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object sbBusca: TSpeedButton
        Left = 261
        Top = 26
        Width = 26
        Height = 25
        Hint = 'Busca Condição Vigente'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbBuscaClick
      end
      object cboMes: TComboBox
        Left = 16
        Top = 29
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cboMesChange
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
      object DBspnAno: TwwDBSpinEdit
        Left = 183
        Top = 29
        Width = 66
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object gbTermino: TGroupBox
      Left = 328
      Top = 114
      Width = 305
      Height = 57
      Caption = 'Término da Repactuação'
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 15
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label2: TLabel
        Left = 183
        Top = 17
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object cboMesFim: TComboBox
        Left = 16
        Top = 29
        Width = 153
        Height = 21
        TabStop = False
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
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
      object DBspnAnoFim: TwwDBSpinEdit
        Left = 183
        Top = 29
        Width = 66
        Height = 21
        TabStop = False
        Increment = 1
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object pcRepactua: TPageControl
      Left = 1
      Top = 183
      Width = 660
      Height = 178
      ActivePage = tsCondicao
      Align = alBottom
      TabOrder = 3
      OnChange = pcRepactuaChange
      OnChanging = pcRepactuaChanging
      object tsCondicao: TTabSheet
        Caption = 'Nova Condição de Pagamento'
        object pCond: TPanel
          Left = 0
          Top = 0
          Width = 652
          Height = 150
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label11: TLabel
            Left = 17
            Top = 65
            Width = 109
            Height = 13
            Caption = 'Indice de Correção'
          end
          object Label10: TLabel
            Left = 17
            Top = 16
            Width = 85
            Height = 13
            Caption = 'Saldo Devedor'
          end
          object Label13: TLabel
            Left = 158
            Top = 16
            Width = 115
            Height = 13
            Caption = 'Próximo Vencimento'
          end
          object Label12: TLabel
            Left = 157
            Top = 64
            Width = 108
            Height = 13
            Caption = 'Indice de Projeção'
          end
          object Label14: TLabel
            Left = 302
            Top = 16
            Width = 62
            Height = 13
            Caption = 'Nº Parcela'
          end
          object Label15: TLabel
            Left = 392
            Top = 16
            Width = 51
            Height = 13
            Caption = 'Intervalo'
          end
          object Label16: TLabel
            Left = 392
            Top = 65
            Width = 63
            Height = 13
            Caption = 'Taxa Juros'
          end
          object dbcbJurosMensal: TDBCheckBox
            Left = 17
            Top = 119
            Width = 233
            Height = 17
            Caption = 'Aplica Taxa de Juros Mensalmente'
            DataField = 'FLGREAJMENSAL'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dblcbIndCorr: TCMDBLookupCombo
            Left = 17
            Top = 81
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'Sigla'#9'F'
              'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
            DataField = 'INDCORRECAO'
            DataSource = ds
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object edSaldoDev: TDBRealEdit
            Left = 17
            Top = 32
            Width = 118
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
            DataField = 'VLRFINANC'
            DataSource = ds
          end
          object cmDtVencto: TCMDateTimePicker
            Left = 158
            Top = 32
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAVENCIMENTO'
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
            TabOrder = 3
          end
          object dblcbIndProj: TCMDBLookupCombo
            Left = 157
            Top = 80
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'Sigla'#9'F'
              'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
            DataField = 'IDINDCORRPROJ'
            DataSource = ds
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbedtParc: TDBRealEdit
            Left = 302
            Top = 32
            Width = 63
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'NUMPARCELAS'
            DataSource = ds
          end
          object DBRealEdit7: TDBRealEdit
            Left = 392
            Top = 32
            Width = 68
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'PERIODO'
            DataSource = ds
          end
          object DBRealEdit8: TDBRealEdit
            Left = 392
            Top = 81
            Width = 68
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'TAXAJUROS'
            DataSource = ds
          end
          object dbrgPerJuros: TDBRadioGroup
            Left = 472
            Top = 68
            Width = 137
            Height = 36
            Caption = ' Período '
            Columns = 2
            DataField = 'PERIODOTAXA'
            DataSource = ds
            Items.Strings = (
              'Mensal'
              'Anual')
            TabOrder = 8
            Values.Strings = (
              'M'
              'A')
          end
          object dbrgPerParc: TDBRadioGroup
            Left = 472
            Top = 20
            Width = 137
            Height = 36
            Caption = ' Período '
            Columns = 2
            DataField = 'PRAZO'
            DataSource = ds
            Items.Strings = (
              'Meses'
              'Anos')
            TabOrder = 9
            Values.Strings = (
              'M'
              'A')
          end
          object cbAlteraSaldo: TCheckBox
            Left = 302
            Top = 119
            Width = 288
            Height = 17
            Caption = 'Transfere o Total Devido para a Repactuação'
            TabOrder = 10
            OnClick = cbAlteraSaldoClick
          end
        end
      end
      object tsParcelas: TTabSheet
        Caption = 'Parcelas em Aberto'
        ImageIndex = 1
        object pParc: TPanel
          Left = 0
          Top = 0
          Width = 652
          Height = 150
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object dbgParc: TwwDBGrid
            Left = 0
            Top = 0
            Width = 652
            Height = 123
            Selected.Strings = (
              'NUMPARCELA'#9'7'#9'Parcela'#9'T'
              'DATAVENCIMENTO'#9'13'#9'Dt. Vencimento'#9'T'
              'CAL_TIPO'#9'20'#9'Tipo'#9'T'
              'VLRPRESTACAO'#9'15'#9'Valor Prestação'#9'T'
              'DATAPAGAMENTO'#9'13'#9'Dt. Pagamento'#9'T'
              'VLRPAGO'#9'15'#9'Valor Pago'#9'T'
              'VLRDEVIDO'#9'12'#9'Valor Devido'#9'T'
              'VLRJUROS'#9'12'#9'Juros Financ'#9'T'
              'VLRRESIDUOATUALI'#9'10'#9'Resíduo Final'#9'T')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
            Align = alClient
            DataSource = dsParc
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object Panel1: TPanel
            Left = 0
            Top = 123
            Width = 652
            Height = 27
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Label7: TLabel
              Left = 456
              Top = 9
              Width = 74
              Height = 13
              Caption = 'Total Devido'
            end
            object Label8: TLabel
              Left = 232
              Top = 9
              Width = 90
              Height = 13
              Caption = 'Total em Atraso'
            end
            object Label9: TLabel
              Left = 8
              Top = 9
              Width = 85
              Height = 13
              Caption = 'Saldo Devedor'
            end
            object edTotDevido: TDBRealEdit
              Left = 536
              Top = 3
              Width = 91
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edTotAtraso: TDBRealEdit
              Left = 328
              Top = 3
              Width = 91
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edTotSaldoDev: TDBRealEdit
              Left = 99
              Top = 3
              Width = 91
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 662
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 662
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
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
    Left = 379
    Top = 65534
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONDPAGIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  INDCORRECAO = :INDCORRECAO,'
      '  IDINDCORRPROJ = :IDINDCORRPROJ,'
      '  VLRFINANC = :VLRFINANC,'
      '  FLGREAJMENSAL = :FLGREAJMENSAL,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  DATAINI = :DATAINI,'
      '  DATAFIM = :DATAFIM,'
      '  PRAZO = :PRAZO,'
      '  PERIODO = :PERIODO,'
      '  TAXAJUROS = :TAXAJUROS,'
      '  PERIODOTAXA = :PERIODOTAXA,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  TIPOCONDPAG = :TIPOCONDPAG,'
      '  IDCONDINICIAL = :IDCONDINICIAL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    InsertSQL.Strings = (
      'insert into CONDPAGIMOVEL'
      
        '  (IDCONTRATOIMOVEL, IDCONDPAGIMOVEL, INDCORRECAO, IDINDCORRPROJ' +
        ', VLRFINANC, '
      
        '   FLGREAJMENSAL, DATAVENCIMENTO, DATAINI, DATAFIM, PRAZO, PERIO' +
        'DO, TAXAJUROS, '
      '   PERIODOTAXA, NUMPARCELAS, TIPOCONDPAG, IDCONDINICIAL)'
      'values'
      
        '  (:IDCONTRATOIMOVEL, :IDCONDPAGIMOVEL, :INDCORRECAO, :IDINDCORR' +
        'PROJ, :VLRFINANC, '
      
        '   :FLGREAJMENSAL, :DATAVENCIMENTO, :DATAINI, :DATAFIM, :PRAZO, ' +
        ':PERIODO, '
      
        '   :TAXAJUROS, :PERIODOTAXA, :NUMPARCELAS, :TIPOCONDPAG, :IDCOND' +
        'INICIAL)')
    DeleteSQL.Strings = (
      'delete from CONDPAGIMOVEL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    Left = 419
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.RAZAOSOCIAL'
      'CP.DATAINI'
      'CP.VLRFINANC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Nr. do Contrato'
      'Nome do Contrato'
      'Razão Social'
      'Data de Início'
      'Saldo Devedor Inicial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL CI'
      'PESSOA P'
      'CONDPAGIMOVEL CP')
    CamposChave.Strings = (
      'CP.IDCONDPAGIMOVEL'
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.RAZAOSOCIAL'
      'CP.IDCONTRATOIMOVEL')
    Filtro.Strings = (
      'P.IDPESSOA = CI.IDLOCATARIO'
      'CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL'
      'CP.TIPOCONDPAG = '#39'R'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '50'
      '50'
      '18'
      '10')
    Left = 525
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 460
    Top = 65534
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDCONTRATOIMOVEL,'
      '      IDCONDPAGIMOVEL,'
      '      INDCORRECAO,'
      '      IDINDCORRPROJ,'
      '      VLRFINANC,'
      '      FLGREAJMENSAL,'
      '      DATAVENCIMENTO,'
      '      DATAINI,'
      '      DATAFIM,'
      '      PRAZO,'
      '      PERIODO,'
      '      TAXAJUROS,'
      '      PERIODOTAXA,'
      '      NUMPARCELAS,'
      '      TIPOCONDPAG,'
      '      IDCONDINICIAL'
      ''
      'FROM'
      '      CONDPAGIMOVEL'
      'WHERE'
      '      (TIPOCONDPAG = '#39'R'#39')'
      '  AND (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL)'
      ' '
      ' ')
    Left = 338
    Top = 65534
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end>
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
    end
    object qryINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.INDCORRECAO'
    end
    object qryIDINDCORRPROJ: TFloatField
      FieldName = 'IDINDCORRPROJ'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDINDCORRPROJ'
    end
    object qryVLRFINANC: TFloatField
      FieldName = 'VLRFINANC'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.VLRFINANC'
    end
    object qryFLGREAJMENSAL: TStringField
      FieldName = 'FLGREAJMENSAL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.FLGREAJMENSAL'
      FixedChar = True
      Size = 1
    end
    object qryDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.DATAVENCIMENTO'
    end
    object qryDATAINI: TDateTimeField
      FieldName = 'DATAINI'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.DATAINI'
    end
    object qryDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.DATAFIM'
    end
    object qryPRAZO: TStringField
      FieldName = 'PRAZO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PRAZO'
      FixedChar = True
      Size = 1
    end
    object qryPERIODO: TFloatField
      FieldName = 'PERIODO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PERIODO'
    end
    object qryTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.TAXAJUROS'
    end
    object qryPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PERIODOTAXA'
      FixedChar = True
      Size = 1
    end
    object qryNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.NUMPARCELAS'
    end
    object qryTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.TIPOCONDPAG'
      FixedChar = True
      Size = 1
    end
    object qryIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDINICIAL'
    end
  end
  object qryMoeda: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MOECODIGO,'
      '    MOESIGLA,'
      '    MOEDESC,'
      '    FLGPERCVALOR'
      'FROM'
      '    MOEDA'
      'WHERE'
      '    (MOEINATIVO = '#39'A'#39')'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 589
    Top = 178
    object qryMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'BASEDADOS.MOEDA.MOESIGLA'
      Size = 10
    end
    object qryMoedaFLGPERCVALOR: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Origin = 'BASEDADOS.MOEDA.FLGPERCVALOR'
      FixedChar = True
      Size = 1
    end
    object qryMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object qryCondPag: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDCONTRATOIMOVEL,'
      '      IDCONDPAGIMOVEL,'
      '      DATAINI,'
      '      DATAVENCIMENTO,'
      '      NUMPARCELAS,'
      '      VLRFINANC,'
      '      INDCORRECAO,'
      '      IDINDCORRPROJ,'
      '      FLGREAJMENSAL,'
      '      PRAZO,'
      '      PERIODO,'
      '      TAXAJUROS,'
      '      PERIODOTAXA,'
      
        '      (TO_CHAR(DATAVENCIMENTO,'#39'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(VL' +
        'RFINANC,'#39'99999,999,999.99'#39') || '#39'  '#39' || TO_CHAR(NUMPARCELAS,'#39'999'#39 +
        ')) AS DSCCOND'
      'FROM'
      '      CONDPAGIMOVEL'
      'WHERE'
      '      (TIPOCONDPAG = '#39'P'#39')'
      
        '  AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (IDCONTRATOIMOVEL = :pID' +
        'CONTRATOIMOVEL) )'
      ''
      'ORDER BY DSCCOND'
      '')
    ValidateWithMask = True
    Left = 589
    Top = 191
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagDSCCOND: TStringField
      DisplayLabel = 'Vencimento    Valor Finaciado   Nr. Parcelas'
      DisplayWidth = 10
      FieldName = 'DSCCOND'
      Size = 32
    end
    object qryCondPagDATAINI: TDateTimeField
      DisplayLabel = 'Data de Início'
      DisplayWidth = 18
      FieldName = 'DATAINI'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.DATAINI'
      Visible = False
    end
    object qryCondPagVLRFINANC: TFloatField
      DisplayLabel = 'Valor Financiado'
      DisplayWidth = 10
      FieldName = 'VLRFINANC'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.VLRFINANC'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryCondPagNUMPARCELAS: TFloatField
      DisplayLabel = '                      Nr. Parcelas'
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.NUMPARCELAS'
      Visible = False
    end
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.INDCORRECAO'
      Visible = False
    end
    object qryCondPagIDINDCORRPROJ: TFloatField
      FieldName = 'IDINDCORRPROJ'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDINDCORRPROJ'
      Visible = False
    end
    object qryCondPagFLGREAJMENSAL: TStringField
      FieldName = 'FLGREAJMENSAL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.FLGREAJMENSAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCondPagPRAZO: TStringField
      FieldName = 'PRAZO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PRAZO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCondPagPERIODO: TFloatField
      FieldName = 'PERIODO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PERIODO'
      Visible = False
    end
    object qryCondPagTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.TAXAJUROS'
      Visible = False
    end
    object qryCondPagPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PERIODOTAXA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCondPagDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
  end
  object qryParc: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnCalcFields = qryParcCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     CP.IDCONTRATOIMOVEL,'
      ''
      
        '     DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39' |' +
        '| TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,'
      
        '     DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO)' +
        ' AS DATAVENCIMENTO,'
      
        '     DECODE(PF.FLGRESIDUOINCORP,'#39'S'#39',0,PF.VLRRESIDUOATUALI) AS VL' +
        'RRESIDUOATUALI,'
      '     PF.VLRPRESTACAO AS VLRPRESTACAO,'
      '     PF.VLRJUROS,'
      '     PF.FLGTIPOLANC,'
      '     PF.DATAPAGAMENTO,'
      '     PF.VLRPAGO AS VLRPAGO,'
      
        '     DECODE( (NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0' +
        ') + NVL(PF.VLRJUROSCORRIG,0)),'
      '              0, PF.VLRPRESTACAO,'
      
        '             (NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0' +
        ') + NVL(PF.VLRJUROSCORRIG,0)) ) AS VLRDEVIDO'
      ''
      'FROM'
      '     PARCFINANCIMOV PF,'
      '     CONDPAGIMOVEL  CP,'
      ''
      '     ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL,'
      '              A.NUMPARCELAS    AS NUMPARCELAS,'
      '              A.DATAINI,'
      '              A.IDCONDPAGIMOVEL'
      '       FROM   CONDPAGIMOVEL A,'
      '              (SELECT   IDCONDINICIAL,'
      '                        MAX(DATAINI) AS DATAINI'
      '               FROM     CONDPAGIMOVEL'
      '               GROUP BY IDCONDINICIAL) B'
      '       WHERE   B.IDCONDINICIAL = A.IDCONDINICIAL'
      '         AND   B.DATAINI       = A.DATAINI ) CPFINAL'
      ''
      'WHERE'
      '         (PF.FLGTIPOLANC IN (2,3,5,6,7,8))'
      '     AND (PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO = '#39'N'#39')'
      '     AND (PF.IDPARCDIVERGE IS NULL)'
      '     AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '     AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'
      
        '     AND ( (:pIDCONDPAGIMOVEL IS NULL) OR (CP.IDCONDPAGIMOVEL = ' +
        ':pIDCONDPAGIMOVEL) )'
      
        '     AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO <= TO_DATE(:p' +
        'DTFIM,'#39'DD/MM/YYYY'#39')) )'
      ''
      'ORDER BY PF.DATAVENCIMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updParc
    ValidateWithMask = True
    Left = 509
    Top = 178
    ParamData = <
      item
        DataType = ftString
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end>
    object qryParcIDPARCFINANCIMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryParcIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryParcNUMPARCELA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Parc'
      DisplayWidth = 5
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor Prestação'
      DisplayWidth = 10
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcFLGTIPOLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
    end
    object qryParcDATAPAGAMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Pagamento'
      DisplayWidth = 18
      FieldName = 'DATAPAGAMENTO'
    end
    object qryParcVLRPAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 10
      FieldName = 'VLRPAGO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcVLRDEVIDO: TFloatField
      DisplayLabel = 'Valor Devido'
      DisplayWidth = 10
      FieldName = 'VLRDEVIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcCAL_TIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryParcVLRJUROS: TFloatField
      DisplayLabel = 'Juros Financ'
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcVLRRESIDUOATUALI: TFloatField
      DisplayLabel = 'Resíduo Final'
      FieldName = 'VLRRESIDUOATUALI'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 508
    Top = 190
  end
  object updParc: TUpdateSQL
    ModifySQL.Strings = (
      'update CONDPAGIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  INDCORRECAO = :INDCORRECAO,'
      '  IDINDCORRPROJ = :IDINDCORRPROJ,'
      '  VLRFINANC = :VLRFINANC,'
      '  FLGREAJMENSAL = :FLGREAJMENSAL,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  DATAINI = :DATAINI,'
      '  DATAFIM = :DATAFIM,'
      '  PRAZO = :PRAZO,'
      '  PERIODO = :PERIODO,'
      '  TAXAJUROS = :TAXAJUROS,'
      '  PERIODOTAXA = :PERIODOTAXA,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  TIPOCONDPAG = :TIPOCONDPAG,'
      '  IDCONDINICIAL = :IDCONDINICIAL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    InsertSQL.Strings = (
      'insert into CONDPAGIMOVEL'
      
        '  (IDCONTRATOIMOVEL, IDCONDPAGIMOVEL, INDCORRECAO, IDINDCORRPROJ' +
        ', VLRFINANC, '
      
        '   FLGREAJMENSAL, DATAVENCIMENTO, DATAINI, DATAFIM, PRAZO, PERIO' +
        'DO, TAXAJUROS, '
      '   PERIODOTAXA, NUMPARCELAS, TIPOCONDPAG, IDCONDINICIAL)'
      'values'
      
        '  (:IDCONTRATOIMOVEL, :IDCONDPAGIMOVEL, :INDCORRECAO, :IDINDCORR' +
        'PROJ, :VLRFINANC, '
      
        '   :FLGREAJMENSAL, :DATAVENCIMENTO, :DATAINI, :DATAFIM, :PRAZO, ' +
        ':PERIODO, '
      
        '   :TAXAJUROS, :PERIODOTAXA, :NUMPARCELAS, :TIPOCONDPAG, :IDCOND' +
        'INICIAL)')
    DeleteSQL.Strings = (
      'delete from CONDPAGIMOVEL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    Left = 507
    Top = 207
  end
end
