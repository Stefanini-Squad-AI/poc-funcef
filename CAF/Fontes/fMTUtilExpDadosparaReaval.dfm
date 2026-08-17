inherited frmMTUtilExpDadosparaReaval: TfrmMTUtilExpDadosparaReaval
  Left = 340
  Top = 151
  HelpContext = 70004
  Caption = 'Exportação de Dados para Reavaliação'
  ClientHeight = 208
  ClientWidth = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 169
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 105
      Height = 13
      Caption = 'Movimentação até'
    end
    object Label7: TLabel
      Left = 24
      Top = 72
      Width = 105
      Height = 13
      Caption = 'Pasta de Trabalho'
    end
    object pnlStatus: TPanel
      Left = 5
      Top = 123
      Width = 418
      Height = 41
      Align = alBottom
      TabOrder = 3
      Visible = False
      object lblStatus: TLabel
        Left = 8
        Top = 4
        Width = 44
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pnlprgBar: TPanel
        Left = 8
        Top = 18
        Width = 405
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 403
          Height = 15
          Align = alClient
          BackColor = clSilver
          BorderStyle = bsNone
          Color = clGray
          ForeColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
        end
      end
    end
    object eDtaFim: TCMDateTimePicker
      Left = 24
      Top = 32
      Width = 113
      Height = 24
      Hint = 'Data Programada para Pagamento'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      ShowButton = True
      TabOrder = 0
    end
    object edSelPasta: TEdit
      Left = 24
      Top = 88
      Width = 365
      Height = 21
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object bbtnSelPasta: TBitBtn
      Left = 388
      Top = 88
      Width = 21
      Height = 21
      TabOrder = 1
      OnClick = bbtnSelPastaClick
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
  inherited Dock971: TDock97
    Top = 169
    Width = 428
    inherited tb97Fundo: TToolbar97
      Left = 258
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 674
    Top = 415
  end
  object pDirTrabalho: TProcuraDirDlg
    Caption = 'Selecione a pasta de destino'
    Directory = 
      '\Imports;$(DELPHI)\Projects\Bpl;c:\projetoscm5\cm\packages;C:\Pr' +
      'ojetosCM5\Cm\Csv\Source;c:\projetoscm5\cmcafobj50\ctrlobjetos;c:' +
      '\projetoscm5\cmcafobj50\dbobjetos;c:\projetoscm5\cafmt\fontesmt;' +
      'c:\projetoscm5\cmcafobj50\source;c:\projetoscm51\cmcafobj50\ctrl' +
      'obje'
    Folder = foCustom
    ShowPath = False
    Left = 32
    Top = 152
  end
  object cdsCadBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 32
  end
  object sqlCadBens: TCMSqlParams
    SQL.Strings = (
      'SELECT B.IDPESSOA,'
      '       E.IDFILIALARQ,'
      '       B.IDBEM,'
      '       '#39'0000'#39' AS AGREGADO,'
      '       B.PLACA,'
      '       '#39'00'#39' AS TIPODEBEM,'
      '       B.IDGRUPO,'
      '       L.CODCENTROCUSTO,'
      '       C.IDLOCALIZACAO,'
      '       '#39'000000'#39' AS AREADERISCO,'
      '       B.IDCLASSEBEM,'
      '       B.DESBEM,'
      '       B.IDNOTA,'
      '       B.IDFORNSERV,'
      '       B.DTACONTAB,'
      '       B.DTAINCLUSAO,'
      '       B.DATAINICIODEP,'
      '       '#39'OO/OO/OOOO'#39' AS DATAINICIOCIAP,'
      '       (0) AS TAXADEP,'
      '       (0) AS TAXADEPMOEGER1,'
      '       (0) AS TAXADEPMOEGER2,'
      '            B.VALHISTORICO,'
      '       (0) AS VALORG,'
      '       (0) AS DEPLANC,'
      '       (0) AS VALFIS,'
      '       (0) AS DEPFIS,'
      '       (0) AS VALUFIRAQUIS,'
      '       (0) AS VALGER1,'
      '       (0) AS DEPGER1,'
      '       (0) AS VALGER1AQUIS,'
      '       (0) AS VALGER2,'
      '       (0) AS DEPGER2,'
      '       (0) AS VALGER2AQUIS,'
      '       (0) AS BAIXADO,'
      '       DB.DATABAIXA,'
      '       (0) AS ICMSBEM'
      ''
      'FROM BEM B, CONJUNTO C, LOCALIZACAO L, EMPRESAPROP E,'
      ''
      '     (SELECT IDBEM, IDPESSOA, DATAMOVIMENTACAO AS DATABAIXA'
      '      FROM HISTORICOMOVIMENTACAO'
      '      WHERE (IDTIPOMOVIMENTACAO = 06)'
      '        AND (DATAMOVIMENTACAO <= :DATAMOVFIM)) DB'
      ''
      'WHERE (B.DATAINICIODEP <= :DATAMOVFIM)'
      '  AND (B.IDPESSOA = E.IDPESSOA)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '  AND (B.IDPESSOA = C.IDPESSOA)'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO)'
      '  AND (C.IDPESSOA = L.IDPESSOA)'
      '  AND (B.IDBEM = DB.IDBEM(+))'
      '  AND (B.IDPESSOA = DB.IDPESSOA(+))'
      '  '
      'ORDER BY B.IDPESSOA, B.PLACA'
      '')
    ClientDataSet = cdsCadBens
    Left = 176
    Top = 18
  end
  object cdsSaldoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 24
  end
  object sqlSaldoContabil: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SB.IDBEM, SB.IDPESSOA, SB.DATASLDBEM, SB.MOECODIGO, SB.ID' +
        'SLDCTBBEMXDEP,'
      
        '       BD.TAXADEP, SB.IDGRUPO, SB.IDLOCALIZACAO, SB.IDRESPONSAVE' +
        'L,'
      '       SB.VALORG, SB.CMBEM, SB.DEPLANC, SB.CMDEP,'
      
        '       SB.REAVVALORG, SB.REAVCMBEM, SB.REAVDEPLANC, SB.REAVCMDEP' +
        ','
      
        '       SB.ULTREAVVALORG, SB.ULTREAVCMBEM, SB.ULTREAVDEPLANC, SB.' +
        'ULTREAVCMDEP'
      ''
      'FROM BEMXDEP BD,'
      
        '     (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '             SCB1.VALORG,  SCB1.REAVVALORG, SCB1.ULTREAVVALORG,'
      '             SCB1.CMBEM, SCB1.REAVCMBEM, SCB1.ULTREAVCMBEM,'
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC, SCD1.ULTREAVDEPLANC' +
        ','
      '             SCD1.CMDEP, SCD1.REAVCMDEP, SCD1.ULTREAVCMDEP,'
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '     FROM SLDCTBBEMXDEP SCD1,'
      '          (SELECT IDBEM,'
      '                  MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND :MOECODIGO = MOECODIGO'
      '              AND :IDPESSOA = IDPESSOA'
      '              AND :IDBEM = IDBEM'
      '            GROUP BY IDBEM) DTAMAX,'
      '           SALDOCONTABBEM SCB1'
      '     WHERE SCB1.IDBEM = :IDBEM'
      '       AND SCB1.IDPESSOA = :IDPESSOA'
      '       AND SCB1.MOECODIGO = :MOECODIGO'
      '       AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '       AND DTAMAX.DATA = SCB1.DATASLDBEM'
      '       AND DTAMAX.IDBEM = SCB1.IDBEM'
      '       AND SCD1.IDBEM = SCB1.IDBEM + 0'
      '       AND SCD1.IDPESSOA = SCB1.IDPESSOA'
      '       AND SCD1.MOECODIGO = SCB1.MOECODIGO'
      '       AND SCD1.DATASLDBEM = SCB1.DATASLDBEM'
      '       AND SCD1.IDBEM + 0 = :IDBEM'
      '       AND SCD1.IDPESSOA = :IDPESSOA'
      '       AND SCD1.MOECODIGO = :MOECODIGO'
      '       AND SCD1.DATASLDBEM = DTAMAX.DATA'
      '       AND SCD1.IDBEM = DTAMAX.IDBEM) SB'
      ''
      'WHERE SB.IDBEM = :IDBEM'
      '  AND SB.IDPESSOA = :IDPESSOA'
      '  AND SB.MOECODIGO = :MOECODIGO'
      '  AND SB.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '  AND SB.IDBEM = BD.IDBEM'
      '  AND SB.IDPESSOA = BD.IDPESSOA'
      '  AND SB.MOECODIGO = BD.MOECODIGO'
      '  AND SB.IDSLDCTBBEMXDEP = BD.IDBEMXDEP'
      '  AND :IDBEM = BD.IDBEM'
      '  AND :IDPESSOA = BD.IDPESSOA'
      '  AND :MOECODIGO = BD.MOECODIGO'
      '  AND :IDTAXADEP = BD.IDBEMXDEP')
    ClientDataSet = cdsSaldoContabil
    Left = 264
    Top = 10
  end
  object cdsEmpresas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 96
  end
  object sqlEmpresas: TCMSqlParams
    SQL.Strings = (
      'SELECT E.IDPESSOA, P.NOME'
      'FROM EMPRESAPROP E,'
      '     PESSOA P'
      'WHERE (E.IDPESSOA = P.IDPESSOA)'
      'ORDER BY E.IDPESSOA      ')
    ClientDataSet = cdsEmpresas
    Left = 96
    Top = 82
  end
  object cdsGrupoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 96
  end
  object sqlGrupoContabil: TCMSqlParams
    SQL.Strings = (
      
        'SELECT P.IDPESSOA, P.IDGRUPO, G.CLASSE, G.NOME, GT.IDTAXADEP, GT' +
        '.TAXADEP,'
      '       CCC.CONTACUSTO, CCD.CONTADEPREC'
      ''
      'FROM PLANOGRUPO P,'
      '     GRUPO G,'
      '     GRUPOTAXADEP GT,'
      '     (SELECT IDPESSOA, IDGRUPO, PLACONTA AS CONTACUSTO'
      '      FROM CONTASTIPOSMOVIMENTOGRUPOS CTMG'
      '      WHERE (IDTIPOMOVIMENTACAO = 01)'
      '        AND (TIPOLANCAMENTO = '#39'D'#39')) CCC,'
      ''
      '     (SELECT IDPESSOA, IDGRUPO, PLACONTA AS CONTADEPREC'
      '      FROM CONTASTIPOSMOVIMENTOGRUPOS CTMG'
      '      WHERE (IDTIPOMOVIMENTACAO = 14)'
      '        AND (TIPOLANCAMENTO = '#39'C'#39')) CCD'
      ''
      'WHERE (P.IDGRUPO  = G.IDGRUPO)'
      '  AND (P.IDGRUPO  = GT.IDGRUPO(+))'
      '  AND (P.IDPESSOA = GT.IDPESSOA(+))'
      '  AND (P.IDGRUPO  = CCC.IDGRUPO(+))'
      '  AND (P.IDPESSOA = CCC.IDPESSOA(+))'
      '  AND (P.IDGRUPO  = CCD.IDGRUPO(+))'
      '  AND (P.IDPESSOA = CCD.IDPESSOA(+))'
      ''
      'ORDER BY P.IDPESSOA, P.IDGRUPO')
    ClientDataSet = cdsGrupoContabil
    Left = 176
    Top = 82
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 96
  end
  object sqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT IDEMPRESA, CODCENTROCUSTO, NOME'
      'FROM CENTCUST'
      'ORDER BY IDEMPRESA, CODCENTROCUSTO')
    ClientDataSet = cdsCentroCusto
    Left = 264
    Top = 82
  end
  object sqlCadReaval: TCMSqlParams
    SQL.Strings = (
      'SELECT R.IDPESSOA,'
      '       E.IDFILIALARQ,'
      '       R.IDBEM,'
      '       R.IDREAVALIACAO, '
      '       '#39'0000'#39' AS AGREGADO,'
      '       B.PLACA,'
      '       '#39'00'#39' AS TIPODEBEM,'
      '       B.IDGRUPO,'
      '       L.CODCENTROCUSTO,'
      '       C.IDLOCALIZACAO,'
      '       '#39'000000'#39' AS AREADERISCO,'
      '       B.IDCLASSEBEM,'
      '       B.DESBEM,'
      '       B.IDNOTA,'
      '       B.IDFORNSERV,'
      '       R.DATAREAVALIACAO AS DTACONTAB,'
      '       R.DATAREAVALIACAO AS DTAINCLUSAO,'
      '       R.DATAREAVALIACAO AS DATAINICIODEP,'
      '       '#39'OO/OO/OOOO'#39' AS DATAINICIOCIAP,'
      '       (0) AS TAXADEP,'
      '       (0) AS TAXADEPMOEGER1,'
      '       (0) AS TAXADEPMOEGER2,'
      '       (0) AS VALHISTORICO,'
      '       (0) AS VALORG,'
      '       (0) AS DEPLANC,'
      '       (0) AS VALFIS,'
      '       (0) AS DEPFIS,'
      '       (0) AS VALUFIRAQUIS,'
      '       (0) AS VALGER1,'
      '       (0) AS DEPGER1,'
      '       (0) AS VALGER1AQUIS,'
      '       (0) AS VALGER2,'
      '       (0) AS DEPGER2,'
      '       (0) AS VALGER2AQUIS,'
      '       (0) AS BAIXADO,'
      '       DB.DATABAIXA,'
      '       (0) AS ICMSBEM'
      ''
      
        'FROM REAVALIACAO R, BEM B, CONJUNTO C, LOCALIZACAO L, EMPRESAPRO' +
        'P E,'
      ''
      '     (SELECT IDBEM, IDPESSOA, DATAMOVIMENTACAO AS DATABAIXA'
      '      FROM HISTORICOMOVIMENTACAO'
      '      WHERE (IDTIPOMOVIMENTACAO = 06)'
      '        AND (DATAMOVIMENTACAO <= :DATAMOVFIM)) DB'
      ''
      'WHERE (R.DATAREAVALIACAO <= :DATAMOVFIM)'
      '  AND (R.IDPESSOA = E.IDPESSOA)'
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (R.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '  AND (B.IDPESSOA = C.IDPESSOA)'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO)'
      '  AND (C.IDPESSOA = L.IDPESSOA)'
      '  AND (R.IDBEM = DB.IDBEM(+))'
      '  AND (R.IDPESSOA = DB.IDPESSOA(+))'
      ''
      'ORDER BY R.IDPESSOA, B.PLACA, R.IDREAVALIACAO'
      '')
    ClientDataSet = cdsCadBens
    Left = 176
    Top = 5
  end
  object cdsSaldoReaval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 24
  end
  object sqlSaldoReaval: TCMSqlParams
    SQL.Strings = (
      
        'SELECT R.IDPESSOA, R.IDBEM, R.IDREAVALIACAO, R.DATAREAVALIACAO, ' +
        'RD.TAXADEP,'
      
        '       ROUND(NVL(REAVCUSTO.VALOR,0) - NVL(BXREAVCUSTO.VALOR,0),4' +
        ') AS REAVCUSTO,'
      
        '       ROUND(NVL(REAVDEPACUM.VALOR,0) - NVL(BXREAVDEPACUM.VALOR,' +
        '0),4) AS REAVDEPACUM'
      ''
      'FROM REAVALIACAO R, REAVALXDEP RD,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.' +
        'VALOR,0)) AS VALOR'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (08,32,45,22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :DATAMOVFIM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) REAVCUSTO' +
        ','
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.' +
        'VALOR,0)) AS VALOR'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (18,33,47,19,48))'
      '      AND  ((HM.DATAMOVIMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) REAVDEPAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.' +
        'VALOR,0)) AS VALOR'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (20,28))'
      '      AND  ((HM.DATAMOVIMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXREAVCUS' +
        'TO,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.' +
        'VALOR,0)) AS VALOR'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (27,29))'
      '      AND  (HM.DATAMOVIMENTACAO <= :DATAMOVFIM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXREAVDEP' +
        'ACUM'
      ''
      'WHERE (R.IDBEM         = :IDBEM)'
      '  AND (R.IDPESSOA      = :IDPESSOA)'
      '  AND (R.IDREAVALIACAO = :IDREAVALIACAO)'
      '  AND (R.DATAREAVALIACAO <= :DATAMOVFIM)'
      '  AND (RD.MOECODIGO    = :MOECODIGO)'
      '  AND (RD.IDREAVALXDEP = :IDTAXADEP)'
      '  AND (R.IDREAVALIACAO = RD.IDREAVALIACAO)'
      '  AND (R.IDPESSOA      = REAVCUSTO.IDPESSOA(+))'
      '  AND (R.IDBEM         = REAVCUSTO.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = REAVCUSTO.IDREAVALACRESC(+))'
      '  AND (R.IDPESSOA      = REAVDEPACUM.IDPESSOA(+))'
      '  AND (R.IDBEM         = REAVDEPACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = REAVDEPACUM.IDREAVALACRESC(+))'
      '  AND (R.IDPESSOA      = BXREAVCUSTO.IDPESSOA(+))'
      '  AND (R.IDBEM         = BXREAVCUSTO.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXREAVCUSTO.IDREAVALACRESC(+))'
      '  AND (R.IDPESSOA      = BXREAVDEPACUM.IDPESSOA(+))'
      '  AND (R.IDBEM         = BXREAVDEPACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXREAVDEPACUM.IDREAVALACRESC(+))'
      ''
      'ORDER BY R.IDPESSOA, R.IDBEM, R.IDREAVALIACAO'
      '')
    ClientDataSet = cdsSaldoReaval
    Left = 352
    Top = 8
  end
  object cdsLocalizacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 96
  end
  object sqlLocalizacao: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPESSOA, IDLOCALIZACAO, NOME'
      'FROM LOCALIZACAO'
      'ORDER BY IDPESSOA, IDLOCALIZACAO'
      '')
    ClientDataSet = cdsLocalizacao
    Left = 344
    Top = 82
  end
end
