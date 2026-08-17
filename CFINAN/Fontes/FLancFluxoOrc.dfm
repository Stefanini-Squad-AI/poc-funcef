inherited frmLancFluxoOrc: TfrmLancFluxoOrc
  Left = 265
  Top = 224
  Caption = 'Lançamento do Fluxo Orçado'
  ClientHeight = 470
  ClientWidth = 468
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 468
    Height = 384
    object DadosAlteraveis: TGroupBox
      Left = 1
      Top = 310
      Width = 466
      Height = 73
      Align = alBottom
      TabOrder = 1
      object lblMoeda: TLabel
        Left = 26
        Top = 21
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object lblValorOutDet: TLabel
        Left = 126
        Top = 21
        Width = 127
        Height = 13
        Caption = 'Valor em Outra Moeda'
      end
      object lblValorDet: TLabel
        Left = 290
        Top = 21
        Width = 124
        Height = 13
        Caption = 'Valor Moeda Corrente'
      end
      object dblcMoeda: TwwDBLookupCombo
        Left = 23
        Top = 37
        Width = 77
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'10'#9'MOESIGLA')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = qryMoeda
        LookupField = 'MOECODIGO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnExit = dblcMoedaExit
      end
      object dbeValorMoeda: TRealEdit
        Left = 126
        Top = 37
        Width = 146
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dbeValor: TRealEdit
        Left = 290
        Top = 37
        Width = 146
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object gbDadosBasicos: TGroupBox
      Left = 1
      Top = 1
      Width = 466
      Height = 309
      Align = alClient
      TabOrder = 0
      object lblUnidNegoc: TLabel
        Left = 17
        Top = 15
        Width = 54
        Height = 13
        Caption = 'Atividade'
      end
      object lblTipoRD: TLabel
        Left = 17
        Top = 63
        Width = 196
        Height = 13
        Caption = 'Tipo de Recebimento/Desembolso'
      end
      object lblCentroRespon: TLabel
        Left = 255
        Top = 15
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object lblData: TLabel
        Left = 255
        Top = 63
        Width = 119
        Height = 13
        Caption = 'Data do Lançamento'
      end
      object Label1: TLabel
        Left = 17
        Top = 159
        Width = 48
        Height = 13
        Caption = 'Usuário:'
      end
      object Label2: TLabel
        Left = 257
        Top = 159
        Width = 32
        Height = 13
        Caption = 'Data:'
      end
      object Label3: TLabel
        Left = 17
        Top = 111
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object dblcUnidNegoc: TwwDBLookupCombo
        Left = 17
        Top = 30
        Width = 200
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'NOME')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = qryUnidNegoc
        LookupField = 'UNIDNEGOC'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblcCentroRespon: TwwDBLookupCombo
        Left = 255
        Top = 30
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        DataField = 'CODCENTRORESPON'
        DataSource = ds
        LookupTable = qryCentroRespon
        LookupField = 'CODCENTRORESPON'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblcCentroResponChange
      end
      object dbeDataLanc: TCMDateTimePicker
        Left = 255
        Top = 81
        Width = 146
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAPROGRAMADA'
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
      object DBEdNomeUsuario: TDBEdit
        Left = 16
        Top = 176
        Width = 201
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TRGUSERINCLUSAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdData: TDBEdit
        Left = 256
        Top = 176
        Width = 145
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TRGDTINCLUSAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 6
      end
      object dblcTipoDocurmento: TwwDBLookupCombo
        Left = 17
        Top = 129
        Width = 200
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO'#9'F'
          'CODTIPDOC'#9'10'#9'CODTIPDOC'#9'F')
        DataField = 'CODTIPDOC'
        DataSource = ds
        LookupTable = qryTipoDocumento
        LookupField = 'CODTIPDOC'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblcTipoRD: TwwDBLookupCombo
        Left = 17
        Top = 81
        Width = 200
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F'
          'RECPAG'#9'1'#9'Tipo'#9'F'
          'CODTIPRECDES'#9'15'#9'Código'#9'F')
        DataField = 'CODTIPRECDES'
        DataSource = ds
        LookupTable = qryTipoRD
        LookupField = 'CODTIPRECDES'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblcTipoRDChange
      end
      object pnlPrevidenciario: TPanel
        Left = 2
        Top = 216
        Width = 462
        Height = 91
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 7
        Visible = False
        object Label18: TLabel
          Left = 17
          Top = 48
          Width = 73
          Height = 13
          Caption = 'Patrocinador'
        end
        object Label19: TLabel
          Left = 16
          Top = 8
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object dblcPatrocinador: TwwDBLookupCombo
          Left = 17
          Top = 62
          Width = 320
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'F')
          DataField = 'IDPATRO'
          DataSource = ds
          LookupTable = qryPatro
          LookupField = 'IDPESSOA'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object dblcPlanoPrev: TwwDBLookupCombo
          Left = 16
          Top = 22
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'NOME'#9'F')
          DataField = 'IDPLANOPREV'
          DataSource = ds
          LookupTable = qryPlanoPrev
          LookupField = 'IDPLANOPREV'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 468
  end
  inherited Dock971: TDock97
    Top = 431
    Width = 468
    inherited tb97Fundo: TToolbar97
      Left = 296
      DockPos = 300
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 127
      DockPos = 131
    end
    object FlgPermiteLancamentos: TCheckBox
      Left = 8
      Top = 8
      Width = 121
      Height = 17
      Caption = 'Flag Permite Lançam.'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 328
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 400
    Top = 184
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FLUXOORCADO'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPATRO = :IDPATRO,'
      '  IDFLUXOORCADO = :IDFLUXOORCADO,'
      '  DATAPROGRAMADA = :DATAPROGRAMADA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  PRAZO = :PRAZO,'
      '  MOECODIGO = :MOECODIGO,'
      '  VALOR = :VALOR,'
      '  VALOROUTRAMOEDA = :VALOROUTRAMOEDA,'
      '  CODTIPDOC = :CODTIPDOC'
      'where'
      '  IDFLUXOORCADO = :OLD_IDFLUXOORCADO')
    InsertSQL.Strings = (
      'insert into FLUXOORCADO'
      
        '  (IDPESSOA, IDPLANOPREV, IDEMPRESA, IDPATRO, IDFLUXOORCADO, DAT' +
        'APROGRAMADA, '
      
        '   CODCENTROCUSTO, CODTIPRECDES, RECPAG, UNIDNEGOC, CODCENTRORES' +
        'PON, PRAZO, '
      '   MOECODIGO, VALOR, VALOROUTRAMOEDA, CODTIPDOC)'
      'values'
      
        '  (:IDPESSOA, :IDPLANOPREV, :IDEMPRESA, :IDPATRO, :IDFLUXOORCADO' +
        ', :DATAPROGRAMADA, '
      
        '   :CODCENTROCUSTO, :CODTIPRECDES, :RECPAG, :UNIDNEGOC, :CODCENT' +
        'RORESPON, '
      '   :PRAZO, :MOECODIGO, :VALOR, :VALOROUTRAMOEDA, :CODTIPDOC)')
    DeleteSQL.Strings = (
      'delete from FLUXOORCADO'
      'where'
      '  IDFLUXOORCADO = :OLD_IDFLUXOORCADO')
    Left = 432
    Top = 184
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FLUXOORCADO.DATAPROGRAMADA'
      'TIPORECEBDESEMB.DESCRICAO'
      'FLUXOORCADO.RECPAG'
      'UNIDNEGOCIO.NOME'
      'CENTRESPON.NOME'
      'FLUXOORCADO.VALOR'
      'MOEDA.MOEDESC'
      'FLUXOORCADO.VALOROUTRAMOEDA')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Data do Lançamento'
      'Tipo Receb./Desemb.'
      'R/P               '
      'Atividade'
      'Centro de Responsabilidade'
      'Valor Moeda Corrente'
      'Moeda'
      'Valor em Outra Moeda')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FLUXOORCADO'
      'CENTRESPON'
      'TIPORECEBDESEMB'
      'UNIDNEGOCIO'
      'MOEDA')
    CamposChave.Strings = (
      'FLUXOORCADO.IDFLUXOORCADO')
    Filtro.Strings = (
      'CENTRESPON.CODCENTRORESPON=FLUXOORCADO.CODCENTRORESPON'
      'CENTRESPON.IDPESSOA=FLUXOORCADO.IDPESSOA'
      'TIPORECEBDESEMB.CODTIPRECDES=FLUXOORCADO.CODTIPRECDES'
      'TIPORECEBDESEMB.IDPESSOA=FLUXOORCADO.IDPESSOA'
      'TIPORECEBDESEMB.RECPAG=FLUXOORCADO.RECPAG'
      'UNIDNEGOCIO.UNIDNEGOC=FLUXOORCADO.UNIDNEGOC'
      'UNIDNEGOCIO.IDPESSOA=FLUXOORCADO.IDPESSOA'
      'MOEDA.MOECODIGO(+)=FLUXOORCADO.MOECODIGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '15'
      '1'
      '10'
      '10'
      '1'
      '10')
    Left = 440
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 288
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 384
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   F.*,U.NOME,C.NOME,C.CODCENTROCUSTO,T.DESCRICAO,I.MOESIGLA'
      'FROM'
      
        '   FLUXOORCADO F, UNIDNEGOCIO U, CENTRESPON C, TIPORECEBDESEMB T' +
        ', MOEDA I'
      'WHERE'
      
        '   T.CODTIPRECDES = F.CODTIPRECDES AND T.RECPAG = F.RECPAG AND I' +
        '.MOECODIGO(+) = F.MOECODIGO'
      
        '   AND T.IDPESSOA = F.IDPESSOA AND U.UNIDNEGOC = F.UNIDNEGOC AND' +
        ' U.IDPESSOA = F.IDPESSOA'
      
        '   AND C.CODCENTRORESPON = F.CODCENTRORESPON AND C.IDPESSOA = F.' +
        'IDPESSOA'
      ' ')
    Left = 368
    Top = 184
  end
  object qryCentroRespon: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from centrespon')
    ValidateWithMask = True
    Left = 368
    Top = 64
  end
  object qryUnidNegoc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * from unidnegocio')
    ValidateWithMask = True
    Left = 144
    Top = 64
  end
  object qryTipoRD: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TRD.CODTIPRECDES,'
      '   TRD.RECPAG,'
      '   TRD.DESCRICAO'
      'FROM'
      '   TIPORECEBDESEMB TRD'
      'WHERE'
      '   (TRD.ANASINT = '#39'A'#39') AND'
      '   (TRD.IDPESSOA = :IDPessoa) AND'
      '   ((TRD.CODTIPRECDES IN (SELECT CODTIPRECDES'
      '                          FROM TRDXCRESPON'
      
        '                          WHERE (RTrim(CODCENTRORESPON) = :CodCe' +
        'ntroRespon ) AND'
      '                                (IDPESSOA= :IDPessoa ) AND'
      '                                (RECPAG=TRD.RECPAG))) OR '
      '    NOT EXISTS(SELECT *'
      '               FROM TRDXCRESPON'
      
        '               WHERE (RTrim(CODCENTRORESPON) = :CodCentroRespon ' +
        ') AND'
      '                     (IDPESSOA= :IDPessoa)))'
      'ORDER BY RECPAG,DESCRICAO')
    ValidateWithMask = True
    Left = 144
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'CodCentroRespon'
        ParamType = ptInput
        Value = 'Teste'
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CodCentroRespon'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end>
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from moeda')
    ValidateWithMask = True
    Left = 240
    Top = 160
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from moeda')
    ValidateWithMask = True
    Left = 224
    Top = 72
  end
  object qryData: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TO_CHAR(SYSDATE, '#39'DD/MM/YYYY'#39') || '#39' 00:00'#39' AS DataCorrente'
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 304
    Top = 136
    object qryDataDATACORRENTE: TStringField
      FieldName = 'DATACORRENTE'
      Size = 16
    end
  end
  object qryDiasBloqueio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DIASBLOQORCCP,'
      '   DIASBLOQORCMP,'
      '   DIASBLOQORCLP,'
      '   DT_CURTOPZ,'
      '   DT_MEDIOPZ,'
      '   DT_LONGOPZ'
      'FROM'
      '   PARAMFINANC'
      'WHERE'
      '   (IDPESSOA = :IDPessoa)')
    ValidateWithMask = True
    Left = 408
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end>
    object qryDiasBloqueioDIASBLOQORCCP: TFloatField
      FieldName = 'DIASBLOQORCCP'
      Origin = 'BASEDADOS.PARAMFINANC.DIASBLOQORCCP'
    end
    object qryDiasBloqueioDIASBLOQORCMP: TFloatField
      FieldName = 'DIASBLOQORCMP'
      Origin = 'BASEDADOS.PARAMFINANC.DIASBLOQORCMP'
    end
    object qryDiasBloqueioDIASBLOQORCLP: TFloatField
      FieldName = 'DIASBLOQORCLP'
      Origin = 'BASEDADOS.PARAMFINANC.DIASBLOQORCLP'
    end
    object qryDiasBloqueioDT_CURTOPZ: TDateTimeField
      FieldName = 'DT_CURTOPZ'
      Origin = 'BASEDADOS.PARAMFINANC.DT_CURTOPZ'
    end
    object qryDiasBloqueioDT_MEDIOPZ: TDateTimeField
      FieldName = 'DT_MEDIOPZ'
      Origin = 'BASEDADOS.PARAMFINANC.DT_MEDIOPZ'
    end
    object qryDiasBloqueioDT_LONGOPZ: TDateTimeField
      FieldName = 'DT_LONGOPZ'
      Origin = 'BASEDADOS.PARAMFINANC.DT_LONGOPZ'
    end
  end
  object qryTipoDocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'From TipoDocRecPag'
      'Where (RECPAG= :RecPag)'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'RecPag'
        ParamType = ptInput
      end>
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PT.IDPESSOA, P.RAZAOSOCIAL '
      'FROM PESSOA P, PATRO PT'
      'WHERE (P.IDPESSOA = PT.IDPESSOA)'
      'ORDER BY P.RAZAOSOCIAL ')
    ValidateWithMask = True
    Left = 280
    Top = 307
    object qryPatroRAZAOSOCIAL: TStringField
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PATRO.IDPESSOA'
      Visible = False
    end
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PlanPrevContabil'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 280
    Top = 259
    object qryPlanoPrevNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = '"PLANPREV".NOME'
      Size = 50
    end
    object qryPlanoPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = '"PLANPREV".IDPLANOPREV'
      Visible = False
    end
  end
end
