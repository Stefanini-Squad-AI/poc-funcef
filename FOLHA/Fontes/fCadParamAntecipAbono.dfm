inherited frmCadParamAntecipAbono: TfrmCadParamAntecipAbono
  Left = 236
  Top = 136
  HelpContext = 180070
  Caption = 'Parâmetros para Antecipação de Abono'
  ClientHeight = 334
  ClientWidth = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    Height = 248
    object Label1: TLabel
      Left = 88
      Top = 19
      Width = 28
      Height = 13
      Caption = 'Mês:'
    end
    object Label2: TLabel
      Left = 32
      Top = 51
      Width = 84
      Height = 13
      Caption = 'Patrocinadora:'
    end
    object Label3: TLabel
      Left = 79
      Top = 83
      Width = 37
      Height = 13
      Caption = 'Plano:'
    end
    object Label4: TLabel
      Left = 56
      Top = 115
      Width = 60
      Height = 13
      Caption = 'Benefício:'
    end
    object Label5: TLabel
      Left = 77
      Top = 147
      Width = 39
      Height = 13
      Caption = 'Regra:'
    end
    object Label6: TLabel
      Left = 88
      Top = 171
      Width = 15
      Height = 13
      Caption = 'ou'
    end
    object Label7: TLabel
      Left = 50
      Top = 195
      Width = 66
      Height = 13
      Caption = 'Percentual:'
    end
    object cmbMes: TComboBox
      Left = 119
      Top = 16
      Width = 146
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
    object spedAno: TSpinEdit
      Left = 265
      Top = 16
      Width = 72
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 1
      Value = 0
    end
    object edtPercentual: TRealEdit
      Left = 120
      Top = 192
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 2
      WordWrap = False
      OnExit = edtPercentualExit
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    inline molRegra: TmolRegraDB
      Left = 117
      Top = 136
      Width = 380
      TabOrder = 3
      inherited DBedtRegra: TDBEdit
        Left = 42
        Top = 8
        Width = 271
        DataField = 'NOMEREGRA'
        DataSource = ds
      end
      inherited btnBuscaRegra: TBitBtn
        Left = 314
        Top = 8
        OnClick = molRegrabtnBuscaRegraClick
      end
      inherited btnLimpaRegra: TBitBtn
        Left = 339
        Top = 8
      end
      inherited DBedtIDRegra: TDBEdit
        Left = 2
        Top = 8
        DataField = 'IDREGRA'
        DataSource = ds
      end
      inherited MS_Regra: TMontaSelect
        Left = 328
        Top = 49
      end
    end
    object cboPatro: TwwDBLookupCombo
      Left = 120
      Top = 48
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Patrocinadora'#9'F')
      DataField = 'IDPESSJUR'
      DataSource = ds
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = cboPatroCloseUp
    end
    object cboPlano: TwwDBLookupCombo
      Left = 120
      Top = 80
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Plano'#9'F')
      DataField = 'IDPLANOPREV'
      DataSource = ds
      LookupTable = qryPlano
      LookupField = 'IDPLANOPREV'
      Enabled = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = cboPlanoCloseUp
    end
    object cboBeneficio: TwwDBLookupCombo
      Left = 120
      Top = 112
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Benefício'#9'F')
      DataField = 'IDBENEFICIO'
      DataSource = ds
      LookupTable = qryBeneficio
      LookupField = 'IDBENEFICIO'
      Enabled = False
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object gbxTipoReplicacao: TRadioGroup
      Left = 208
      Top = 176
      Width = 273
      Height = 57
      Caption = ' Tipo de Replicação '
      ItemIndex = 0
      Items.Strings = (
        'Todos os Planos das Patrocinadoras'
        'Todos os Benefícios da Patocinadora')
      TabOrder = 7
      Visible = False
    end
  end
  inherited Dock972: TDock97
    Width = 517
    object ToolbarButton971: TToolbarButton97 [0]
      Left = 180
      Top = 0
      Width = 60
      Height = 41
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
        33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
        8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
        F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
        F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
        0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
        B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
        B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
        333333333777733333333333FBFBFB3333333333333333333333}
      ImageIndex = 3
      Images = ImlPadrao
      Layout = blGlyphTop
      Opaque = False
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 240
      end
      object sbtnReplicar: TToolbarButton97
        Left = 180
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Replicar'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 6
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnReplicarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 295
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 345
    end
  end
  inherited ds: TwwDataSource
    Left = 407
    Top = 62
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMANTECIPABONO'
      'set'
      '  MES = :MES,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDREGRA = :IDREGRA,'
      '  PERCENTUAL = :PERCENTUAL'
      'where'
      '  MES = :OLD_MES and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into PARAMANTECIPABONO'
      
        '  (MES, IDPESSJUR, IDPLANOPREV, IDBENEFICIO, IDREGRA, PERCENTUAL' +
        ')'
      'values'
      
        '  (:MES, :IDPESSJUR, :IDPLANOPREV, :IDBENEFICIO, :IDREGRA, :PERC' +
        'ENTUAL)')
    DeleteSQL.Strings = (
      'delete from PARAMANTECIPABONO'
      'where'
      '  MES = :OLD_MES and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 435
    Top = 62
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'SUBSTR(P.MES,6,2) || '#39'/'#39' || SUBSTR(P.MES,1,4)'
      'R.NOMEREGRA'
      'PAT.NOME'
      'BEN.NOME'
      'P.PERCENTUAL'
      'PLN.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Mês'
      'Regra'
      'Patrocinadora'
      'Benefício'
      'Percentual'
      'Plano')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARAMANTECIPABONO P'
      'REGRA R'
      'PESSOA PAT'
      'PLANPREV PLN'
      'BENEFICIO BEN')
    CamposChave.Strings = (
      'P.MES'
      'P.IDPESSJUR'
      'P.IDPLANOPREV'
      'P.IDBENEFICIO')
    Filtro.Strings = (
      'PLN.IDPLANOPREV = P.IDPLANOPREV'
      'P.IDBENEFICIO = BEN.IDBENEFICIO'
      'PAT.IDPESSOA = P.IDPESSJUR'
      'P.IDREGRA = R.IDREGRA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '50'
      '50'
      '50'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 141
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 313
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 460
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '    P.MES,'
      '    P.IDPESSJUR,'
      '    P.IDPLANOPREV,'
      '    P.IDBENEFICIO,'
      '    P.IDREGRA,'
      '    P.PERCENTUAL,'
      '    R.NOMEREGRA'
      'FROM'
      '    PARAMANTECIPABONO P, REGRA R'
      'WHERE'
      '    P.MES           = :PMES'
      'AND P.IDPESSJUR     = :PIDPESSJUR'
      'AND P.IDPLANOPREV   = :PIDPLANOPREV'
      'AND ((:PIDBENEFICIO IS NULL) OR (P.IDBENEFICIO = :PIDBENEFICIO))'
      'AND P.IDREGRA        = R.IDREGRA(+)')
    Left = 378
    Top = 62
    ParamData = <
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end>
    object qryMES: TStringField
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Size = 60
    end
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PES.IDPESSOA,'
      '   PES.NOME'
      'FROM'
      '   PATRO PAT,'
      '   PESSOA PES'
      'WHERE'
      '   PAT.IDPESSOA = PES.IDPESSOA'
      'ORDER BY'
      '   PES.NOME')
    ValidateWithMask = True
    Left = 152
    Top = 71
    object qryPatroNOME: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    PPP.IDPLANOPREV,'
      '    PLP.NOME'
      'FROM'
      '    PLANPREVPATRO PPP,'
      '    PLANPREV PLP'
      'WHERE'
      '    PLP.IDPLANOPREV = PPP.IDPLANOPREV'
      'AND PPP.IDPESSJUR   = :PIDPESSJUR'
      'ORDER BY'
      '    PLP.NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 95
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end>
    object qryPlanoNOME: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryPlanoIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVPATRO.IDPLANOPREV'
      Visible = False
    end
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '    BPP.IDBENEFICIO,'
      '    BNF.NOME,'
      '    BPL.FLGREFERENCIA'
      'FROM'
      '    BENEFPLANPATRO BPP,'
      '    BENEFICIO BNF,'
      '    BENEFPLANPREV BPL'
      'WHERE'
      '    BNF.IDBENEFICIO = BPP.IDBENEFICIO'
      'AND BPP.IDPESSJUR   = :PIDPESSJUR'
      'AND BPP.IDPLANOPREV = :PIDPLANOPREV'
      'AND BPL.IDBENEFICIO = BPP.IDBENEFICIO'
      'AND BPL.FLGPOSSUIABONO = 1'
      'ORDER BY'
      '    BNF.NOME'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 248
    Top = 127
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryBeneficioNOME: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
    object qryBeneficioIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFPLANPATRO.IDBENEFICIO'
      Visible = False
    end
    object qryBeneficioFLGREFERENCIA: TFloatField
      FieldName = 'FLGREFERENCIA'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGREFERENCIA'
    end
  end
  object qryReplicacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '    BPP.IDPESSJUR,'
      '    BPP.IDPLANOPREV,'
      '    BPP.IDBENEFICIO'
      'FROM'
      '    BENEFPLANPATRO BPP,'
      '    BENEFPLANPREV BPL'
      'WHERE'
      '    BPL.FLGREFERENCIA = :PFLGREFERENCIA'
      'AND BPP.IDBENEFICIO   <> :PIDBENEFICIO'
      'AND BPP.IDPESSJUR     = :PIDPESSJUR'
      'AND BPP.IDPLANOPREV   = :PIDPLANOPREV'
      ''
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 231
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryReplicacaoIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS."CM.BENEFPLANPATRO".IDBENEFICIO'
    end
    object qryReplicacaoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFPLANPATRO.IDPESSJUR'
    end
    object qryReplicacaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFPLANPATRO.IDPLANOPREV'
    end
  end
  object qryInsertReplicacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO PARAMANTECIPABONO(MES,IDPESSJUR,IDPLANOPREV,IDBENEFI' +
        'CIO,IDREGRA,PERCENTUAL)'
      
        'VALUES (:PMES,:PIDPESSJUR,:PIDPLANOPREV,:PIDBENEFICIO,:PIDREGRA,' +
        ':PPERCENTUAL)')
    ValidateWithMask = True
    Left = 32
    Top = 279
    ParamData = <
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PPERCENTUAL'
        ParamType = ptInput
      end>
  end
end
