inherited frmCadHstMovCota: TfrmCadHstMovCota
  Left = 367
  Top = 275
  HelpContext = 545022
  Caption = 'Movimentações de Ativos'
  ClientHeight = 361
  ClientWidth = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 549
    Height = 275
    inherited dbGrd: TwwDBGrid [0]
      Top = 109
      Width = 547
      Height = 165
      PictureMasks.Strings = (
        'VALOR'#9'R$ 9.999.999,99'#9'T'#9'T')
      Selected.Strings = (
        'DESCATIVO'#9'40'#9'Ativo'#9'F'
        'DESCTIPOOPER'#9'40'#9'Receita / Despesa'#9'F'
        'DESCPLANO'#9'40'#9'Plano'#9'F'
        'DESCPATRO'#9'40'#9'Patro'#9'F'
        'DATA'#9'18'#9'Data'#9'F'
        'VALOR'#9'15'#9'Valor'#9'F')
      TabOrder = 2
    end
    inherited pnlControles: TPanel [1]
      Top = 109
      Width = 547
      Height = 165
      TabOrder = 1
      object Label5: TLabel
        Left = 416
        Top = 18
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Label2: TLabel
        Left = 280
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label1: TLabel
        Left = 16
        Top = 18
        Width = 108
        Height = 13
        Caption = 'Receita / Despesa'
      end
      object edValor: TDBRealEdit
        Left = 416
        Top = 32
        Width = 105
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '500.000,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALOR'
        DataSource = ds
      end
      object edData: TCMDateTimePicker
        Left = 280
        Top = 32
        Width = 96
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
        OnCloseUp = edDataCloseUp
        OnExit = cmbAtivosExit
      end
      object cmbRecDes: TCMDBLookupCombo
        Left = 16
        Top = 32
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPER'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsCotatipoOper
        LookupField = 'IDCOTATIPOOPER'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object pnlCriterios: TPanel
      Left = 1
      Top = 1
      Width = 547
      Height = 108
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label3: TLabel
        Left = 16
        Top = 58
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label4: TLabel
        Left = 272
        Top = 58
        Width = 31
        Height = 13
        Caption = 'Patro'
      end
      object Label10: TLabel
        Left = 16
        Top = 10
        Width = 30
        Height = 13
        Caption = 'Ativo'
      end
      object Label6: TLabel
        Left = 272
        Top = 10
        Width = 111
        Height = 13
        Caption = 'Lote de Importação'
        Visible = False
      end
      object cmbPlano: TCMDBLookupCombo
        Left = 16
        Top = 72
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPLANO'#9'30'#9'Descrição'#9'F')
        LookupTable = CdsPlano
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmbPlanoCloseUp
        OnEnter = cmbPlanoEnter
      end
      object cmbPatro: TCMDBLookupCombo
        Left = 272
        Top = 72
        Width = 242
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = CdsPatro
        LookupField = 'IDPATRO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmbPlanoCloseUp
        OnEnter = cmbPatroEnter
        OnExit = cmbAtivosExit
      end
      object cmbAtivos: TCMDBLookupCombo
        Left = 16
        Top = 24
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsAtivos
        LookupField = 'IDATIVOCOTA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmbPlanoCloseUp
        OnExit = cmbAtivosExit
      end
      object edLote: TEdit
        Left = 272
        Top = 24
        Width = 191
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
      object btProcuraLote: TBitBtn
        Left = 463
        Top = 22
        Width = 26
        Height = 25
        Hint = 'Procurar movimentação por lote'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        OnClick = btProcuraLoteClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
      object btLimparLote: TBitBtn
        Left = 489
        Top = 22
        Width = 25
        Height = 25
        Hint = 'Cancela o filtro do lote'
        TabOrder = 5
        Visible = False
        OnClick = btLimparLoteClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888FF8888888888888008888888888888F77F8888888888800F08888
          8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
          88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
          888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
          0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
          03088878F88878F878788887F8888090B03088878F888787878788887888880B
          0B038888788888787878888888888880B0B38888888888878788888888888888
          0BBB88888888888878F888888888888880BB8888888888888788}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock972: TDock97
    Width = 549
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 322
    Width = 549
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 914
    Top = 23
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 864
    Top = 23
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyDelete = CmeCadastroApplyDelete
    Left = 320
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 280
    Top = 0
    object CdsDESCATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 40
      FieldName = 'DESCATIVO'
      Size = 60
    end
    object CdsDESCTIPOOPER: TStringField
      DisplayLabel = 'Receita / Despesa'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPER'
      Size = 60
    end
    object CdsDESCPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 40
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object CdsDESCPATRO: TStringField
      DisplayLabel = 'Patro'
      DisplayWidth = 40
      FieldName = 'DESCPATRO'
      Size = 60
    end
    object CdsDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'DATA'
    end
    object CdsVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOR'
      currency = True
    end
    object CdsIDATIVOCOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDATIVOCOTA'
      Visible = False
    end
    object CdsIDCOTATIPOOPER: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCOTATIPOOPER'
      Visible = False
    end
    object CdsIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object CdsIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object CdsIDHSTMOVCOTA: TFloatField
      FieldName = 'IDHSTMOVCOTA'
      KeyFields = 'IDHSTMOVCOTA'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Movimentação'
    Colunas.Strings = (
      'A.DESCRICAO'
      'T.DESCTIPOOPER'
      'PL.NOME'
      'P.NOME'
      'H.DATA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Ativo'
      'Receita / Despesa'
      'Plano'
      'Patro'
      'Data')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HSTMOVCOTA H'
      'ATIVOCOTA A'
      'COTATIPOOPER T'
      'PLANPREVCONTABIL PL'
      'PESSOA P'
      'PATRO PR')
    CamposChave.Strings = (
      'H.IDHSTMOVCOTA')
    Filtro.Strings = (
      'A.IDATIVOCOTA   =  H.IDATIVOCOTA'
      'T.IDCOTATIPOOPER = H.IDCOTATIPOOPER'
      'PL.IDPLANOPREV   = H.IDPLANOPREV'
      'P.IDPESSOA       = PR.IDPESSOA'
      'PR.IDPESSOA      = H.IDPATRO ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '40'
      '40'
      '18')
    Left = 376
    Top = 0
  end
  object CdsCotatipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 184
  end
  object CdsPlano: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 116
    Data = {
      950100009619E0BD01000000180000000200080000000300000071000B494450
      4C414E4F505245560800040000000000094E4F4D45504C414E4F010049000000
      010005574944544802000200320002000D44454641554C545F4F524445520200
      8200010000000200044C434944040001000908000000000000000000002C401E
      42656E6566ED63696F20446566696E69646F2052464653412F52454645520000
      00000000000046401A4342545520436F6E747269627569E7E36F20446566696E
      6964610000000000000000F03F05434F4D554D0000000000000000444020464C
      554D495452454E5320436F6E747269627569E7E36F20446566696E6964610000
      00000000000008401B4D455452D420436F6E747269627569E7E36F2044656669
      6E69646100000000000000804E401E4D4554524F464F5220436F6E7472696275
      69E7E36F20446566696E696461000000000000008040401B524546455220436F
      6E747269627569E7E36F20446566696E696461000000000000008042401B5246
      46534120436F6E747269627569E7E36F20446566696E696461}
  end
  object CdsAtivos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 68
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 116
  end
  object MontaSelectLote: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona movimentação'
    Colunas.Strings = (
      'TRIM(U.NOMEUSUARIO)'
      'Trunc(H.TRGDTINCLUSAO)'
      'H.IDCOTAIMPORTACAO'
      'A.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Usuário'
      'Data'
      'Lote'
      'Ativo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'USUARIOSISTEMA U'
      'HSTMOVCOTA H'
      'ATIVOCOTA A')
    CamposChave.Strings = (
      'H.IDCOTAIMPORTACAO')
    Filtro.Strings = (
      
        'U.IDUSUARIO = SUBSTR(H.TRGUSERINCLUSAO,3,LENGTH(H.TRGUSERINCLUSA' +
        'O)-2)'
      'A.IDATIVOCOTA = H.IDATIVOCOTA'
      'A.DESCRICAO IS NOT NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '15'
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 464
  end
end
