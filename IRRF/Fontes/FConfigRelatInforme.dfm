inherited FrmConfigRelatInforme: TFrmConfigRelatInforme
  Left = 173
  Top = 117
  HelpContext = 240026
  Caption = 'Configuração e Impressão do Informe de Rendimentos PF (Cédula C)'
  ClientHeight = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 284
    inherited PnlCadastro: TPanel [0]
      Height = 274
      inherited Label1: TLabel
        Top = 56
      end
      inherited DeRelatorio: TwwDBEdit
        Top = 73
        DataField = 'MODELOCARTA'
      end
      inherited BtnDesenho: TBitBtn
        Top = 58
      end
    end
    inherited PnlImprime: TPanel [1]
      Height = 274
      inherited Label2: TLabel
        Top = 8
      end
      inherited CmbModelo: TCMDBLookupCombo
        Top = 24
        Width = 296
      end
      object GroupBox1: TGroupBox
        Left = 18
        Top = 51
        Width = 217
        Height = 49
        TabOrder = 1
        object Label3: TLabel
          Left = 16
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Ano Base:'
        end
        object edtData: TEdit
          Left = 84
          Top = 21
          Width = 97
          Height = 21
          TabOrder = 0
          Text = '0'
        end
        object UpDown1: TUpDown
          Left = 181
          Top = 21
          Width = 15
          Height = 21
          Associate = edtData
          Min = 0
          Max = 3000
          Position = 0
          TabOrder = 1
          Thousands = False
          Wrap = False
        end
      end
      object grpbxResponsavel: TGroupBox
        Left = 18
        Top = 210
        Width = 505
        Height = 59
        TabOrder = 6
        object Label4: TLabel
          Left = 16
          Top = 16
          Width = 235
          Height = 13
          Caption = 'Nome do Responsável pelas Informações'
        end
        object Label5: TLabel
          Left = 373
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Data'
        end
        object edtNome: TEdit
          Left = 16
          Top = 32
          Width = 333
          Height = 21
          TabOrder = 0
        end
        object dtdtData: TCMDateTimePicker
          Left = 373
          Top = 32
          Width = 121
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
          ShowButton = True
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 255
        Top = 102
        Width = 265
        Height = 49
        TabOrder = 4
        object Label6: TLabel
          Left = 10
          Top = 27
          Width = 93
          Height = 13
          Caption = 'CPF Específico:'
        end
        object meCPF: TMaskEdit
          Left = 105
          Top = 21
          Width = 157
          Height = 21
          EditMask = '!999.999.999-99;0; '
          MaxLength = 14
          TabOrder = 0
        end
      end
      object rgSistema: TRadioGroup
        Left = 328
        Top = 4
        Width = 192
        Height = 93
        Caption = ' Folha '
        ItemIndex = 0
        Items.Strings = (
          'de &Pagamento'
          'de &Benefícios'
          '&Todas'
          'de &Reserva')
        TabOrder = 2
      end
      object prgBarAtuFluxo: TProgressBar
        Left = 0
        Top = 252
        Width = 545
        Height = 22
        Align = alBottom
        Min = 0
        Max = 100
        Step = 2
        TabOrder = 7
        Visible = False
      end
      object gbMatricula: TGroupBox
        Left = 18
        Top = 102
        Width = 217
        Height = 46
        Caption = 'Matrícula'
        TabOrder = 3
        object edMatricula: TEdit
          Left = 16
          Top = 16
          Width = 180
          Height = 21
          MaxLength = 13
          TabOrder = 0
        end
      end
      object rgInforme: TRadioGroup
        Left = 18
        Top = 156
        Width = 215
        Height = 53
        Hint = 'Indica para quem sera gerado o Informe de Rendimento'
        Caption = 'Informe para'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '&REFER'
          '&FUNCEF')
        TabOrder = 5
      end
    end
  end
  inherited Dock971: TDock97
    Top = 331
    inherited tb97Fundo: TToolbar97
      Left = 208
      DockPos = 208
      inherited sep1: TToolbarSep97
        Left = 259
      end
      inherited sep3: TToolbarSep97
        Left = 176
      end
      inherited bbtnSair: TBitBtn
        Left = 179
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 262
        HelpContext = 240026
      end
      object bbtnGeraTxt: TBitBtn
        Left = 80
        Top = 0
        Width = 96
        Height = 33
        Cancel = True
        Caption = '&Gerar TXT'
        TabOrder = 2
        OnClick = bbtnGeraTxtClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
          0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
          0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
          0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
          0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
          0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
          5555557FFFFF7755555555500000005555555577777775555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      inherited bbtnCancelar: TBitBtn
        Left = 80
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (IDCARTACOBRANCA = :IDCARTACOBRANCA) AND'
      '  (FLGTIPOCARTA = '#39'F'#39')'
      ''
      ''
      '')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CARTACOBRANCA.MODELOCARTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTACOBRANCA')
    CamposChave.Strings = (
      'CARTACOBRANCA.IDCARTACOBRANCA')
    Filtro.Strings = (
      'CARTACOBRANCA.FLGTIPOCARTA = '#39'F'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 388
    Top = 91
  end
  inherited DsgnCM: TppDesigner
    Left = 235
    Top = 98
  end
  inherited MergeMenu: TMainMenu
    Left = 278
    Top = 42
  end
  inherited qryReports: TwwQuery
    Left = 19
    Top = 42
  end
  inherited PpDados: TppBDEPipeline
    Left = 205
    Top = 42
    object PpDadosppField1: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 0
    end
    object PpDadosppField2: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object PpDadosppField3: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object PpDadosppField4: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 18
      DisplayWidth = 18
      Position = 3
    end
    object PpDadosppField5: TppField
      FieldAlias = 'FONTE'
      FieldName = 'FONTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object PpDadosppField6: TppField
      FieldAlias = 'CODNATUREZA'
      FieldName = 'CODNATUREZA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 5
    end
    object PpDadosppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object PpDadosppField8: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 92
      DisplayWidth = 92
      Position = 7
    end
    object PpDadosppField9: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object PpDadosppField10: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object PpDadosppField11: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object PpDadosppField12: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object PpDadosppField13: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 12
    end
    object PpDadosppField14: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 13
    end
    object PpDadosppField15: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object PpDadosppField16: TppField
      FieldAlias = 'TIPO_1'
      FieldName = 'TIPO_1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object PpDadosppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR401'
      FieldName = 'VLR401'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object PpDadosppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR402'
      FieldName = 'VLR402'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object PpDadosppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR404'
      FieldName = 'VLR404'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
  end
  inherited DsDados: TwwDataSource
    Left = 105
    Top = 42
  end
  inherited QryDados: TwwQuery
    Active = True
    SQL.Strings = (
      
        'SELECT   P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF,  P.NUMDOCUMENTO AS' +
        ' CPF,'
      '         E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE,'
      '         NAT.CODNATUREZA,  NAT.DESCRICAO,'
      
        '         EN.LOGRADOURO||'#39', '#39'||EN.NUMERO||'#39', '#39'||EN.COMPLEMENTO AS' +
        ' ENDERECO,'
      
        '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CE' +
        'P,'
      '         ES.CODESTADO AS UF,'
      '         ('#39'-'#39') AS TELEFONE, ('#39'C'#39') AS  TIPO,'
      '         SUM(DECODE(XB.CODINFORME, 401, VLR, 0 )) AS VLR401,'
      '         SUM(DECODE(XB.CODINFORME, 402, VLR, 0 )) AS VLR402,'
      '         SUM(DECODE(XB.CODINFORME, 404, VLR, 0 )) AS VLR404'
      'FROM  PESSOA P,PESSOA E, ENDPESS EN, CIDADES C, ESTADO ES,'
      '      NATURENDIMENTO NAT ,'
      
        '      ( SELECT U.IDBENEFIRRF, U.CODNATUREZA, U.IDPESSOA, U.CODIN' +
        'FORME,'
      '               SUM(U.VLR) AS VLR'
      '        FROM'
      
        '       ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA, I.CODI' +
        'NFORME,'
      
        '                SUM(DECODE(I.CODDIRF,'#39'6'#39',(LI.VLRLANC*-1),DECODE(' +
        'I.CODDIRF,'#39'7'#39',(LI.VLRLANC*-1),LI.VLRLANC))) AS VLR'
      '        FROM INFORME I, LANCXINFORME LI, LANCIRRF L'
      '        WHERE (I.IDINFORME = LI.IDINFORME) AND'
      '              (LI.IDLANCIRRF = L.IDLANCIRRF) AND'
      
        '              (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,'#39'DD/MM' +
        '/YYYY'#39') AND TO_DATE(:sDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '              (L.NUMDOCUMENTO = :sNumDocumento)'
      
        '        GROUP BY L.IDPESSOA,L.IDBENEFIRRF, L.CODNATUREZA, I.CODI' +
        'NFORME)'
      '   UNION ALL'
      
        '      (SELECT  UL.IDBENEFIRRF, UL.CODNATUREZA, UL.IDPESSOA, UL.C' +
        'ODINFORME,'
      '               SUM(UL.VLR) AS VLR'
      '       FROM'
      
        '          ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA, I.C' +
        'ODINFORME,'
      '                  SUM(L.VLRBASE) AS VLR,'
      '                  MIN(I.IDINFORME)'
      '              FROM INFORME I, LANCIRRF L'
      '              WHERE (I.FLGBASE = '#39'S'#39') AND'
      
        '                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXI' +
        'NFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND'
      
        '                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,' +
        #39'DD/MM/YYYY'#39') AND TO_DATE(:sDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '                    (L.NUMDOCUMENTO = :sNumDocumento)'
      
        '              GROUP BY I.CODINFORME, L.IDBENEFIRRF, L.CODNATUREZ' +
        'A, L.IDPESSOA)'
      '           UNION ALL'
      
        '          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA, I.CO' +
        'DINFORME,'
      '                  SUM(L.VLRIRRF) AS VLR,'
      '                  MIN(I.IDINFORME)'
      '              FROM INFORME I, LANCIRRF L'
      '              WHERE (I.FLGIRRF = '#39'S'#39') AND'
      
        '                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXI' +
        'NFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND'
      
        '                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,' +
        #39'DD/MM/YYYY'#39') AND TO_DATE(:sDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '                    (L.NUMDOCUMENTO = :sNumDocumento)'
      
        '              GROUP BY I.CODINFORME, L.IDBENEFIRRF, L.CODNATUREZ' +
        'A, L.IDPESSOA)'
      '           UNION ALL'
      
        '          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA, I.CO' +
        'DINFORME,'
      '                  SUM(L.VLRIRRF) AS VLR,'
      '                  MIN(I.IDINFORME)'
      '              FROM INFORME I, LANCIRRF L'
      '              WHERE (I.CODDIRF = 4) AND'
      
        '                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXI' +
        'NFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND'
      
        '                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,' +
        #39'DD/MM/YYYY'#39') AND TO_DATE(:sDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '                    (L.NUMDOCUMENTO = :sNumDocumento)'
      
        '              GROUP BY I.CODINFORME, L.IDBENEFIRRF, L.CODNATUREZ' +
        'A, L.IDPESSOA)) UL'
      '        GROUP BY UL.IDPESSOA,UL.IDBENEFIRRF, UL.CODNATUREZA,'
      '                 UL.CODINFORME)) U'
      
        '        GROUP BY U.IDPESSOA,U.IDBENEFIRRF, U.CODNATUREZA, U.CODI' +
        'NFORME) XB'
      'WHERE  (P.TIPO = '#39'F'#39') AND'
      '       (P.IDPESSOA = XB.IDBENEFIRRF) AND'
      '       (XB.IDPESSOA = E.IDPESSOA) AND'
      '       (NAT.CODNATUREZA   = XB.CODNATUREZA) AND'
      '       (EN.IDENDERECO(+) = E.IDENDCOMERCIAL) AND'
      '       (EN.IDCIDADES     = C.IDCIDADES(+)) AND'
      '       (ES.IDESTADO(+)    = C.IDESTADO) AND'
      '       (EN.IDPESSOA(+)   = E.IDPESSOA)'
      'GROUP BY P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO,'
      '         E.NUMDOCUMENTO,  E.RAZAOSOCIAL,'
      '         NAT.CODNATUREZA,  NAT.DESCRICAO,'
      '         EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO,'
      
        '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CE' +
        'P,'
      '         ES.CODESTADO'
      'ORDER BY  P.RAZAOSOCIAL, NAT.CODNATUREZA'
      ' '
      ' '
      ' ')
    Left = 158
    Top = 50
    ParamData = <
      item
        DataType = ftString
        Name = 'sDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sNumDocumento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sNumDocumento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sNumDocumento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sNumDocumento'
        ParamType = ptUnknown
      end>
  end
  inherited RptModelo: TppReport
    BeforePrint = RptModeloBeforePrint
    Left = 216
    Top = 178
    inherited ppDetailBand2: TppDetailBand
      mmHeight = 205052
      object RptModeloShape1: TppShape
        UserName = 'RptModeloShape1'
        mmHeight = 12700
        mmLeft = 10054
        mmTop = 5292
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLabel3: TppLabel
        UserName = 'RptModeloLabel3'
        AutoSize = False
        Caption = 'COMPROVANTE DE RENDIMENTOS PAGOS E DE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 5556
        mmWidth = 88371
        BandType = 4
      end
      object RptModeloLine1: TppLine
        UserName = 'RptModeloLine1'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12435
        mmLeft = 85196
        mmTop = 5292
        mmWidth = 13229
        BandType = 4
      end
      object RptModeloLabel1: TppLabel
        UserName = 'RptModeloLabel1'
        AutoSize = False
        Caption = 'MINISTÉRIO DA FAZENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 7144
        mmWidth = 88371
        BandType = 4
      end
      object RptModeloLabel2: TppLabel
        UserName = 'RptModeloLabel2'
        AutoSize = False
        Caption = 'SECRETARIA DA RECEITA FEDERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 11642
        mmWidth = 88371
        BandType = 4
      end
      object RptModeloLabel4: TppLabel
        UserName = 'RptModeloLabel4'
        AutoSize = False
        Caption = 'RETENÇÃO DE IMPOSTO DE RENDA NA FONTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 9525
        mmWidth = 88371
        BandType = 4
      end
      object RptModeloLabel5: TppLabel
        UserName = 'RptModeloLabel5'
        AutoSize = False
        Caption = 'Ano-Calendário     '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 13494
        mmWidth = 88371
        BandType = 4
      end
      object RptModeloShape2: TppShape
        UserName = 'RptModeloShape2'
        mmHeight = 8996
        mmLeft = 10054
        mmTop = 24606
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLabel6: TppLabel
        UserName = 'RptModeloLabel6'
        Caption = '1. FONTE PAGADORA PESSOA JURÍDICA OU PESSOA FÍSICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10054
        mmTop = 20373
        mmWidth = 82021
        BandType = 4
      end
      object RptModeloLabel7: TppLabel
        UserName = 'RptModeloLabel7'
        Caption = 'NOME EMPRESARIAL/NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 25135
        mmWidth = 35719
        BandType = 4
      end
      object RptModeloLabel8: TppLabel
        UserName = 'RptModeloLabel8'
        Caption = 'CNPJ/CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 133879
        mmTop = 25135
        mmWidth = 12435
        BandType = 4
      end
      object RptModeloLine2: TppLine
        UserName = 'RptModeloLine2'
        Position = lpRight
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 119327
        mmTop = 24606
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape3: TppShape
        UserName = 'RptModeloShape3'
        mmHeight = 8996
        mmLeft = 10054
        mmTop = 40481
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloShape4: TppShape
        UserName = 'RptModeloShape4'
        mmHeight = 9260
        mmLeft = 10054
        mmTop = 49213
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLabel9: TppLabel
        UserName = 'RptModeloLabel9'
        Caption = '2. PESSOA FÍSICA BENEFICIÁRIA DOS RENDIMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10054
        mmTop = 36513
        mmWidth = 71702
        BandType = 4
      end
      object RptModeloLine3: TppLine
        UserName = 'RptModeloLine3'
        Position = lpRight
        Weight = 0.75
        mmHeight = 8731
        mmLeft = 42598
        mmTop = 40481
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloLabel10: TppLabel
        UserName = 'RptModeloLabel10'
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 41010
        mmWidth = 5027
        BandType = 4
      end
      object RptModeloLabel11: TppLabel
        UserName = 'RptModeloLabel11'
        Caption = 'NOME COMPLETO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 41010
        mmWidth = 23019
        BandType = 4
      end
      object RptModeloLabel12: TppLabel
        UserName = 'RptModeloLabel12'
        Caption = 'NATUREZA DO RENDIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 50006
        mmWidth = 37306
        BandType = 4
      end
      object RptModeloLabel13: TppLabel
        UserName = 'RptModeloLabel13'
        Caption = '3. RENDIMENTOS TRIBUTÁVEIS, DEDUÇÕES E IMPOSTO NA FONTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10054
        mmTop = 61648
        mmWidth = 89694
        BandType = 4
      end
      object RptModeloLabel14: TppLabel
        UserName = 'RptModeloLabel14'
        Caption = 'VALORES EM REAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 159015
        mmTop = 61648
        mmWidth = 27517
        BandType = 4
      end
      object RptModeloShape5: TppShape
        UserName = 'RptModeloShape5'
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 65617
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine4: TppLine
        UserName = 'RptModeloLine4'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 138377
        mmTop = 65617
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape6: TppShape
        UserName = 'RptModeloShape6'
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 70115
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine5: TppLine
        UserName = 'RptModeloLine5'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 138377
        mmTop = 70115
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape7: TppShape
        UserName = 'RptModeloShape7'
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 74613
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine6: TppLine
        UserName = 'RptModeloLine6'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 138377
        mmTop = 74613
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape8: TppShape
        UserName = 'RptModeloShape8'
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 79111
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine7: TppLine
        UserName = 'RptModeloLine7'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 138377
        mmTop = 79111
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape9: TppShape
        UserName = 'RptModeloShape9'
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 83609
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine8: TppLine
        UserName = 'RptModeloLine8'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 138377
        mmTop = 83609
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloLabel15: TppLabel
        UserName = 'RptModeloLabel15'
        Caption = '01. Total dos Rendimentos (inclusive férias)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 66146
        mmWidth = 55827
        BandType = 4
      end
      object RptModeloLabel16: TppLabel
        UserName = 'RptModeloLabel16'
        Caption = '02. Contribuição Previdência Oficial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 70644
        mmWidth = 44979
        BandType = 4
      end
      object RptModeloLabel17: TppLabel
        UserName = 'RptModeloLabel17'
        Caption = 
          '03. Contribuição à Previdência Privada e ao Fundo de Aposentador' +
          'ia Programa Individual (FAPI)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 75142
        mmWidth = 121709
        BandType = 4
      end
      object RptModeloLabel18: TppLabel
        UserName = 'RptModeloLabel18'
        Caption = '04. Pensão Alimentícia (informar o beneficiário no Quadro 6)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 79640
        mmWidth = 76994
        BandType = 4
      end
      object RptModeloLabel19: TppLabel
        UserName = 'RptModeloLabel19'
        Caption = '05. Imposto de Renda Retido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 84138
        mmWidth = 36248
        BandType = 4
      end
      object RptModeloLabel20: TppLabel
        UserName = 'RptModeloLabel20'
        Caption = '4. RENDIMENTOS ISENTOS E NÃO TRIBUTÁVEIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 92075
        mmWidth = 64294
        BandType = 4
      end
      object RptModeloLabel21: TppLabel
        UserName = 'RptModeloLabel21'
        Caption = 'VALORES EM REAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 92075
        mmWidth = 27517
        BandType = 4
      end
      object RptModeloShape10: TppShape
        UserName = 'RptModeloShape10'
        mmHeight = 4763
        mmLeft = 9525
        mmTop = 96044
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine9: TppLine
        UserName = 'RptModeloLine9'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137848
        mmTop = 96044
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape11: TppShape
        UserName = 'RptModeloShape11'
        mmHeight = 4763
        mmLeft = 9525
        mmTop = 100542
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine10: TppLine
        UserName = 'RptModeloLine10'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137848
        mmTop = 100542
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape12: TppShape
        UserName = 'RptModeloShape12'
        mmHeight = 8467
        mmLeft = 9525
        mmTop = 105040
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine11: TppLine
        UserName = 'RptModeloLine11'
        Position = lpRight
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 137848
        mmTop = 105040
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape13: TppShape
        UserName = 'RptModeloShape13'
        mmHeight = 4763
        mmLeft = 9525
        mmTop = 113242
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine12: TppLine
        UserName = 'RptModeloLine12'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137848
        mmTop = 113242
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape14: TppShape
        UserName = 'RptModeloShape14'
        mmHeight = 8467
        mmLeft = 9525
        mmTop = 117740
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine13: TppLine
        UserName = 'RptModeloLine13'
        Position = lpRight
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 137848
        mmTop = 117740
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloLabel22: TppLabel
        UserName = 'RptModeloLabel22'
        Caption = 
          '01. Parcela Isenta dos Proventos de Aposentadoria, Reservas Refo' +
          'rma e Pensão (65 anos ou mais)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 96573
        mmWidth = 127794
        BandType = 4
      end
      object RptModeloLabel23: TppLabel
        UserName = 'RptModeloLabel23'
        Caption = '02. Diárias e Ajudas de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 101071
        mmWidth = 37835
        BandType = 4
      end
      object RptModeloLabel24: TppLabel
        UserName = 'RptModeloLabel24'
        Caption = 
          '03. Pensão, Proventos de Aposentadoria ou Reforma por Moléstia G' +
          'rave  e Aposentadoria ou Reforma por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 105569
        mmWidth = 136261
        BandType = 4
      end
      object RptModeloLabel25: TppLabel
        UserName = 'RptModeloLabel25'
        Caption = 
          '04. Lucro e Dividendo Apurado a partir de 1996 pago por PJ (Lucr' +
          'o Real, Presumido ou Arbitrado)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 113771
        mmWidth = 124619
        BandType = 4
      end
      object RptModeloLabel26: TppLabel
        UserName = 'RptModeloLabel26'
        Caption = 
          '05. Valores Pagos ao Titular ou Sócio da Microempresa ou Empresa' +
          ' de Pequeno Porte, exceto Pró-Labore, '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 118269
        mmWidth = 136790
        BandType = 4
      end
      object RptModeloShape15: TppShape
        UserName = 'RptModeloShape15'
        mmHeight = 4763
        mmLeft = 9525
        mmTop = 125942
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine14: TppLine
        UserName = 'RptModeloLine14'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137848
        mmTop = 125942
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape16: TppShape
        UserName = 'RptModeloShape16'
        mmHeight = 4763
        mmLeft = 9525
        mmTop = 130175
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine15: TppLine
        UserName = 'RptModeloLine15'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137848
        mmTop = 130175
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloLabel27: TppLabel
        UserName = 'RptModeloLabel27'
        Caption = 
          '06. Indenizações por rescisão de contrato de trabalho, inclusive' +
          ' a título de PDV, e acidente de trabalho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 126207
        mmWidth = 130969
        BandType = 4
      end
      object RptModeloLabel28: TppLabel
        UserName = 'RptModeloLabel28'
        Caption = '07. Outros (especificar)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 130704
        mmWidth = 30692
        BandType = 4
      end
      object RptModeloLabel29: TppLabel
        UserName = 'RptModeloLabel29'
        Caption = 'Acidente em Serviço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 109273
        mmWidth = 26458
        BandType = 4
      end
      object RptModeloLabel30: TppLabel
        UserName = 'RptModeloLabel30'
        Caption = 'Aluguéis ou Serviços Prestados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 121973
        mmWidth = 41010
        BandType = 4
      end
      object RptModeloLabel31: TppLabel
        UserName = 'RptModeloLabel31'
        Caption = 
          '5. RENDIMENTOS SUJEITOS À TRIBUTAÇÃO EXCLUSIVA (RENDIMENTO LÍQUI' +
          'DO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 136790
        mmWidth = 109538
        BandType = 4
      end
      object RptModeloLabel32: TppLabel
        UserName = 'RptModeloLabel32'
        Caption = 'VALORES EM REAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 136790
        mmWidth = 27517
        BandType = 4
      end
      object RptModeloShape17: TppShape
        UserName = 'RptModeloShape17'
        mmHeight = 4763
        mmLeft = 9525
        mmTop = 140759
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine16: TppLine
        UserName = 'RptModeloLine16'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137848
        mmTop = 140759
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloShape18: TppShape
        UserName = 'RptModeloShape18'
        mmHeight = 4763
        mmLeft = 9525
        mmTop = 145257
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine17: TppLine
        UserName = 'RptModeloLine17'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137848
        mmTop = 145257
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloLabel33: TppLabel
        UserName = 'RptModeloLabel33'
        Caption = '01. Décimo Terceiro Salário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 141288
        mmWidth = 34925
        BandType = 4
      end
      object RptModeloLabel34: TppLabel
        UserName = 'RptModeloLabel34'
        Caption = '02. Outros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 145786
        mmWidth = 13494
        BandType = 4
      end
      object RptModeloShape19: TppShape
        UserName = 'RptModeloShape19'
        mmHeight = 24342
        mmLeft = 9525
        mmTop = 155575
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLabel35: TppLabel
        UserName = 'RptModeloLabel35'
        Caption = '6. INFORMAÇÕES COMPLEMENTARES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 151607
        mmWidth = 52123
        BandType = 4
      end
      object RptModeloLabel36: TppLabel
        UserName = 'RptModeloLabel36'
        Caption = '7. RESPONSÁVEL PELAS INFORMAÇÕES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 182563
        mmWidth = 55298
        BandType = 4
      end
      object RptModeloShape20: TppShape
        UserName = 'RptModeloShape20'
        mmHeight = 8467
        mmLeft = 9525
        mmTop = 186532
        mmWidth = 176477
        BandType = 4
      end
      object RptModeloLine18: TppLine
        UserName = 'RptModeloLine18'
        Position = lpRight
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 125148
        mmTop = 186532
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloLabel37: TppLabel
        UserName = 'RptModeloLabel37'
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 187061
        mmWidth = 7673
        BandType = 4
      end
      object RptModeloLine19: TppLine
        UserName = 'RptModeloLine19'
        Position = lpRight
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 84402
        mmTop = 186532
        mmWidth = 14023
        BandType = 4
      end
      object RptModeloLabel38: TppLabel
        UserName = 'RptModeloLabel38'
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 187061
        mmWidth = 7673
        BandType = 4
      end
      object RptModeloLabel39: TppLabel
        UserName = 'RptModeloLabel39'
        Caption = 'ASSINATURA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 187061
        mmWidth = 17727
        BandType = 4
      end
      object RptModeloLabel40: TppLabel
        UserName = 'RptModeloLabel40'
        AutoSize = False
        Caption = 'RptModeloLabel40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 189442
        mmWidth = 75142
        BandType = 4
      end
      object RptModeloLabel41: TppLabel
        UserName = 'RptModeloLabel41'
        AutoSize = False
        Caption = 'RptModeloLabel41'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108479
        mmTop = 189442
        mmWidth = 27252
        BandType = 4
      end
      object RptModeloDBText1: TppDBText
        UserName = 'RptModeloDBText1'
        DataField = 'FONTE'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 15081
        mmTop = 29104
        mmWidth = 116417
        BandType = 4
      end
      object RptModeloDBText2: TppDBText
        UserName = 'RptModeloDBText2'
        DataField = 'CGC'
        DataPipeline = PpDados
        DisplayFormat = '!99.999.999/9999-99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 136790
        mmTop = 29104
        mmWidth = 46567
        BandType = 4
      end
      object RptModeloDBText3: TppDBText
        UserName = 'RptModeloDBText3'
        DataField = 'CODNATUREZA'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 53975
        mmWidth = 12965
        BandType = 4
      end
      object RptModeloDBText4: TppDBText
        UserName = 'RptModeloDBText4'
        DataField = 'DESCRICAO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30163
        mmTop = 53975
        mmWidth = 139171
        BandType = 4
      end
      object RptModeloDBText5: TppDBText
        UserName = 'RptModeloDBText5'
        DataField = 'NOMEBENEF'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 61383
        mmTop = 44979
        mmWidth = 121444
        BandType = 4
      end
      object RptModeloDBText6: TppDBText
        UserName = 'RptModeloDBText6'
        DataField = 'CPF'
        DataPipeline = PpDados
        DisplayFormat = '!999.999.999-99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13494
        mmTop = 44979
        mmWidth = 40746
        BandType = 4
      end
      object RptModeloLabel42: TppLabel
        UserName = 'RptModeloLabel42'
        Caption = 'RptModeloLabel42'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 152400
        mmTop = 13494
        mmWidth = 29104
        BandType = 4
      end
      object RptModeloMemo1: TppMemo
        OnPrint = RptModeloMemo1Print
        UserName = 'RptModeloMemo1'
        Caption = 'RptModeloMemo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 23019
        mmLeft = 10583
        mmTop = 156104
        mmWidth = 173038
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
  end
  inherited QryCadModelo: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (FLGTIPOCARTA = '#39'F'#39')'
      'ORDER BY MODELOCARTA')
    Left = 261
    Top = 10
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CODINFORME FROM INFORME'
      'ORDER BY CODINFORME')
    ValidateWithMask = True
    Left = 512
    Top = 167
    object qryAuxCODINFORME: TFloatField
      FieldName = 'CODINFORME'
      Origin = 'INFORME.CODINFORME'
    end
  end
  object qryDadosTXT: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF,  P.NUM' +
        'DOCUMENTO AS CPF,'
      '         NAT.CODNATUREZA,  NAT.DESCRICAO, EN.CEP,'
      
        '         XB.CODINFORME, DECODE(SIGN(SUM(XB.VLR)),-1,0,SUM(XB.VLR' +
        ')) AS VLR'
      'FROM  PESSOA P,'
      '      ENDPESS EN,'
      '      NATURENDIMENTO NAT ,'
      
        '      ( SELECT U.IDBENEFIRRF, U.CODNATUREZA, U.IDPESSOA, U.CODIN' +
        'FORME,'
      '               SUM(U.VLR) AS VLR'
      '        FROM'
      
        '       ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA, I.CODI' +
        'NFORME,'
      
        '                SUM(DECODE(I.CODDIRF,'#39'6'#39',(LI.VLRLANC*-1),DECODE(' +
        'I.CODDIRF,'#39'7'#39',(LI.VLRLANC*-1),LI.VLRLANC))) AS VLR'
      '        FROM INFORME I, LANCXINFORME LI, LANCIRRF L'
      '        WHERE (I.IDINFORME = LI.IDINFORME) AND'
      '              (LI.IDLANCIRRF = L.IDLANCIRRF) AND'
      '              ((L.FLGDARF = '#39'N'#39') OR (L.FLGDARF IS NULL)) AND'
      
        '              (L.DATALANCAMENTO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AND'
      '              (L.IDPESSOA = :IDPESSOA) AND'
      '              (L.IDMODULO = :IDMODULO) AND'
      '              (L.CODNATUREZA <> 8888)'
      
        '        GROUP BY L.IDPESSOA,L.IDBENEFIRRF, L.CODNATUREZA, I.CODI' +
        'NFORME)'
      '   UNION ALL'
      
        '      (SELECT  UL.IDBENEFIRRF, UL.CODNATUREZA, UL.IDPESSOA, UL.C' +
        'ODINFORME,'
      '               SUM(UL.VLR) AS VLR'
      '       FROM'
      
        '          ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA, MIN' +
        '(I.CODINFORME) AS CODINFORME,'
      '                  SUM(L.VLRBASE) AS VLR'
      '              FROM INFORME I, LANCIRRF L'
      '              WHERE (I.FLGBASE = '#39'S'#39') AND'
      
        '                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXI' +
        'NFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND'
      
        '                    ((L.FLGDARF = '#39'N'#39') OR (L.FLGDARF IS NULL)) A' +
        'ND'
      
        '                    (L.DATALANCAMENTO BETWEEN TO_DATE(:DATAINI,'#39 +
        'DD/MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AND'
      '                    (L.IDPESSOA = :IDPESSOA) AND'
      '                    (L.IDMODULO = :IDMODULO) AND'
      '                    (L.CODNATUREZA <> 8888)'
      '              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA)'
      '           UNION ALL'
      
        '          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA, MIN(' +
        'I.CODINFORME) AS CODINFORME,'
      '                  SUM(L.VLRIRRF) AS VLR'
      '              FROM INFORME I, LANCIRRF L'
      '              WHERE (I.FLGIRRF = '#39'S'#39') AND'
      
        '                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXI' +
        'NFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND'
      
        '                    ((L.FLGDARF = '#39'N'#39') OR (L.FLGDARF IS NULL)) A' +
        'ND'
      
        '                    (L.DATALANCAMENTO BETWEEN TO_DATE(:DATAINI,'#39 +
        'DD/MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AND'
      '                    (L.IDPESSOA = :IDPESSOA) AND'
      '                    (L.IDMODULO = :IDMODULO) AND'
      '                    (L.CODNATUREZA <> 8888)'
      '              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA)'
      '           UNION ALL'
      
        '          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA, MIN(' +
        'I.CODINFORME) AS CODINFORME,'
      '                  SUM(L.VLRINSS) AS VLR'
      '              FROM INFORME I, LANCIRRF L'
      '              WHERE (I.CODDIRF = 4) AND'
      
        '                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXI' +
        'NFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND'
      
        '                    ((L.FLGDARF = '#39'N'#39') OR (L.FLGDARF IS NULL)) A' +
        'ND'
      
        '                    (L.DATALANCAMENTO BETWEEN TO_DATE(:DATAINI,'#39 +
        'DD/MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AND'
      '                    (L.IDPESSOA = :IDPESSOA) AND'
      '                    (L.IDMODULO = :IDMODULO) AND'
      '                    (l.codnatureza <> 8888)'
      
        '              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, L.IDPESSOA)' +
        ') UL'
      '        GROUP BY UL.IDPESSOA,UL.IDBENEFIRRF, UL.CODNATUREZA,'
      '                 UL.CODINFORME)) U'
      
        '        GROUP BY U.IDPESSOA,U.IDBENEFIRRF, U.CODNATUREZA, U.CODI' +
        'NFORME) XB'
      'WHERE  (P.TIPO = '#39'F'#39') AND'
      '       (P.IDPESSOA = XB.IDBENEFIRRF) AND'
      '       (NAT.CODNATUREZA   = XB.CODNATUREZA) AND'
      '       (NAT.CODNATUREZA <> 8888) AND'
      '       (EN.IDPESSOA(+)   = P.IDPESSOA) AND'
      '       (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND'
      '       (XB.CODINFORME >= 301 AND XB.CODINFORME <= 502)'
      'GROUP BY P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO,'
      '         NAT.CODNATUREZA,  NAT.DESCRICAO,'
      '         XB.CODINFORME, P.IDPESSOA, EN.CEP'
      
        'ORDER BY  P.IDPESSOA, EN.CEP, P.RAZAOSOCIAL, NAT.CODNATUREZA, XB' +
        '.CODINFORME'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 512
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end>
    object qryDadosTXTIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDadosTXTTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qryDadosTXTNOMEBENEF: TStringField
      FieldName = 'NOMEBENEF'
      Size = 60
    end
    object qryDadosTXTCPF: TStringField
      FieldName = 'CPF'
      Size = 18
    end
    object qryDadosTXTCODNATUREZA: TStringField
      FieldName = 'CODNATUREZA'
      Size = 4
    end
    object qryDadosTXTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryDadosTXTCODINFORME: TFloatField
      FieldName = 'CODINFORME'
    end
    object qryDadosTXTVLR: TFloatField
      FieldName = 'VLR'
    end
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CODINFORME '
      'FROM INFORME '
      'WHERE (CODINFORME >= 301 AND CODINFORME <=502)'
      'ORDER BY CODINFORME')
    ValidateWithMask = True
    Left = 279
    Top = 226
    object qryAux1CODINFORME: TFloatField
      FieldName = 'CODINFORME'
      Origin = 'INFORME.CODINFORME'
    end
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MATRICULA'
      'FROM ELEGPATRO'
      'WHERE (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 440
    Top = 175
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAux2MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'ELEGPATRO.MATRICULA'
      Size = 13
    end
  end
  object SaveDialog1: TSaveDialog
    InitialDir = 'c:\'
    Left = 520
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    Left = 165
    Top = 77
  end
  object qryAux3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, L.IDBENE' +
        'FIRRF'
      'FROM PESSOA P, RUBRICAINDIV R, LANCIRRF L, PROVDESC PR'
      'WHERE L.IDBENEFIRRF = R.IDPESSOA'
      'AND   P.IDPESSOA    = R.IDFAVORECIDO'
      'AND   R.IDRUBRICA   = PR.IDPROVENTO'
      'AND   PR.CODRUBCLT   = '#39'50018'#39
      'AND   R.IDPESSOA    = :IDPESSOA'
      'UNION'
      
        'SELECT DISTINCT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, L.IDBENE' +
        'FIRRF'
      'FROM PESSOA P, RUBRICAINDIV R, LANCIRRF L'
      'WHERE L.IDBENEFIRRF = R.IDPESSOA'
      'AND   P.IDPESSOA    = R.IDFAVORECIDO'
      'AND   R.FLGPENSAOALIM   = 1'
      'AND   R.IDPESSOA    = :IDPESSOA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 223
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAux3IDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
    end
    object qryAux3NUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryAux3NOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryAux3IDBENEFIRRF: TFloatField
      FieldName = 'IDBENEFIRRF'
    end
  end
  object qryAux4: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF,'
      '         P.NUMDOCUMENTO AS CPF,'
      '         EN.LOGRADOURO AS ENDEREO,'
      
        '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CE' +
        'P,'
      '         ES.CODESTADO AS UF, '
      '         ('#39'-'#39') AS TELEFONE, ('#39'C'#39') AS  TIPO'
      'FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES'
      'WHERE  (P.IDPESSOA = :IDPESSOA) AND'
      '       (EN.IDENDERECO(+) = P.IDENDRESIDENCIAL) AND'
      '       (EN.IDCIDADES     = C.IDCIDADES(+)) AND'
      '       (ES.IDESTADO(+)    = C.IDESTADO) AND'
      '       (EN.IDPESSOA(+)   = P.IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 223
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAux4IDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryAux4TIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qryAux4NOMEBENEF: TStringField
      FieldName = 'NOMEBENEF'
      Size = 60
    end
    object qryAux4CPF: TStringField
      FieldName = 'CPF'
      Size = 18
    end
    object qryAux4ENDEREO: TStringField
      FieldName = 'ENDEREO'
      Size = 60
    end
    object qryAux4NUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryAux4COMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryAux4BAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryAux4NOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qryAux4CEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryAux4UF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object qryAux4TELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 1
    end
    object qryAux4TIPO_1: TStringField
      FieldName = 'TIPO_1'
      Size = 1
    end
  end
  object qryAux5: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSOA, P.NUMDOCUMENTO'
      'FROM PESSOA P, ELEGPATRO E'
      'WHERE (E.MATRICULA LIKE :MATRICULA)'
      '  AND (E.IDPESSOA = P.IDPESSOA)')
    ValidateWithMask = True
    Left = 224
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
    object qryAux5IDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ELEGPATRO.IDPESSOA'
    end
    object qryAux5NUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'PESSOA.NUMDOCUMENTO'
      Size = 18
    end
  end
  object qryAux6: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NUMDOCUMENTO'
      'FROM PESSOA P'
      'WHERE (P.NUMDOCUMENTO = :NUMDOCUMENTO)'
      '')
    ValidateWithMask = True
    Left = 96
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryAux6IDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object qryAux6NUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'PESSOA.NUMDOCUMENTO'
      Size = 18
    end
  end
  object qryAux7: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE LANCIRRF SET FLGDARF = '#39'S'#39' WHERE'
      '       ((FLGDARF = '#39'N'#39') OR (FLGDARF IS NULL)) AND'
      '       (IDBENEFIRRF = :IDBENEFIRRF) AND'
      '       (CODNATUREZA = :CODNATUREZA)  AND'
      '       (IDMODULO = :IDMODULO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 167
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBENEFIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODNATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end>
  end
  object qryAux8: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.IDPESSOA, P.NUMDOCUMENTO'
      'FROM PESSOA P, FUNCIONARIO F'
      'WHERE (F.MATRICULA LIKE :MATRICULA)'
      '  AND (F.IDPESSOA = P.IDPESSOA)')
    ValidateWithMask = True
    Left = 160
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
  end
  object qryEmpresaProp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   P.RAZAOSOCIAL,'
      '         P.NUMDOCUMENTO,'
      '         EN.LOGRADOURO AS ENDEREO,'
      
        '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME AS CIDA' +
        'DE,  EN.CEP,'
      
        '         ES.CODESTADO AS UF, REPLACE(REPLACE(REPLACE(T.NUMERO, '#39 +
        '-'#39'), '#39'('#39'), '#39')'#39') AS TELEFONE, T.DDD'
      
        'FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES, (SELECT DISTIN' +
        'CT IDENDERECO, TIPO, NUMERO, DDD FROM TELENDPESS) T'
      'WHERE  (P.IDPESSOA = :IDPESSOA) AND'
      '       (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND'
      '       (EN.IDCIDADES     = C.IDCIDADES(+)) AND'
      '       (ES.IDESTADO(+)    = C.IDESTADO) AND'
      '       (EN.IDPESSOA(+)   = P.IDPESSOA) AND'
      '       (EN.IDENDERECO = T.IDENDERECO(+))')
    ValidateWithMask = True
    Left = 22
    Top = 222
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMatLocFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.IDPESSOA, F.CODCENTROCUSTO, C.NOME, F.MATRICULA'
      '  FROM FUNCIONARIO F, CENTCUST C'
      ' WHERE (F.IDPESSOA = :IDPESSOA)'
      '   AND (F.IDEMPRESA = C.IDEMPRESA)'
      '   AND (F.CODCENTROCUSTO = C.CODCENTROCUSTO)')
    ValidateWithMask = True
    Left = 328
    Top = 295
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPensionista: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, L.IDBENE' +
        'FIRRF'
      'FROM PESSOA P, RUBRICAINDIV R, LANCIRRF L, PROVDESC PR'
      'WHERE L.IDBENEFIRRF = R.IDPESSOA'
      'AND   P.IDPESSOA    = R.IDFAVORECIDO'
      'AND   R.IDRUBRICA   = PR.IDPROVENTO'
      'AND   R.IDPESSOA    = :IDPESSOA'
      'UNION'
      
        'SELECT DISTINCT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, L.IDBENE' +
        'FIRRF'
      'FROM PESSOA P, RUBRICAINDIV R, LANCIRRF L'
      'WHERE L.IDBENEFIRRF = R.IDPESSOA'
      'AND   P.IDPESSOA    = R.IDFAVORECIDO'
      'AND   R.FLGPENSAOALIM   = 1'
      'AND   R.IDPESSOA    = :IDPESSOA')
    ValidateWithMask = True
    Left = 440
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryPensionistaIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
    end
    object qryPensionistaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryPensionistaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryPensionistaIDBENEFIRRF: TFloatField
      FieldName = 'IDBENEFIRRF'
    end
  end
end
