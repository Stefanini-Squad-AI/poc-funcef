inherited frmParamFechaBoleta: TfrmParamFechaBoleta
  Left = 420
  Top = 201
  HelpContext = 790279
  Caption = 'Seleciona Boleta'
  ClientHeight = 287
  ClientWidth = 352
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 352
    Height = 201
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 350
      Height = 199
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 11
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label1: TLabel
        Left = 14
        Top = 97
        Width = 53
        Height = 13
        Caption = 'Corretora'
      end
      object lblBoleta: TLabel
        Left = 14
        Top = 145
        Width = 37
        Height = 13
        Caption = 'Boleta'
      end
      object Label4: TLabel
        Left = 14
        Top = 54
        Width = 77
        Height = 13
        Caption = 'Plano / Patro'
      end
      object dbDtaOperacao: TCMDateTimePicker
        Left = 14
        Top = 26
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
        TabOrder = 0
        OnExit = dbDtaOperacaoExit
      end
      object dblCorretora: TwwDBLookupCombo
        Left = 14
        Top = 113
        Width = 324
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCORRETVALORES'#9'25'#9'Descrição')
        LookupTable = QryCorretValores
        LookupField = 'IDCORRETVALORES'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblCorretoraExit
      end
      object dblkBoleta: TwwDBLookupCombo
        Left = 14
        Top = 161
        Width = 324
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDBOLETA'#9'30'#9'Boleta'#9'F')
        LookupTable = QryBoleta
        LookupField = 'IDBOLETA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblPlanoPatro: TwwDBLookupCombo
        Left = 14
        Top = 69
        Width = 324
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Descrição'#9'F')
        LookupTable = qryPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnExit = dblPlanoPatroExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 352
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 352
    inherited tb97Fundo: TToolbar97
      Left = 180
      DockPos = 193
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 11
      DockPos = 24
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 223
    Top = 5
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 285
    Top = 2
  end
  inherited upd: TUpdateSQL
    Left = 257
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'BOLETA.IDBOLETA'
      'BOLETA.DATABOLETA'
      'BOLETA.STATUS')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Corretora'
      'Boleta'
      'Data'
      'Status')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BOLETA')
    CamposChave.Strings = (
      'BOLETA.IDFORCLI'
      'BOLETA.DATABOLETA'
      'BOLETA.STATUS'
      'BOLETA.IDBOLETA')
    Filtro.Strings = (
      'BOLETA.IDFORCLI = PESSOA.IDPESSOA'
      'BOLETA.TIPMOVBOLETA = '#39'OPE'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '23'
      '15'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 223
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 216
    Top = 53
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 263
    Top = 54
  end
  inherited qry: TwwQuery
    Left = 313
    Top = 2
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT B.IDBOLETA, B.STATUS'
      'FROM   BOLETA B, OPERACAOINVEST O'
      'WHERE (B.DATABOLETA = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      '  AND (B.IDFORCLI   = :IDFORCLI)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      '  AND (B.IDBOLETA = O.NUMDOCUMENTO)'
      'ORDER BY B.IDBOLETA')
    ValidateWithMask = True
    Left = 288
    Top = 199
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
    object QryBoletaIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 30
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object QryBoletaSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CV.IDCORRETVALORES, CV.SGLCORRETVALORES'
      'FROM CORRETVALORES CV, OPERACAOINVEST OPI'
      'WHERE CV.IDCORRETVALORES = OPI.IDCORRETVALORES'
      '  AND OPI.DATAOPERACAO = :P_DATAOPERACAO'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OPI.IDPLANPREVCTBPATR = ' +
        ':IDPLANPREVCTBPATR))'
      '  AND OPI.IDTIPOINVEST = 2'
      'ORDER BY SGLCORRETVALORES'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 293
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'P_DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
    object QryCorretValoresIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.CORRETVALORES.IDCORRETVALORES'
    end
    object QryCorretValoresSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Origin = 'BASEDADOS.CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
  end
  object qryPlanoPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO,'
      '       PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL, OPE' +
        'RACAOINVEST OI, CORRETVALORES CV'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '  AND (CV.IDCORRETVALORES = OI.IDCORRETVALORES)'
      '  AND (OI.DATAOPERACAO = TO_DATE(:DATAOPERACAO, '#39'DD/MM/YYYY'#39'))'
      '  AND (PA.IDPLANPREVCTBPATR(+) = OI.IDPLANPREVCTBPATR)'
      'ORDER BY PLANPRVCONTABPATRO'
      ''
      '')
    ValidateWithMask = True
    Left = 293
    Top = 108
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end>
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
end
