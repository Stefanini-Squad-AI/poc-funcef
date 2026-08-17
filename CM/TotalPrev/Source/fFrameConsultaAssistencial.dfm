object frmFrameConsultaAssistencial: TfrmFrameConsultaAssistencial
  Left = 0
  Top = 0
  Width = 773
  Height = 415
  TabOrder = 0
  OnEnter = FrameEnter
  object PageControl1: TPageControl
    Left = 0
    Top = 129
    Width = 773
    Height = 286
    ActivePage = tbsDependentes
    Align = alClient
    TabOrder = 0
    object tbsDependentes: TTabSheet
      Caption = 'Dependentes'
      object dbgDependentes: TwwDBGrid
        Left = 0
        Top = 0
        Width = 765
        Height = 258
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsDependentes
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object tbsCaptSeg: TTabSheet
      Caption = 'Capitais Segurados'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 396
        Top = 0
        Width = 369
        Height = 258
        Align = alRight
        Caption = 'Opções'
        TabOrder = 0
        object Label1: TLabel
          Left = 19
          Top = 36
          Width = 59
          Height = 16
          Caption = 'Opção 1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 19
          Top = 85
          Width = 59
          Height = 16
          Caption = 'Opção 2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 19
          Top = 140
          Width = 59
          Height = 16
          Caption = 'Opção 3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 19
          Top = 194
          Width = 59
          Height = 16
          Caption = 'Opção 4'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 155
          Top = 36
          Width = 59
          Height = 16
          Caption = 'Opção 5'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 155
          Top = 86
          Width = 59
          Height = 16
          Caption = 'Opção 6'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 155
          Top = 140
          Width = 59
          Height = 16
          Caption = 'Opção 7'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 155
          Top = 194
          Width = 59
          Height = 16
          Caption = 'Opção 8'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Edit1: TEdit
          Left = 20
          Top = 56
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 20
          Top = 105
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 20
          Top = 160
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object Edit4: TEdit
          Left = 20
          Top = 214
          Width = 121
          Height = 21
          TabOrder = 3
        end
        object Edit5: TEdit
          Left = 156
          Top = 56
          Width = 121
          Height = 21
          TabOrder = 4
        end
        object Edit6: TEdit
          Left = 156
          Top = 106
          Width = 121
          Height = 21
          TabOrder = 5
        end
        object Edit7: TEdit
          Left = 156
          Top = 160
          Width = 121
          Height = 21
          TabOrder = 6
        end
        object Edit8: TEdit
          Left = 156
          Top = 214
          Width = 121
          Height = 21
          TabOrder = 7
        end
      end
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 0
        Width = 396
        Height = 258
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsCapitaisSeg
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Sinistros'
      ImageIndex = 2
      object dbgSinistros: TwwDBGrid
        Left = 0
        Top = 0
        Width = 765
        Height = 258
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsSinistros
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 129
    Align = alTop
    TabOrder = 1
    object dbgPlanAssist: TwwDBGrid
      Left = 0
      Top = 0
      Width = 425
      Height = 126
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsPlanoAssist
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object dbgContribuicoes: TwwDBGrid
      Left = 424
      Top = 1
      Width = 348
      Height = 127
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alRight
      DataSource = dsContribuicoes
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  object dsPlanoAssist: TwwDataSource
    DataSet = qryPlanoAssist
    Left = 152
    Top = 56
  end
  object qryPlanoAssist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PS.IDPESSJUR, PS.SEQPROPOSTA, PS.IDPLANOPREV, PS.IDPESSOA' +
        ', PS.IDPLANASS,'
      
        '       PS.IDSITPART, PS.DATAENTRADA, PS.FLGINSCRICAOCANC, PS.INS' +
        'CRICAONUMERO,'
      
        '       PS.DATACANCELAMENTO, PS.INSCRICAOTIPO, PS.OBSCANCEL,  PS.' +
        'FLGPARTBENEF,'
      
        '       PS.OPCAOA, PS.OPCAOB, PS.IDFORNSERV2, PS.COMISSFORN, PS.C' +
        'OMISSFUND,'
      
        '       PS.FLGOPCAOA, PS.TIPOFORNSERV2, PS.FLGOPCAOB, PS.IDNUCLEO' +
        ','
      '       PL.NOME, SP.DESCRICAO,'
      '       VALORBASE1, VALORBASE2, VALORBASE3, VALORBASE4,'
      '       VALORBASE5, VALORBASE6, VALORBASE7, VALORBASE8'
      'FROM PARTASS PS, PLANASS PL, SITPLANOASS SP'
      'WHERE PS.IDPESSJUR     = :IDPESSJUR'
      '  AND PS.SEQPROPOSTA   = :SEQPROPOSTA'
      '  AND PS.IDPLANOPREV   = :IDPLANOPREV'
      '  AND PS.IDPESSOA      = :IDPESSOA'
      '  AND PL.IDPLANASS     = PS.IDPLANASS'
      '  AND PS.IDSITPART     = SP.IDSITPLANOASS(+) ')
    ValidateWithMask = True
    Left = 224
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '3'
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '44'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1217122'
      end>
  end
  object dsAux: TwwDataSource
    DataSet = qryAux
    Left = 144
    Top = 287
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select p.Nome, e.matricula from pessoa p, elegpatro e   where p.' +
        'idpessoa = e.idpessoa     and p.idpessoa = 1217122')
    ValidateWithMask = True
    Left = 184
    Top = 287
  end
  object dsCapitaisSeg: TwwDataSource
    Left = 144
    Top = 335
  end
  object qryCapitaisSeg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PS.IDPESSJUR, PS.SEQPROPOSTA, PS.IDPLANOPREV, PS.IDPESSOA' +
        ', PS.IDPLANASS,'
      
        '       PS.IDSITPART, PS.DATAENTRADA, PS.FLGINSCRICAOCANC, PS.INS' +
        'CRICAONUMERO,'
      
        '       PS.DATACANCELAMENTO, PS.INSCRICAOTIPO, PS.OBSCANCEL,  PS.' +
        'FLGPARTBENEF,'
      
        '       PS.OPCAOA, PS.OPCAOB, PS.IDFORNSERV2, PS.COMISSFORN, PS.C' +
        'OMISSFUND,'
      
        '       PS.FLGOPCAOA, PS.TIPOFORNSERV2, PS.FLGOPCAOB, PS.IDNUCLEO' +
        ','
      '       PL.NOME, SP.DESCRICAO, FLGACEITAOPCAO,'
      '       VALORBASE1, VALORBASE2, VALORBASE3, VALORBASE4,'
      
        '       VALORBASE5, VALORBASE6, VALORBASE7, VALORBASE8, NUMOPCOES' +
        ', '
      
        '       IDREGRAVALOP1, IDREGRAVALOP2, IDREGRAVALOP3, IDREGRAVALOP' +
        '4, '
      
        '       IDREGRAVALOP5, IDREGRAVALOP6, IDREGRAVALOP7, IDREGRAVALOP' +
        '8, '
      
        '       IDREGRACALCOP1, IDREGRACALCOP2, IDREGRACALCOP3, IDREGRACA' +
        'LCOP4, '
      
        '       IDREGRACALCOP5, IDREGRACALCOP6, IDREGRACALCOP7, IDREGRACA' +
        'LCOP8, '
      
        '       NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3, NOMEVALOR' +
        'BASE4, '
      
        '       NOMEVALORBASE5, NOMEVALORBASE6, NOMEVALORBASE7, NOMEVALOR' +
        'BASE8, '
      '       FLGOBRIGAOP1, FLGOBRIGAOP2, FLGOBRIGAOP3, FLGOBRIGAOP4, '
      '       FLGOBRIGAOP5, FLGOBRIGAOP6, FLGOBRIGAOP7, FLGOBRIGAOP8, '
      '       FLGEDITAOP1, FLGEDITAOP2, FLGEDITAOP3, FLGEDITAOP4, '
      '       FLGEDITAOP5, FLGEDITAOP6, FLGEDITAOP7, FLGEDITAOP8'
      'FROM PARTASS PS, PLANASS PL, SITPLANOASS SP'
      'WHERE PS.IDPESSJUR     = :IDPESSJUR'
      '  AND PS.SEQPROPOSTA   = :SEQPROPOSTA'
      '  AND PS.IDPLANOPREV   = :IDPLANOPREV'
      '  AND PS.IDPESSOA      = :IDPESSOA'
      '  AND PS.IDPLANASS     = :IDPLANASS'
      '  AND PL.IDPLANASS     = PS.IDPLANASS'
      '  AND PS.IDSITPART     = SP.IDSITPLANOASS(+)'
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 335
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object dsDependentes: TwwDataSource
    DataSet = qryDependentes
    Left = 300
    Top = 336
  end
  object dsMostraParticip: TwwDataSource
    DataSet = qryMostraParticip
    Left = 296
    Top = 287
  end
  object qryMostraParticip: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   EL.MATRICULA ,'
      '   P.NOME AS TITULAR,'
      '   PD.NOME AS DEPENDENTE,'
      '   PP.INSCRICAONUMERO ,'
      '   PL.NOME AS BENEFICIO,'
      '   PT.NOME AS PATRO,'
      '   PLA.NOME AS PLANO,'
      '   PA.DATAENTRADA ,'
      '   PP.IDPESSJUR ,'
      '   PP.IDPLANOPREV ,'
      '   PP.SEQPROPOSTA ,'
      '   DT.IDPESSOA ,'
      '   PLA.IDPLANASS '
      'FROM'
      '   PESSOA        P,'
      '   PESSOA        PT,'
      '   PESSOA        PD,'
      '   ELEGPATRO     EL,'
      '   PLANPREV      PL,'
      '   PARTPREVPLAN  PP,'
      '   DEPENTIT      DT,'
      '   PLANPREVPATRO PPP,'
      '   PARTASS       PA,'
      '   PLANASS       PLA'
      'WHERE '
      '   ( EL.IDPESSOA       = PP.IDPESSOA ) AND'
      '   (  EL.IDPESSJUR      = PP.IDPESSJUR ) AND'
      '   ( PP.SEQPROPOSTA    = :SEQPROPOSTA  ) AND'
      '   ( PP.IDPESSJUR      = PPP.IDPESSJUR  ) AND'
      '   ( PP.IDPLANOPREV    = PPP.IDPLANOPREV ) AND'
      '   ( PPP.IDPLANOPREV   = PL.IDPLANOPREV ) AND'
      '   ( EL.IDPESSOA       = P.IDPESSOA ) AND'
      '   ( EL.IDPESSJUR      = PT.IDPESSOA ) AND'
      '   ( EL.IDPESSOA       = DT.IDTITULAR(+) ) AND'
      '   ( DT.IDPESSOA       = PD.IDPESSOA ) AND'
      '   ( PP.FLGDESATIVADO  = 0 ) AND'
      '   ( PA.IDPESSJUR      = PP.IDPESSJUR ) AND'
      '   ( PA.IDPESSOA       = PP.IDPESSOA ) AND'
      '   ( PA.SEQPROPOSTA    = :SEQPROPOSTA ) AND'
      '   ( PA.IDPLANASS      = PLA.IDPLANASS ) AND'
      '   ( NVL(PA.FLGINSCRICAOCANC, 0) = 0 ) AND'
      '   ( P.IDPESSOA = :IDPESSOA) AND'
      '   ( EL.IDPESSJUR = :IDPESSJUR) AND'
      '   ( PP.IDPLANOPREV = :IDPLANOPREV)')
    ValidateWithMask = True
    Left = 384
    Top = 287
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryDependentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       PE.NOME,'
      '       PE.IDPESSOA,'
      '       DT.IDTITULAR,'
      '       DP.DESCRICAO AS TIPODEPENDENCIA,'
      '       DT.NUMSEQUENCIA,'
      '       DT.FLGCONTAIMPOSTOR,'
      '       DT.FLGCONTASALARIOF,'
      '       DT.FLGBENEFICIARIO,'
      '       DT.FLGDESIGNADO,'
      '       DT.FLGDEPLEGAL,'
      '       DT.IDDEPENDENCIA,'
      '       DT.DATACADASTRO,'
      '       DECODE(BE.IDDEPENDENTE, DT.IDPESSOA, 1, 0) FLGBENEFASS,'
      '       BE.FLGATIVO,'
      '       BE.DATAENTRADA,'
      '       BE.DTCANCELAMENTO'
      'FROM   PESSOA   PE,'
      '       PARTASS  PA,'
      
        #9'   (SELECT IDTITULAR, IDDEPENDENTE, FLGATIVO, DATAENTRADA, DTCA' +
        'NCELAMENTO'
      #9'    FROM BENEFASS'
      #9'    WHERE IDPESSJUR   = :IDPESSJUR'
      '              AND SEQPROPOSTA = :SEQPROPOSTA'
      '              AND IDPLANOPREV = :IDPLANOPREV'
      '              AND IDPLANASS   = :IDPLANASS'
      '              AND IDTITULAR   = :IDTITULAR) BE,'
      '       DEPEN    DP,'
      '       DEPENTIT DT'
      'WHERE PA.IDPESSJUR     = :IDPESSJUR'
      '  AND PA.SEQPROPOSTA   = :SEQPROPOSTA'
      '  AND PA.IDPLANOPREV   = :IDPLANOPREV'
      '  AND PA.IDPLANASS     = :IDPLANASS'
      '  AND PA.IDPESSOA      = :IDTITULAR'
      '  AND DT.IDTITULAR     = PA.IDPESSOA'
      '  AND DT.IDPESSOA      = PE.IDPESSOA'
      '  AND DT.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      '  AND DT.IDDEPENDENCIA <> '#39'PRP'#39
      '  AND DT.IDTITULAR     = BE.IDTITULAR(+)'
      '  AND DT.IDPESSOA      = BE.IDDEPENDENTE(+)'
      'ORDER BY DT.NUMSEQUENCIA')
    ValidateWithMask = True
    Left = 380
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '3'
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '44'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '1217122'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object dsContribuicoes: TwwDataSource
    DataSet = qryContribuicoes
    Left = 616
    Top = 72
  end
  object qryContribuicoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT (ROWNUM -1) ITEM, SUB.*'
      'FROM (SELECT DISTINCT CB.IDCONTASS, CT.NOME, CB.CODPORTFORMA,'
      '             DECODE(CA.FLGATIVO, 0, '#39'Não'#39', '#39'Sim'#39')  FLGPAGA'
      '      FROM CONTRIBASS CB, CONTRIBUICAO CT,'
      '          (SELECT C.IDPLANASS, C.IDCONTASS, C.FLGATIVO'
      '           FROM CONTASS C'
      '           WHERE C.IDPLANOPREV  = :IDPLANOPREV'
      '             AND C.IDPESSJUR    = :IDPESSJUR'
      '             AND C.IDTITULAR    = :IDTITULAR'
      '             AND C.IDDEPENDENTE = :IDDEPENDENTE'
      '             AND C.IDPLANASS    = :IDPLANASS'
      '             AND C.SEQPROPOSTA  = :SEQPROPOSTA) CA'
      '           WHERE CB.IDCONTASS = CT.IDCONTRIBUICAO'
      '             AND CB.IDPLANASS = :IDPLANASS'
      '             AND CB.IDCONTASS = CA.IDCONTASS (+)'
      '           ORDER BY CT.NOME) SUB')
    ValidateWithMask = True
    Left = 696
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '44'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '3'
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '1217122'
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
        Value = '1217122'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object qrySinistros: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 524
    Top = 337
  end
  object dsSinistros: TwwDataSource
    DataSet = qrySinistros
    Left = 468
    Top = 337
  end
end
