inherited frmRecebeRecadastramento: TfrmRecebeRecadastramento
  Left = 288
  Top = 162
  HelpContext = 160104
  BorderIcons = []
  Caption = 'Recebimento de Cartas de Recadastramento'
  ClientHeight = 494
  ClientWidth = 790
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 790
    Height = 455
    object pnlBottom: TPanel
      Left = 1
      Top = 205
      Width = 788
      Height = 249
      Align = alClient
      TabOrder = 0
      object pgcDados: TPageControl
        Left = 1
        Top = 1
        Width = 786
        Height = 247
        ActivePage = tbsDados
        Align = alClient
        TabOrder = 0
        object tbsDados: TTabSheet
          Caption = 'Dados Pessoais'
          object Label12: TLabel
            Left = 0
            Top = 8
            Width = 73
            Height = 13
            Caption = 'Nome do Pai'
          end
          object Label13: TLabel
            Left = 392
            Top = 8
            Width = 79
            Height = 13
            Caption = 'Nome da Mãe'
          end
          object Label14: TLabel
            Left = 0
            Top = 64
            Width = 73
            Height = 13
            Caption = 'Naturalidade'
          end
          object Label15: TLabel
            Left = 136
            Top = 64
            Width = 82
            Height = 13
            Caption = 'Nacionalidade'
          end
          object Label16: TLabel
            Left = 272
            Top = 64
            Width = 68
            Height = 13
            Caption = 'Estado Civil'
          end
          object Label29: TLabel
            Left = 656
            Top = 64
            Width = 116
            Height = 13
            Caption = 'Data de Nascimento'
          end
          object dbrSexo: TDBRadioGroup
            Left = 416
            Top = 64
            Width = 233
            Height = 41
            Caption = ' Sexo '
            Columns = 2
            DataField = 'SEXO'
            DataSource = dsPessoal
            Items.Strings = (
              '&Masculino'
              '&Feminino')
            TabOrder = 5
            Values.Strings = (
              'M'
              'F')
          end
          object dblkpcmbNaturalidade: TwwDBLookupCombo
            Left = 0
            Top = 80
            Width = 130
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEESTADO'#9'30'#9'Natural de...'#9'F')
            DataField = 'CODESTADO'
            DataSource = dsPessoal
            LookupTable = qryEstado
            LookupField = 'CODESTADO'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dbcEstCivil: TwwDBComboBox
            Left = 272
            Top = 80
            Width = 129
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            CharCase = ecUpperCase
            DataField = 'ESTCIVIL'
            DataSource = dsPessoal
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'SOLTEIRO(A)'#9'S'
              'CASADO(A)'#9'C'
              'DIVORCIADO(A)'#9'D'
              'DESQUITADO(A)'#9'E'
              'SEPARADO(A) JUDICIAL'#9'J'
              'VIÚVO(A)'#9'V'
              'OUTROS'#9'O')
            Sorted = False
            TabOrder = 4
            UnboundDataType = wwDefault
            OnChange = dbcEstCivilChange
          end
          object dbdtNasc: TCMDateTimePicker
            Left = 656
            Top = 80
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATANASC'
            DataSource = dsPessoal
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ShowButton = True
            TabOrder = 6
            OnExit = dbdtNascExit
          end
          object dbeNomeMae: TDBEdit
            Left = 392
            Top = 24
            Width = 385
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOMEMAE'
            DataSource = dsPessoal
            TabOrder = 1
          end
          object dblkpcmbNacionalidade: TwwDBLookupCombo
            Left = 136
            Top = 80
            Width = 130
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMENACIONALIDADE'#9'30'#9'Nacionalidade'#9'F')
            DataField = 'IDPAIS'
            DataSource = dsPessoal
            LookupTable = qryPais
            LookupField = 'IDPAIS'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dblkPais: TwwDBLookupCombo
            Left = 136
            Top = 128
            Width = 130
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEPAIS'#9'30'#9'Pais'#9'F')
            DataField = 'IDPAIS'
            DataSource = dsEnd
            LookupTable = qryPais
            LookupField = 'IDPAIS'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnExit = dblkPaisExit
          end
          object dblkEstado: TwwDBLookupCombo
            Left = 0
            Top = 128
            Width = 130
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEESTADO'#9'30'#9'Estado de '#9'F')
            DataField = 'CODESTADO'
            DataSource = dsEnd
            LookupTable = qryEstado
            LookupField = 'CODESTADO'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnExit = dblkEstadoExit
          end
          object dblkCidades: TwwDBLookupCombo
            Left = 272
            Top = 128
            Width = 130
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Cidade'#9'F')
            DataField = 'IDCIDADES'
            DataSource = dsEnd
            LookupTable = qryCidades
            LookupField = 'IDCIDADES'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 9
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnExit = dblkCidadesExit
          end
          object dbeNomePai: TDBEdit
            Left = 0
            Top = 24
            Width = 385
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOMEPAI'
            DataSource = dsPessoal
            TabOrder = 0
            OnExit = dbeNomePaiExit
          end
        end
        object tbsEnderecos: TTabSheet
          Caption = 'Endereços'
          ImageIndex = 1
          object dbgEnd: TwwDBGrid
            Left = 0
            Top = 0
            Width = 778
            Height = 219
            Selected.Strings = (
              'LOGRADOURO'#9'60'#9'Endereço'
              'NUMERO'#9'8'#9'Nº'
              'COMPLEMENTO'#9'20'#9'Complemento'
              'BAIRRO'#9'20'#9'Bairro'
              'CIDADE'#9'50'#9'Cidade'
              'CODESTADO'#9'6'#9'UF'
              'PAIS'#9'30'#9'País'
              'CEP'#9'8'#9'CEP'
              'DDD'#9'5'#9'DDD'
              'TELEFONE'#9'20'#9'Telefone')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsEnd
            KeyOptions = []
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnColExit = dbgEndColExit
            IndicatorColor = icBlack
          end
        end
        object tbsDocumentos: TTabSheet
          Caption = 'Documentos'
          ImageIndex = 2
          object dbgDoc: TwwDBGrid
            Left = 0
            Top = 0
            Width = 778
            Height = 219
            Selected.Strings = (
              'NOMEDOCUMENTO'#9'30'#9'Nome do Documento'
              'NUMDOCUMENTO'#9'18'#9'Número'
              'ORGAO'#9'30'#9'Orgão Emissor'
              'UF'#9'3'#9'UF'
              'DATAEMISSAO'#9'18'#9'Data de Emissão')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDoc
            KeyOptions = []
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnColExit = dbgDocColExit
            IndicatorColor = icBlack
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 204
      Align = alTop
      TabOrder = 1
      object lblBusca: TLabel
        Left = 8
        Top = 8
        Width = 112
        Height = 13
        Caption = 'Pesquisar Matricula'
      end
      object Label1: TLabel
        Left = 344
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Nome Titular'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 104
        Height = 13
        Caption = 'Nome Beneficiário'
      end
      object Label3: TLabel
        Left = 344
        Top = 48
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label4: TLabel
        Left = 152
        Top = 8
        Width = 112
        Height = 13
        Caption = 'Pesquisar Inscrição'
      end
      object edtBusca: TEdit
        Left = 8
        Top = 24
        Width = 129
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnExit = edtBuscaExit
      end
      object edtNomeTitular: TEdit
        Left = 344
        Top = 24
        Width = 433
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edtNomeBeneficiario: TEdit
        Left = 8
        Top = 64
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edtPlano: TEdit
        Left = 344
        Top = 64
        Width = 432
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 88
        Width = 785
        Height = 113
        Caption = ' Dados Benefício (dados relativo ao INSS) '
        TabOrder = 5
        object dbgBeneficio: TwwDBGrid
          Left = 2
          Top = 15
          Width = 781
          Height = 96
          Selected.Strings = (
            'BENEFICIARIO'#9'35'#9'Beneficiário'
            'BENEFICIO'#9'30'#9'Benefício'
            'DESCSITBENEFICIO'#9'7'#9'Situação'#9'F'
            'DATAINICIO'#9'12'#9'Data Inicial'
            'DATAFINAL'#9'12'#9'Data Final'
            'VALORATUAL'#9'10'#9'Valor'
            'BANCOINSS'#9'5'#9'Banco'
            'NUMPROCINSS'#9'11'#9'Nº Processo'
            'MESRECIBOINSS'#9'10'#9'Mês Recibo'
            'ANORECIBOINSS'#9'10'#9'Ano Recibo'
            'NUMCARTARECAD'#9'4'#9'Carta de Recad.'
            'DATARECEBRECAD'#9'18'#9'Data recebe recad.'
            'DATAEMISSAORECAD'#9'18'#9'Dt. emiss. recad.'
            'DATALIMITERECAD'#9'18'#9'Dt. limite recad.'
            'FLGSTATUS'#9'1'#9'Status')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDados
          KeyOptions = []
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgBeneficioCalcCellColors
          OnColExit = dbgBeneficioColExit
          IndicatorColor = icBlack
        end
      end
      object EdInscricao: TEdit
        Left = 152
        Top = 24
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnExit = EdInscricaoExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 455
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 618
      DockPos = 631
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 449
      DockPos = 462
      inherited bbtnConfirmar: TBitBtn
        Default = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 459
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryDados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  BF.IDTITULAR,'
      '  PT.NOME AS TITULAR,'
      '  BF.IDPESSOA,'
      '  PB.NOME AS BENEFICIARIO,'
      '  BF.IDPLANOPREV,'
      '  BF.IDPLANOORIGEM,'
      '  PL.NOME AS NOMEPLANO,'
      '  BF.IDBENEFICIO,'
      '  BE.NOME AS BENEFICIO,'
      '  BF.DATAINICIO,'
      '  BF.DATAFINAL,'
      '  BF.VALORATUAL,'
      '  BF.BANCOINSS,'
      '  BF.NUMPROCINSS,'
      '  BF.MESRECIBOINSS,'
      '  BF.ANORECIBOINSS,'
      '  BF.NUMEROPROCESSO,'
      '  BF.IDPESSJUR,'
      '  BF.PLANO,'
      '  PL.IDRGELEGBENEF,'
      '  BF.SEQPROPOSTA,'
      '  BF.VALORTOTAL,'
      '  BF.VALORCOTAS,'
      '  BF.IDSITBENEFICIO,'
      '  BF.NUMCARTARECAD, BF.DATARECEBRECAD, BF.DATAEMISSAORECAD,'
      '  BF.DATALIMITERECAD, BF.FLGSTATUS,'
      '  DECODE(BF.IDSITBENEFICIO,1,'#39'Normal'#39','#39'Retido'#39') DESCSITBENEFICIO'
      'FROM'
      '  PESSOA           PT,'
      '  PESSOA           PB,'
      '  BENEFBFCIARIO    BF,'
      '  PLANPREV         PL,'
      '  BENEFICIO        BE'
      'WHERE'
      '  (BF.DATAENCERRAMENTO IS NULL)               AND'
      '  (BF.IDTITULAR         = :IDPESSOA)          AND'
      '  (BF.FLGSTATUS        = '#39'P'#39'    )             AND'
      '  (BF.IDSITBENEFICIO   <> 3     )             AND'
      '  (BF.IDTITULAR        = PT.IDPESSOA)         AND'
      '  (BF.IDPESSOA         = PB.IDPESSOA)         AND'
      '  (BF.IDPLANOPREV      = PL.IDPLANOPREV)      AND'
      '  (BF.IDBENEFICIO      = BE.IDBENEFICIO)      AND'
      '  (BF.NUMEROPROCESSO   = BF.NUMEROPROCESSO)   AND'
      '  (BF.IDPESSJUR        = BF.IDPESSJUR)        AND'
      '  (BF.SEQPROPOSTA      = BF.SEQPROPOSTA)      AND'
      '  (BF.IDSITBENEFICIO   = BF.IDSITBENEFICIO)   AND'
      '  (BF.FLGFORMAPAGTO    = BF.FLGFORMAPAGTO)    AND'
      '  (BE.FLGBENEFOBRIGATO = BE.FLGBENEFOBRIGATO)'
      ''
      '')
    UpdateObject = updDados
    PictureMasks.Strings = (
      'DATAINICIO'#9'##/##/####'#9'T'#9'T'
      'DATAFINAL'#9'##/##/####'#9'T'#9'T')
    ValidateWithMask = True
    Left = 533
    Top = 397
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDadosBENEFICIARIO: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 35
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryDadosBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 30
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryDadosDESCSITBENEFICIO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 7
      FieldName = 'DESCSITBENEFICIO'
      Size = 6
    end
    object qryDadosDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Inicial'
      DisplayWidth = 12
      FieldName = 'DATAINICIO'
    end
    object qryDadosDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final'
      DisplayWidth = 12
      FieldName = 'DATAFINAL'
    end
    object qryDadosVALORATUAL: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
    end
    object qryDadosBANCOINSS: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 5
      FieldName = 'BANCOINSS'
      Size = 3
    end
    object qryDadosNUMPROCINSS: TStringField
      DisplayLabel = 'Nº Processo'
      DisplayWidth = 11
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object qryDadosMESRECIBOINSS: TFloatField
      DisplayLabel = 'Mês Recibo'
      DisplayWidth = 10
      FieldName = 'MESRECIBOINSS'
    end
    object qryDadosANORECIBOINSS: TFloatField
      DisplayLabel = 'Ano Recibo'
      DisplayWidth = 10
      FieldName = 'ANORECIBOINSS'
    end
    object qryDadosNUMCARTARECAD: TStringField
      DisplayLabel = 'Carta de Recad.'
      DisplayWidth = 4
      FieldName = 'NUMCARTARECAD'
      Size = 4
    end
    object qryDadosDATARECEBRECAD: TDateTimeField
      DisplayLabel = 'Data recebe recad.'
      DisplayWidth = 18
      FieldName = 'DATARECEBRECAD'
    end
    object qryDadosDATAEMISSAORECAD: TDateTimeField
      DisplayLabel = 'Dt. emiss. recad.'
      DisplayWidth = 18
      FieldName = 'DATAEMISSAORECAD'
    end
    object qryDadosDATALIMITERECAD: TDateTimeField
      DisplayLabel = 'Dt. limite recad.'
      DisplayWidth = 18
      FieldName = 'DATALIMITERECAD'
    end
    object qryDadosFLGSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 1
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qryDadosIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDadosTITULAR: TStringField
      FieldName = 'TITULAR'
      Visible = False
      Size = 60
    end
    object qryDadosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDadosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDadosNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Visible = False
      Size = 50
    end
    object qryDadosIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryDadosNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Visible = False
    end
    object qryDadosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDadosPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryDadosIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
      Visible = False
    end
    object qryDadosSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDadosVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object qryDadosVALORCOTAS: TFloatField
      FieldName = 'VALORCOTAS'
      Visible = False
    end
    object qryDadosIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
      Visible = False
    end
    object qryDadosIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
  end
  object msBusca: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'PE.NOME'
      'EL.MATRICULA'
      'DP.NUMDOCUMENTO'
      'TD.NOMEDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Participante'
      'Matrícula'
      'Número do Documento'
      'Tipo de Documento')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PE'
      'ELEGPATRO EL'
      'DOCPESSOA DP'
      'TIPODOCPESSOA TD'
      'BENEFBFCIARIO BF')
    CamposChave.Strings = (
      'PE.IDPESSOA')
    Filtro.Strings = (
      'PE.IDPESSOA = DP.IDPESSOA'
      'DP.IDDOCUMENTO = TD.IDDOCUMENTO'
      'PE.IDPESSOA = EL.IDPESSOA'
      'BF.IDPESSOA = PE.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '13'
      '18'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 181
    Top = 128
  end
  object qryEnd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      EP.IDPESSOA,'
      '      EP.IDENDERECO,'
      '      EP.LOGRADOURO,'
      '      EP.NUMERO,'
      '      EP.COMPLEMENTO,'
      '      EP.BAIRRO,'
      '      EP.IDCIDADES,'
      '      CD.NOME AS CIDADE,'
      '      EP.CODESTADO,'
      '      EP.IDPAIS,'
      '      PA.NOMEPAIS AS PAIS,'
      '      EP.CEP,'
      '      TL.IDTELEFONE,'
      '      TL.DDD,'
      '      TL.NUMERO AS TELEFONE'
      'FROM'
      '      ENDPESS          EP,'
      '      TELENDPESS       TL,'
      '      CIDADES          CD,'
      '      PAIS             PA'
      'WHERE '
      '      (EP.IDCIDADES = CD.IDCIDADES(+))   AND'
      '      (EP.IDENDERECO = TL.IDENDERECO)    AND'
      '      (EP.IDPAIS = PA.IDPAIS)            AND'
      '      (IDPESSOA = :IDPESSOA)             AND'
      '      (TL.IDTELEFONE IN (SELECT IDTELEFONE'
      '                         FROM TELENDPESS '
      '                         WHERE IDENDERECO = EP.IDENDERECO '
      '                               AND ROWNUM = 1))'
      ' '
      ' ')
    UpdateObject = updEnd
    ControlType.Strings = (
      'CODESTADO;CustomEdit;dblkEstado'
      'CIDADE;CustomEdit;dblkCidades'
      'PAIS;CustomEdit;dblkPais')
    PictureMasks.Strings = (
      'LOGRADOURO'#9'&*!'#9'T'#9'T'
      'COMPLEMENTO'#9'&*!'#9'T'#9'T'
      'BAIRRO'#9'&*!'#9'T'#9'T'
      'CIDADE'#9'&*!'#9'T'#9'T'
      'CODESTADO'#9'&*!'#9'T'#9'T'
      'PAIS'#9'&*!'#9'T'#9'T')
    ValidateWithMask = True
    Left = 573
    Top = 397
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryEndLOGRADOURO: TStringField
      DisplayLabel = 'Endereço'
      DisplayWidth = 60
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryEndNUMERO: TStringField
      DisplayLabel = 'Nº'
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryEndCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
    end
    object qryEndBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'BAIRRO'
    end
    object qryEndCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 50
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryEndCODESTADO: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 6
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryEndPAIS: TStringField
      DisplayLabel = 'País'
      DisplayWidth = 30
      FieldName = 'PAIS'
      Size = 30
    end
    object qryEndCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object qryEndDDD: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      FixedChar = True
      Size = 5
    end
    object qryEndTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 20
      FieldName = 'TELEFONE'
    end
    object qryEndIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryEndIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Visible = False
    end
    object qryEndIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Visible = False
    end
    object qryEndIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Visible = False
    end
    object qryEndIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
      Visible = False
    end
  end
  object dsEnd: TwwDataSource
    DataSet = qryEnd
    Left = 573
    Top = 429
  end
  object qryDoc: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DP.IDDOCUMENTO,'
      '  DP.IDPESSOA,'
      '  TP.NOMEDOCUMENTO,'
      '  DP.NUMDOCUMENTO,'
      '  DP.ORGAO,'
      '  DP.UF,'
      '  DP.DATAEMISSAO'
      'FROM'
      '  DOCPESSOA     DP,'
      '  TIPODOCPESSOA TP'
      'WHERE'
      '  (DP.IDDOCUMENTO = TP.IDDOCUMENTO(+)) AND'
      '  (DP.IDPESSOA = :IDPESSOA)'
      ' ')
    UpdateObject = updDoc
    PictureMasks.Strings = (
      'ORGAO'#9'&*!'#9'T'#9'T'
      'UF'#9'&*!'#9'T'#9'T')
    ValidateWithMask = True
    Left = 613
    Top = 397
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDocNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Nome do Documento'
      DisplayWidth = 30
      FieldName = 'NOMEDOCUMENTO'
      Size = 30
    end
    object qryDocNUMDOCUMENTO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDocORGAO: TStringField
      DisplayLabel = 'Orgão Emissor'
      DisplayWidth = 30
      FieldName = 'ORGAO'
      Size = 30
    end
    object qryDocUF: TStringField
      DisplayWidth = 3
      FieldName = 'UF'
      FixedChar = True
      Size = 3
    end
    object qryDocDATAEMISSAO: TDateTimeField
      DisplayLabel = 'Data de Emissão'
      DisplayWidth = 18
      FieldName = 'DATAEMISSAO'
    end
    object qryDocIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object qryDocIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object dsDoc: TwwDataSource
    DataSet = qryDoc
    Left = 613
    Top = 429
  end
  object qryPessoal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PF.IDPESSOA, '
      '  PF.NOMEPAI,'
      '  PF.NOMEMAE,'
      '  PF.CODESTADO,'
      '  PF.IDPAIS,'
      '  PF.ESTCIVIL,'
      '  PF.SEXO,'
      '  PF.DATANASC'
      'FROM'
      '  PESSOAFISICA     PF'
      'WHERE'
      '  (PF.IDPESSOA         = :IDPESSOA)      '
      ' ')
    UpdateObject = updPessoal
    ValidateWithMask = True
    Left = 653
    Top = 397
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoalIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryPessoalNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object qryPessoalNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object qryPessoalCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryPessoalIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryPessoalESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      FixedChar = True
      Size = 1
    end
    object qryPessoalSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object qryPessoalDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
  end
  object dsPessoal: TwwDataSource
    DataSet = qryPessoal
    Left = 653
    Top = 429
  end
  object updPessoal: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  NOMEPAI = :NOMEPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  DATANASC = :DATANASC,'
      '  SEXO = :SEXO,'
      '  ESTCIVIL = :ESTCIVIL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (CODESTADO, IDPAIS, NOMEPAI, NOMEMAE, DATANASC, SEXO, ESTCIVIL' +
        ')'
      'values'
      
        '  (:CODESTADO, :IDPAIS, :NOMEPAI, :NOMEMAE, :DATANASC, :SEXO, :E' +
        'STCIVIL)')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 653
    Top = 357
  end
  object qryEstado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODESTADO, NOMEESTADO'
      'FROM ESTADO'
      'WHERE IDPAIS = 1')
    ValidateWithMask = True
    Left = 757
    Top = 389
  end
  object qryPais: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPAIS, NOMENACIONALIDADE, NOMEPAIS'
      'FROM PAIS'
      'WHERE NOMEPAIS IS NOT NULL')
    ValidateWithMask = True
    Left = 381
    Top = 445
    object qryPaisIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.PAIS.IDPAIS'
    end
    object qryPaisNOMENACIONALIDADE: TStringField
      FieldName = 'NOMENACIONALIDADE'
      Origin = 'BASEDADOS.PAIS.NOMENACIONALIDADE'
      Size = 30
    end
    object qryPaisNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Size = 30
    end
  end
  object updEnd: TUpdateSQL
    ModifySQL.Strings = (
      'update ENDPESS'
      'set'
      '  LOGRADOURO = :LOGRADOURO,'
      '  IDPAIS = :IDPAIS,'
      '  CODESTADO = :CODESTADO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  CEP = :CEP,'
      '  IDCIDADES = :IDCIDADES'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDENDERECO = :OLD_IDENDERECO')
    InsertSQL.Strings = (
      'insert into ENDPESS'
      '  (LOGRADOURO, IDPAIS, CODESTADO, NUMERO, COMPLEMENTO, BAIRRO, '
      'CIDADE, '
      '   CEP, IDCIDADES)'
      'values'
      
        '  (:LOGRADOURO, :IDPAIS, :CODESTADO, :NUMERO, :COMPLEMENTO, :BAI' +
        'RRO, '
      ':CIDADE, '
      '   :CEP, :IDCIDADES)')
    DeleteSQL.Strings = (
      'delete from ENDPESS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDENDERECO = :OLD_IDENDERECO')
    Left = 573
    Top = 357
  end
  object qryCidades: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CD.IDCIDADES, '
      '    CD.NOME, '
      '    CD.IDESTADO, '
      '    UF.NOMEESTADO,'
      '    UF.CODESTADO AS UF, '
      '    UF.IDPAIS,'
      '    PA.NOMEPAIS'
      'FROM '
      '    CIDADES  CD, '
      '    ESTADO   UF,'
      '    PAIS     PA'
      'WHERE '
      '    (CD.IDESTADO = UF.IDESTADO) AND'
      '    (UF.IDPAIS = PA.IDPAIS)'
      '')
    ValidateWithMask = True
    Left = 757
    Top = 341
    object qryCidadesIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
    end
    object qryCidadesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryCidadesIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.CIDADES.IDESTADO'
    end
    object qryCidadesNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'BASEDADOS.ESTADO.NOMEESTADO'
      Size = 30
    end
    object qryCidadesUF: TStringField
      FieldName = 'UF'
      Origin = 'BASEDADOS.ESTADO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryCidadesIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.ESTADO.IDPAIS'
    end
    object qryCidadesNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Size = 30
    end
  end
  object updDoc: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCPESSOA'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  ORGAO = :ORGAO,'
      '  UF = :UF,'
      '  DATAEMISSAO = :DATAEMISSAO'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DOCPESSOA'
      '  (NUMDOCUMENTO, ORGAO, UF, DATAEMISSAO)'
      'values'
      '  (:NUMDOCUMENTO, :ORGAO, :UF, :DATAEMISSAO)')
    DeleteSQL.Strings = (
      'delete from DOCPESSOA'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 613
    Top = 357
  end
  object dsDados: TwwDataSource
    DataSet = qryDados
    Left = 533
    Top = 429
  end
  object updDados: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE BENEFBFCIARIO'
      'SET'
      '  BANCOINSS      = :BANCOINSS,'
      '  NUMPROCINSS    = :NUMPROCINSS,'
      '  MESRECIBOINSS  = :MESRECIBOINSS,'
      '  ANORECIBOINSS  = :ANORECIBOINSS,'
      '  DATARECEBRECAD = :DATARECEBRECAD,'
      '  FLGSTATUS      = :FLGSTATUS'
      'WHERE'
      '  IDPLANOPREV    = :OLD_IDPLANOPREV    AND'
      '  IDBENEFICIO    = :OLD_IDBENEFICIO    AND'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO AND'
      '  IDPESSJUR      = :OLD_IDPESSJUR      AND'
      '  IDTITULAR      = :OLD_IDTITULAR      AND'
      '  IDPLANOORIGEM  = :OLD_IDPLANOORIGEM  AND'
      '  IDPESSOA       = :OLD_IDPESSOA       AND'
      '  SEQPROPOSTA    = :OLD_SEQPROPOSTA    AND'
      '  FLGSTATUS      = '#39'P'#39
      ''
      ' ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (BANCOINSS, NUMPROCINSS, MESRECIBOINSS, ANORECIBOINSS, '
      'DATARECEBRECAD, '
      '   FLGSTATUS)'
      'values'
      '  (:BANCOINSS, :NUMPROCINSS, :MESRECIBOINSS, :ANORECIBOINSS, '
      ':DATARECEBRECAD, '
      '   :FLGSTATUS)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  PLANO = :OLD_PLANO')
    Left = 533
    Top = 357
  end
  object qryElg: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 637
    Top = 117
    object FloatField1: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object FloatField2: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.CIDADES.IDESTADO'
    end
    object StringField2: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'BASEDADOS.ESTADO.NOMEESTADO'
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'UF'
      Origin = 'BASEDADOS.ESTADO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object FloatField3: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.ESTADO.IDPAIS'
    end
    object StringField4: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Size = 30
    end
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 685
    Top = 117
    object FloatField4: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
    end
    object StringField5: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object FloatField5: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.CIDADES.IDESTADO'
    end
    object StringField6: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'BASEDADOS.ESTADO.NOMEESTADO'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'UF'
      Origin = 'BASEDADOS.ESTADO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object FloatField6: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.ESTADO.IDPAIS'
    end
    object StringField8: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Size = 30
    end
  end
  object dsBciario: TDataSource
    Left = 709
    Top = 429
  end
  object qryBciario: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' BB.IDPESSJUR,'
      ' BB.IDPLANOPREV,'
      ' BB.IDTITULAR,'
      ' BB.IDSITBENEFICIO,'
      ' BB.SEQPROPOSTA,'
      ' BB.IDPESSOA,'
      ' BB.IDBENEFICIO,'
      ' BB.NUMEROPROCESSO,'
      ' BP.IDREGRABENEFICIA,'
      ' BF.VALORBASE1,'
      ' BF.VALORBASE2,'
      ' BF.VALORBASE3,'
      ' BB.DATAINICIOFUND,'
      ' BB.DATAINICIO,'
      ' BB.DATAFINAL,'
      ' BB.DATAFINALPREVISTA,'
      ' EL.DATADEMISSAO,'
      ' BB.FLGTIPOINSS,'
      ' BB.VALORATUAL,'
      ' BB.VALORTOTAL,'
      ' BB.VALORCOTAS,'
      ' BB.FLGDATAPREVISTA'
      'FROM'
      ' ELEGPATRO       EL,'
      ' BENEFBFCIARIO   BB,'
      ' BENEFPLANPREV   BP,'
      ' BENEFPLANOPART  BF'
      'WHERE (BB.IDPESSJUR      = :IDPESSJUR     )'
      '  AND (BB.IDPLANOPREV    = :IDPLANOPREV   )'
      '  AND (BB.IDTITULAR      = :IDTITULAR     )'
      '  AND (BB.SEQPROPOSTA    = :SEQPROPOSTA   )'
      '  AND (BB.IDSITBENEFICIO IN (1,2)         )'
      '  AND (BB.FLGSTATUS      = '#39'P'#39'            )'
      '  AND (EL.IDPESSOA       = BB.IDTITULAR   )'
      '  AND (BP.IDPLANOPREV    = BB.IDPLANOPREV )'
      '  AND (BP.IDBENEFICIO    = BB.IDBENEFICIO )'
      '  AND (BF.IDPESSJUR      = BB.IDPESSJUR   )'
      '  AND (BF.SEQPROPOSTA    = BB.SEQPROPOSTA )'
      '  AND (BF.IDPLANOPREV    = BB.IDPLANOPREV )'
      '  AND (BF.IDPESSOA       = BB.IDTITULAR   )'
      '  AND (BF.IDBENEFICIO    = BB.IDBENEFICIO )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 709
    Top = 397
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryBciarioIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSJUR'
    end
    object qryBciarioIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOPREV'
    end
    object qryBciarioIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDTITULAR'
    end
    object qryBciarioIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDSITBENEFICIO'
    end
    object qryBciarioSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.SEQPROPOSTA'
    end
    object qryBciarioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSOA'
    end
    object qryBciarioIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDBENEFICIO'
    end
    object qryBciarioNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.NUMEROPROCESSO'
    end
    object qryBciarioIDREGRABENEFICIA: TFloatField
      FieldName = 'IDREGRABENEFICIA'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRABENEFICIA'
    end
    object qryBciarioVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
      Origin = 'BASEDADOS.BENEFPLANOPART.VALORBASE1'
    end
    object qryBciarioVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
      Origin = 'BASEDADOS.BENEFPLANOPART.VALORBASE2'
    end
    object qryBciarioVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
      Origin = 'BASEDADOS.BENEFPLANOPART.VALORBASE3'
    end
    object qryBciarioDATAINICIOFUND: TDateTimeField
      FieldName = 'DATAINICIOFUND'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAINICIOFUND'
    end
    object qryBciarioDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAINICIO'
    end
    object qryBciarioDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAFINAL'
    end
    object qryBciarioDATAFINALPREVISTA: TDateTimeField
      FieldName = 'DATAFINALPREVISTA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAFINALPREVISTA'
    end
    object qryBciarioDATADEMISSAO: TDateTimeField
      FieldName = 'DATADEMISSAO'
      Origin = 'BASEDADOS.ELEGPATRO.DATADEMISSAO'
    end
    object qryBciarioFLGTIPOINSS: TFloatField
      FieldName = 'FLGTIPOINSS'
      Origin = 'BASEDADOS.BENEFBFCIARIO.FLGTIPOINSS'
    end
    object qryBciarioVALORATUAL: TFloatField
      FieldName = 'VALORATUAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORATUAL'
    end
    object qryBciarioVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORTOTAL'
    end
    object qryBciarioVALORCOTAS: TFloatField
      FieldName = 'VALORCOTAS'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORCOTAS'
    end
    object qryBciarioFLGDATAPREVISTA: TFloatField
      FieldName = 'FLGDATAPREVISTA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.FLGDATAPREVISTA'
    end
  end
  object updBciario: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  DATAFINALPREVISTA = :DATAFINALPREVISTA'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO'
      '  FLGSTATUS = '#39'P'#39' ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (IDSITBENEFICIO, DATAFINALPREVISTA)'
      'values'
      '  (:IDSITBENEFICIO, :DATAFINALPREVISTA)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 709
    Top = 357
  end
  object QryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 605
    Top = 181
  end
end
