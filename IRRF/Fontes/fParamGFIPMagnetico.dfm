inherited frmParamGFIPMagnetico: TfrmParamGFIPMagnetico
  Left = 86
  Top = 93
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'GFIP (Meio Magnético)'
  ClientHeight = 402
  ClientWidth = 499
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 499
    Height = 363
    BorderWidth = 2
    object pnlHorario: TPanel
      Left = 5
      Top = 4
      Width = 490
      Height = 21
      BevelInner = bvLowered
      Caption = 'Tempo Decorrido'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pgctrlSel: TPageControl
      Left = 11
      Top = 31
      Width = 477
      Height = 104
      ActivePage = tbshEstab
      TabOrder = 1
      object tbshEstab: TTabSheet
        Caption = '&Estabelecimentos'
        object chklstEstab: TCheckListBox
          Left = 1
          Top = 1
          Width = 328
          Height = 73
          OnClickCheck = chklstEstabClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chklstEstabDrawItem
        end
      end
      object tbshCCusto: TTabSheet
        Caption = '&Centros de Custo'
        ImageIndex = 1
        object chklstCCusto: TCheckListBox
          Left = 1
          Top = 1
          Width = 328
          Height = 73
          OnClickCheck = chklstEstabClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chklstEstabDrawItem
        end
      end
    end
    object bbtnSelTodos: TBitBtn
      Left = 349
      Top = 57
      Width = 131
      Height = 25
      Caption = '   Seleciona Todos'
      TabOrder = 2
      TabStop = False
      OnClick = bbtnSelTodosClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333300000
        0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
        FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
        9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
        00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
        993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
        3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
        3333388888887733333333333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 0
    end
    object bbtnInverteSel: TBitBtn
      Left = 349
      Top = 84
      Width = 131
      Height = 25
      Caption = '   Inverte Seleção'
      TabOrder = 3
      TabStop = False
      OnClick = bbtnInverteSelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333000000003333333388888888333333330FFF
        FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
        FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
        FFF0333833338FFFFFF833333333000000003333333388888888000000003333
        333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
        00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
        033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
        3333888888877333333333333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 0
    end
    object gbxAnoMesRef: TGroupBox
      Left = 11
      Top = 138
      Width = 255
      Height = 65
      Caption = 'Mês e Ano de Referência'
      TabOrder = 4
      object cmbMes: TComboBox
        Left = 11
        Top = 26
        Width = 145
        Height = 21
        Style = csDropDownList
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
      object speAno: TSpinEdit
        Left = 165
        Top = 25
        Width = 79
        Height = 22
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1967
        TabOrder = 1
        Value = 1967
        OnChange = dtVencimentoChange
      end
    end
    object gbxDataProcess: TGroupBox
      Left = 269
      Top = 138
      Width = 219
      Height = 65
      Caption = 'Datas para Processamento'
      TabOrder = 5
      object Label1: TLabel
        Left = 16
        Top = 19
        Width = 56
        Height = 13
        Caption = 'Vencimento'
      end
      object Label2: TLabel
        Left = 19
        Top = 41
        Width = 54
        Height = 13
        Caption = 'Pagamento'
      end
      object dtVencimento: TCMDateTimePicker
        Left = 90
        Top = 15
        Width = 113
        Height = 21
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
        OnChange = dtVencimentoChange
      end
      object dtPagamento: TCMDateTimePicker
        Left = 90
        Top = 37
        Width = 113
        Height = 21
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
        ShowHint = False
        ShowButton = True
        TabOrder = 1
        OnChange = dtVencimentoChange
      end
    end
    object gbxResponsavel: TGroupBox
      Left = 11
      Top = 205
      Width = 255
      Height = 43
      Caption = 'Responsável pela informação'
      TabOrder = 6
      object dblkcbResponsavel: TwwDBLookupCombo
        Left = 9
        Top = 14
        Width = 237
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryResp
        LookupField = 'NOME'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dtVencimentoChange
      end
    end
    object rgGeraReg14: TRadioGroup
      Left = 269
      Top = 205
      Width = 219
      Height = 43
      Caption = 'Gera Registro de Alterações de Endereço?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 7
    end
    object gbxCodRec: TGroupBox
      Left = 11
      Top = 251
      Width = 132
      Height = 45
      Caption = 'Código de Recolhimento'
      TabOrder = 8
      object speCodRec: TSpinEdit
        Left = 26
        Top = 15
        Width = 79
        Height = 22
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Value = 115
        OnChange = dtVencimentoChange
        OnExit = speCodRecExit
      end
    end
    object gbxDiaLimiteGRFC: TGroupBox
      Left = 146
      Top = 251
      Width = 212
      Height = 45
      Caption = 'Dia Limite Próx. Mês Recolhido por GRFC'
      TabOrder = 9
      object spedDiaLimiteGRFC: TSpinEdit
        Left = 15
        Top = 15
        Width = 79
        Height = 22
        MaxLength = 4
        MaxValue = 31
        MinValue = 0
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Value = 0
        OnChange = dtVencimentoChange
      end
    end
    object gbxCodEmprCAIXA: TGroupBox
      Left = 361
      Top = 251
      Width = 127
      Height = 45
      Caption = 'Código Empresa CAIXA'
      TabOrder = 10
      object mkedCodEmpreCAIXA: TMaskEdit
        Left = 15
        Top = 16
        Width = 97
        Height = 21
        EditMask = '99999999999999;1;_'
        MaxLength = 14
        TabOrder = 0
        Text = '              '
      end
    end
    object rgSimples: TRadioGroup
      Left = 11
      Top = 298
      Width = 477
      Height = 54
      Caption = 'Simples'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Não Optante'
        'Optante - até valor limite'
        'Optante - acima valor limite'
        'Não Optante - Produtor Rural')
      TabOrder = 11
    end
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 499
    inherited tb97Fundo: TToolbar97
      Left = 194
      DockPos = 212
      inherited sep1: TToolbarSep97
        Left = 219
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 109
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 139
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 221
        TabOrder = 2
      end
      object rbtnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 109
        Height = 33
        Caption = '  &Gerar Arquivo'
        Default = True
        TabOrder = 0
        OnClick = rbtnGerarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 194
    Top = 70
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object svdlgDialogo: TOpenDialog
    DefaultExt = '*.RE'
    FileName = 'C:\SEFIP\SEFIP.RE'
    Filter = 'SEFIP.RE|SEFIP.RE|Todos|*.*'
    InitialDir = 'C:\SEFIP'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para a Geração do GFIP Magnético'
    Left = 266
    Top = 58
  end
  object qryGPS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DATAFIMGRPS, DATAVENCGRPS, IDFILIALPESSOA, MOECODIGO,'
      '  SEGACIDTRABALHO, CODIGOPAG, TOTAL'
      'FROM'
      '  GUIAGRPS'
      'WHERE'
      '  (TO_CHAR(DATAVENCGRPS,'#39'MM/YYYY'#39') = :DATA)'
      'ORDER BY'
      '  DATAFIMGRPS DESC')
    ValidateWithMask = True
    Left = 75
    Top = 59
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
  object qryResp: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PF.IDPESSOA, UPPER(PF.NOME) AS NOME'
      'FROM'
      '  PESSOA PF, FUNCIONARIO F, SITFUNC ST'
      'WHERE'
      '  (ST.TIPOSIT   = '#39'A'#39')         AND'
      '  (ST.IDSITFUNC = F.IDSITFUNC) AND'
      '  (F.IDPESSOA   = PF.IDPESSOA)'
      'ORDER BY'
      '  UPPER(PF.NOME)')
    ValidateWithMask = True
    Left = 225
    Top = 168
    object qryRespIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryRespNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJ.IDPESSOA,'
      '  RTRIM(PJ.NOME) AS NOME,'
      '  RTRIM(PJ.RAZAOSOCIAL) AS RAZAO,'
      '  DECODE(CGC_CNPJ.NUM,NULL,'#39'2'#39','#39'1'#39') AS TIPO_INSCRICAO,'
      '  DECODE(CGC_CNPJ.NUM,NULL,CEI.NUM,CGC_CNPJ.NUM) AS INSCRICAO,'
      
        '  DECODE(E.LOGRADOURO,NULL,NULL,RTRIM(E.LOGRADOURO) ||'#39', '#39'|| E.N' +
        'UMERO ||'
      
        '    DECODE(E.COMPLEMENTO,NULL,'#39' - '#39' || RTRIM(E.COMPLEMENTO))) AS' +
        ' ENDERECO,'
      '  RTRIM(E.BAIRRO)  AS BAIRRO,'
      '  RTRIM(E.CEP)     AS CEP,'
      '  RTRIM(CI.NOME)   AS CIDADE,'
      '  (ES.CODESTADO)   AS UF,'
      '  RTRIM(TELEFONE.DDD)    AS DDD,'
      '  RTRIM(TELEFONE.NUMERO) AS TELEFONE'
      'FROM'
      '  PESSOA PJ, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES,'
      ''
      '  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DO.NUMDOCUMENTO AS NUM'
      '   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO'
      '   WHERE (TDO.SIGLADOCUMENTO = '#39'CEI:'#39')         AND'
      '         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND'
      '         (FP.IDFILIALPESSOA  = DO.IDPESSOA)) CEI,'
      ''
      
        '  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, (DO.NUMDOCUMENTO) AS NU' +
        'M'
      '   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO'
      '   WHERE ((TDO.SIGLADOCUMENTO = '#39'CGC:'#39') OR'
      '          (TDO.SIGLADOCUMENTO = '#39'CNPJ:'#39')) AND'
      '         (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND'
      '         (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC_CNPJ,'
      ''
      '  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO'
      '   FROM'
      '     TELENDPESS TE,'
      '     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO'
      '      FROM     TELENDPESS'
      '      GROUP BY IDENDERECO) END'
      '   WHERE'
      '     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE'
      'WHERE'
      '  (PJ.IDPESSOA        = -1)              AND'
      '  (PJ.NUMDOCUMENTO   IS NOT NULL)        AND'
      '  (PJ.IDENDCOMERCIAL  = E.IDENDERECO)    AND'
      '  (PJ.IDPESSOA        = E.IDPESSOA)      AND'
      '  (E.IDCIDADES        = CI.IDCIDADES)    AND'
      '  (CI.IDESTADO        = ES.IDESTADO)     AND'
      '  (PJ.IDPESSOA        = CEI.IDPESSOA(+)) AND'
      '  (PJ.IDPESSOA        = CGC_CNPJ.IDPESSOA(+))   AND'
      '  (PJ.IDENDCOMERCIAL  = TELEFONE.IDENDERECO(+)) AND'
      '  (PJ.IDENDCOMERCIAL  = TE.IDENDERECO(+))')
    ValidateWithMask = True
    Left = 29
    Top = 72
  end
  object qryRespAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DECODE(CNPJ.NUM,NULL,'#39'2'#39','#39'1'#39') AS TIPO_INSCRICAO_EMPRESA,'
      '  DECODE(CNPJ.NUM,NULL,CEI.CEI,CNPJ.NUM) AS INSCRICAO_EMPRESA,'
      '  ('#39'3'#39') AS TIPO_INSCRICAO,'
      '  (PF.NUMDOCUMENTO) AS INSCRICAO,'
      '  PF.NOME,'
      '  UPPER(RTRIM(PJ.EMAIL)) AS EMAIL'
      'FROM'
      '  PESSOA PJ, PESSOA PF, FUNCIONARIO F,'
      ''
      '  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DO.NUMDOCUMENTO AS CEI'
      '   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO'
      '   WHERE (TDO.SIGLADOCUMENTO = '#39'CEI:'#39')         AND'
      '         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND'
      '         (FP.IDFILIALPESSOA  = DO.IDPESSOA)) CEI,'
      ''
      
        '  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, (DO.NUMDOCUMENTO) AS NU' +
        'M'
      '   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO'
      '   WHERE ((TDO.SIGLADOCUMENTO = '#39'CGC:'#39') OR'
      '          (TDO.SIGLADOCUMENTO = '#39'CNPJ:'#39')) AND'
      '         (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND'
      '         (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CNPJ'
      'WHERE'
      '  (PF.IDPESSOA = :IDPESSOA)       AND'
      '  (PF.IDPESSOA = F.IDPESSOA)      AND'
      '  (F.IDESTAB   = PJ.IDPESSOA)     AND'
      '  (PJ.IDPESSOA = CEI.IDPESSOA(+)) AND'
      '  (PJ.IDPESSOA = CNPJ.IDPESSOA(+))'
      ' ')
    ValidateWithMask = True
    Left = 137
    Top = 91
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAltCad: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODALTERACAO, ALTERACAO'
      'FROM'
      '  HSTALTCAD'
      'WHERE'
      '  (IDPESSOA          = :IDPESSOA) AND'
      '  (MES               = :MES)      AND'
      '  (CODALTERACAO IS NOT NULL)    ')
    ValidateWithMask = True
    Left = 134
    Top = 51
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end>
  end
end
