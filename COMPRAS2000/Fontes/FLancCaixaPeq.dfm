inherited FrmLancCaixaPeq: TFrmLancCaixaPeq
  Left = 13
  Top = 87
  Caption = 'Lançamento de Caixa Pequeno'
  ClientHeight = 404
  ClientWidth = 756
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 756
    Height = 318
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 86
      Height = 13
      Caption = 'Caixa Pequeno'
    end
    object Label2: TLabel
      Left = 496
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Data'
    end
    object Label3: TLabel
      Left = 624
      Top = 9
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Label5: TLabel
      Left = 352
      Top = 9
      Width = 101
      Height = 13
      Caption = 'Nº do Documento'
    end
    object Label6: TLabel
      Left = 352
      Top = 52
      Width = 51
      Height = 13
      Caption = 'Histórico'
    end
    object Label7: TLabel
      Left = 16
      Top = 208
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label8: TLabel
      Left = 16
      Top = 112
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object Label9: TLabel
      Left = 352
      Top = 160
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object Label10: TLabel
      Left = 16
      Top = 160
      Width = 116
      Height = 13
      Caption = 'Tipo de Desembolso'
    end
    object lblSubConta: TLabel
      Left = 16
      Top = 256
      Width = 60
      Height = 13
      Caption = 'Sub-Conta'
    end
    object btnSCI: TSpeedButton
      Left = 308
      Top = 55
      Width = 29
      Height = 23
      Hint = 'Seleciona SCI'
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSCIClick
    end
    object btnApaga: TSpeedButton
      Left = 308
      Top = 78
      Width = 29
      Height = 23
      Hint = 'Remove a Seleção da SCI'
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000012000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888000000888888078888888888000000888880D078888888880000008888
        0DD507888888880000008880DD705078888888000000880DD7DD050788888800
        000080DD7DDDD05078888800000080D7DDDDDD05078888000000807DDDDDDDD0
        607888000000880DDDDDDDDD0607880000008880DDDDDDD7E060780000008888
        0DDDDD7E6E0608000000888880DDD7E6E6E0080000008888880D7E6E6E6E0800
        000088888880E6E6E6E088000000888888880E6E6E08880000008888888880E6
        E0888800000088888888880E0888880000008888888888808888880000008888
        88888888888888000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnApagaClick
    end
    object Label11: TLabel
      Left = 200
      Top = 112
      Width = 54
      Height = 13
      Caption = 'Programa'
    end
    object dblcCaixaPeq: TCMDBLookupCombo
      Left = 16
      Top = 25
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCAIXAPEQ'#9'60'#9'Descrição'#9'No')
      DataField = 'IDCAIXAPEQUENO'
      DataSource = ds
      LookupTable = qryCP
      LookupField = 'IDCAIXAPEQUENO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edDatalanc: TCMDateTimePicker
      Left = 496
      Top = 25
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATALANC'
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
      TabOrder = 2
    end
    object edValLanc: TDBRealEdit
      Left = 624
      Top = 25
      Width = 113
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0.00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRLANC'
      DataSource = ds
    end
    object cmpContab: TCMProcuraMaskContabil
      Left = 352
      Top = 207
      Width = 385
      Height = 86
      Caption = ' Conta Contábil '
      TabOrder = 10
      OnExit = cmpContabExit
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'PLACONTA'
      Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
      Mensagens.NaoExiste = 'Conta Contábil não existe'
      Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
      Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      Mascara = '9.9.9.9.99.99.99'
      Plano = 2
      Status = scSoAtiva
    end
    object edNumDoc: TDBEdit
      Left = 352
      Top = 25
      Width = 137
      Height = 21
      DataField = 'NODOCUMENTO'
      DataSource = ds
      TabOrder = 1
    end
    object memHist: TDBMemo
      Left = 352
      Top = 68
      Width = 385
      Height = 85
      DataField = 'HISTLANCAMENTO'
      DataSource = ds
      MaxLength = 200
      TabOrder = 4
    end
    object dblcCentResp: TCMDBLookupCombo
      Left = 16
      Top = 224
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      DataField = 'CODCENTRORESPON'
      DataSource = ds
      LookupTable = qryCentResp
      LookupField = 'CODCENTRORESPON'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcCentCust: TCMDBLookupCombo
      Left = 16
      Top = 128
      Width = 169
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      DataField = 'CODCENTROCUSTO'
      DataSource = ds
      LookupTable = qryCentCust
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcUnNegoc: TCMDBLookupCombo
      Left = 352
      Top = 176
      Width = 385
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      DataField = 'UNIDNEGOC'
      DataSource = ds
      LookupTable = qryUnNegoc
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcTipoRecDeb: TCMDBLookupCombo
      Left = 16
      Top = 176
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição')
      DataField = 'CODTIPRECDES'
      DataSource = ds
      LookupTable = qryTipoRecDeb
      LookupField = 'CODTIPRECDES'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcTipoRecDebCloseUp
    end
    object dblcSubConta: TwwDBLookupCombo
      Left = 16
      Top = 272
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMESUBCONTA'#9'60'#9'Descrição')
      DataField = 'CODSUBCONTA'
      DataSource = ds
      LookupTable = qrySubConta
      LookupField = 'CODSUBCONTA'
      Options = [loTitles]
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object memSCI: TMemo
      Left = 16
      Top = 55
      Width = 291
      Height = 45
      TabStop = False
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'SCI Nº   :'
        'ARTIGO :')
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object dblcPrograma: TCMDBLookupCombo
      Left = 200
      Top = 128
      Width = 137
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCPROGRAMA'#9'30'#9'Descrição'
        'CODPROGRAMA'#9'2'#9'Código')
      LookupTable = qryPrograma
      LookupField = 'IDPROGRAMA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 756
    object Label4: TLabel [0]
      Left = 595
      Top = 19
      Width = 19
      Height = 13
      Caption = 'Nº '
    end
    object edId: TDBEdit
      Left = 616
      Top = 16
      Width = 129
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'IDLANCCXPEQ'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 365
    Width = 756
    inherited tb97Fundo: TToolbar97
      Left = 586
      DockPos = 586
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 418
      DockPos = 418
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      L.IDLANCCXPEQ,'
      '      L.IDEMPRESA,'
      '      L.CODCENTROCUSTO,'
      '      L.CODSUBCONTA,'
      '      L.IDPESSOA,'
      '      L.PLANO,'
      '      L.PLACONTA,'
      '      L.CODCENTRORESPON,'
      '      L.UNIDNEGOC,'
      '      L.RECPAG,'
      '      L.CODTIPRECDES,'
      '      L.IDITEMSOLI,'
      '      L.IDCAIXAPEQUENO,'
      '      L.NODOCUMENTO,'
      '      L.DATALANC,'
      '      L.VLRLANC,'
      '      L.HISTLANCAMENTO,'
      '      P.DESCPROD,'
      '      I.NUMSOLCOMPRA,'
      '      I.CODARTIGO'
      'FROM'
      '      LANCCAIXAPEQ L,'
      '      ITEMSOLI I,'
      '      PRODUTO P'
      'WHERE'
      '        (L.IDLANCCXPEQ = :pIDLANCCXPEQ)'
      '    AND (I.IDITEMSOLI(+) = L.IDITEMSOLI)'
      '    AND (SUBSTR(I.CODARTIGO,1,6) = P.CODPRODUTO(+))')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDLANCCXPEQ'
        ParamType = ptUnknown
      end>
    object qryIDLANCCXPEQ: TFloatField
      FieldName = 'IDLANCCXPEQ'
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
    end
    object qryIDCAIXAPEQUENO2: TFloatField
      FieldName = 'IDCAIXAPEQUENO'
    end
    object qryNODOCUMENTO: TStringField
      FieldName = 'NODOCUMENTO'
    end
    object qryDATALANC: TDateTimeField
      FieldName = 'DATALANC'
    end
    object qryVLRLANC: TFloatField
      FieldName = 'VLRLANC'
    end
    object qryHISTLANCAMENTO: TStringField
      FieldName = 'HISTLANCAMENTO'
      Size = 200
    end
    object qryDESCPROD: TStringField
      FieldName = 'DESCPROD'
      Size = 40
    end
    object qryNUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
    end
    object qryCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65531
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCCAIXAPEQ'
      'set'
      '  IDLANCCXPEQ = :IDLANCCXPEQ,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  IDITEMSOLI = :IDITEMSOLI,'
      '  IDCAIXAPEQUENO = :IDCAIXAPEQUENO,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  DATALANC = :DATALANC,'
      '  VLRLANC = :VLRLANC,'
      '  HISTLANCAMENTO = :HISTLANCAMENTO'
      'where'
      '  IDLANCCXPEQ = :OLD_IDLANCCXPEQ')
    InsertSQL.Strings = (
      'insert into LANCCAIXAPEQ'
      '  (IDLANCCXPEQ, IDEMPRESA, CODCENTROCUSTO, CODSUBCONTA, '
      'IDPESSOA, PLANO, '
      '   PLACONTA, CODCENTRORESPON, UNIDNEGOC, RECPAG, CODTIPRECDES, '
      'IDITEMSOLI, '
      '   IDCAIXAPEQUENO, NODOCUMENTO, DATALANC, VLRLANC, '
      'HISTLANCAMENTO)'
      'values'
      '  (:IDLANCCXPEQ, :IDEMPRESA, :CODCENTROCUSTO, :CODSUBCONTA, '
      ':IDPESSOA, '
      '   :PLANO, :PLACONTA, :CODCENTRORESPON, :UNIDNEGOC, :RECPAG, '
      ':CODTIPRECDES, '
      
        '   :IDITEMSOLI, :IDCAIXAPEQUENO, :NODOCUMENTO, :DATALANC, :VLRLA' +
        'NC, '
      ':HISTLANCAMENTO)')
    DeleteSQL.Strings = (
      'delete from LANCCAIXAPEQ'
      'where'
      '  IDLANCCXPEQ = :OLD_IDLANCCXPEQ')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LANCCAIXAPEQ.IDLANCCXPEQ'
      'LANCCAIXAPEQ.NODOCUMENTO'
      'CAIXAPEQUENO.DESCCAIXAPEQ'
      'LANCCAIXAPEQ.DATALANC'
      'LANCCAIXAPEQ.VLRLANC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Nº do Lançamentto'
      'Nº do Documento'
      'Caixa Pequeno'
      'Data'
      'Valor')
    Tabelas.Strings = (
      'LANCCAIXAPEQ'
      'CAIXAPEQUENO'
      'USUARIOXCAIXAPEQ')
    CamposChave.Strings = (
      'LANCCAIXAPEQ.IDLANCCXPEQ')
    Filtro.Strings = (
      'LANCCAIXAPEQ.IDBORDEROCXPEQ IS NULL'
      'CAIXAPEQUENO.IDCAIXAPEQUENO = USUARIOXCAIXAPEQ.IDCAIXAPEQUENO'
      'CAIXAPEQUENO.IDCAIXAPEQUENO = LANCCAIXAPEQ.IDCAIXAPEQUENO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '10'
      '20'
      '60'
      '10'
      '10')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  object qryCP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CP.IDCAIXAPEQUENO,'
      '      CP.IDFORCLI,'
      '      CP.DESCCAIXAPEQ,'
      '      CP.VLRMAXLANC,'
      '      CP.VLRTOTCAIXAPEQ'
      'FROM'
      '      CAIXAPEQUENO CP,'
      '      USUARIOXCAIXAPEQ UXC'
      'WHERE'
      '        (UXC.IDUSUARIO = :pIDUSUARIO)'
      '    AND (CP.IDPESSOA = :pIDPESSOA)'
      '    AND (UXC.IDCAIXAPEQUENO = CP.IDCAIXAPEQUENO)'
      'ORDER BY CP.DESCCAIXAPEQ')
    ValidateWithMask = True
    Left = 551
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDESCCAIXAPEQ: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCCAIXAPEQ'
      Origin = 'CAIXAPEQUENO.DESCCAIXAPEQ'
      Size = 60
    end
    object qryIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Origin = 'CAIXAPEQUENO.IDFORCLI'
      Visible = False
    end
    object qryVLRMAXLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMAXLANC'
      Origin = 'CAIXAPEQUENO.VLRMAXLANC'
      Visible = False
    end
    object qryIDCAIXAPEQUENO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCAIXAPEQUENO'
      Origin = 'CAIXAPEQUENO.IDCAIXAPEQUENO'
      Visible = False
    end
    object qryCPVLRTOTCAIXAPEQ: TFloatField
      FieldName = 'VLRTOTCAIXAPEQ'
      Origin = '"CM.CAIXAPEQUENO".VLRTOTCAIXAPEQ'
    end
  end
  object qryCentCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CC.CODCENTROCUSTO,'
      '     CC.NOME'
      'FROM'
      '     CENTCUST CC'
      'WHERE'
      '       (CC.STATUSGRUPOCDC = '#39'A'#39')'
      '   AND (CC.ATIVO = '#39'S'#39')'
      '   AND (CC.IDEMPRESA = :IDPESSOA)'
      'ORDER BY 2'
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCentCustCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object qryCentCustNOME: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object qryCentResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODCENTRORESPON,'
      '      NOME'
      'FROM'
      '      CENTRESPON'
      'WHERE'
      '        (IDPESSOA = :pIDPESS)'
      '    AND (ANALITICOSINTET = '#39'A'#39')'
      '    AND (ATIVO = '#39'S'#39')'
      'ORDER BY 2  ')
    ValidateWithMask = True
    Left = 152
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
    object qryCentRespCODCENTRORESPON: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Size = 10
    end
    object qryCentRespNOME: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
  end
  object qryUnNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            UNIDNEGOC,'
      '            NOME'
      'FROM'
      '           UNIDNEGOCIO'
      'WHERE'
      '           (IDPESSOA = :pIDPESSOA) AND'
      '           (UNETIPO = '#39'A'#39') '
      'ORDER BY 2  ')
    ValidateWithMask = True
    Left = 16
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryUnNegocUNIDNEGOC: TFloatField
      DisplayLabel = 'Código'
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
    end
    object qryUnNegocNOME: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
  end
  object qryTipoRecDeb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODTIPRECDES,'
      '      DESCRICAO,'
      '      PLACONTA'
      'FROM'
      '    TIPORECEBDESEMB'
      'WHERE'
      '        (ANASINT  = '#39'A'#39')'
      '    AND (RECPAG   = '#39'P'#39')'
      '    AND (IDPESSOA = :pIDPESSOA)'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 224
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryTipoRecDebDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTipoRecDebCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryTipoRecDebPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'TIPORECEBDESEMB.PLACONTA'
      Visible = False
      Size = 18
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        NOMESUBCONTA,'
      '        CODSUBCONTA '
      'FROM'
      '        SUBCONTA '
      'WHERE '
      '        (IDPESSOA = :pIDPESS) '
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 298
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
    object qrySubContaNOMESUBCONTA: TStringField
      DisplayLabel = 'Descriçao'
      FieldName = 'NOMESUBCONTA'
      Origin = 'SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qrySubContaCODSUBCONTA: TFloatField
      DisplayLabel = 'Código'
      FieldName = 'CODSUBCONTA'
      Origin = 'SUBCONTA.CODSUBCONTA'
    end
  end
  object msSCI: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ITEMSOLI.NUMSOLCOMPRA'
      'ARTIGO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'ITEMSOLI.QTDEPEDIDA'
      'ITEMSOLI.QTDEPENDENTE')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Nº da SCI'
      'Código do Artigo'
      'Descrição do Artigo'
      'Quantidade Pedida'
      'Quantidade Pendente')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ITEMSOLI'
      'ARTIGO'
      'PRODUTO'
      'SOLICOMP')
    CamposChave.Strings = (
      'ITEMSOLI.NUMSOLCOMPRA'
      'ITEMSOLI.CODARTIGO'
      'PRODUTO.DESCPROD'
      'SOLICOMP.CODCENTROCUSTO'
      'SOLICOMP.CODCENTRORESPON'
      'SOLICOMP.UNIDNEGOC'
      'ITEMSOLI.IDITEMSOLI')
    Filtro.Strings = (
      'SOLICOMP.CUSTOESTOQUE = '#39'C'#39
      'ITEMSOLI.QTDEPENDENTE > 0'
      'ITEMSOLI.CODARTIGO = ARTIGO.CODARTIGO'
      'ITEMSOLI.NUMSOLCOMPRA = SOLICOMP.NUMSOLCOMPRA'
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO'
      'ITEMSOLI.IDCOMPRADOR IS NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '#,####0.0000'
      '#,####0.0000')
    Larguras.Strings = (
      '10'
      '14'
      '40'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 640
    Top = 9
  end
  object qrySCI: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      NUMSOLCOMPRA,'
      '      CODARTIGO,'
      '      QTDEPEDIDA,'
      '      QTDEPENDENTE,'
      '      SALDOACOMPRAR,'
      '      IDITEMSOLI'
      'FROM'
      '      ITEMSOLI'
      'WHERE'
      '       (IDITEMSOLI = :pIDITEMSOLI)'
      '')
    UpdateObject = updSCI
    ValidateWithMask = True
    Left = 496
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDITEMSOLI'
        ParamType = ptUnknown
      end>
    object qrySCINUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
    end
    object qrySCICODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qrySCIQTDEPEDIDA: TFloatField
      FieldName = 'QTDEPEDIDA'
    end
    object qrySCIQTDEPENDENTE: TFloatField
      FieldName = 'QTDEPENDENTE'
    end
    object qrySCISALDOACOMPRAR: TFloatField
      FieldName = 'SALDOACOMPRAR'
    end
    object qrySCIIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
      Origin = 'ITEMSOLI.IDITEMSOLI'
    end
  end
  object updSCI: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMSOLI'
      'set'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  CODARTIGO = :CODARTIGO,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  QTDEPENDENTE = :QTDEPENDENTE,'
      '  SALDOACOMPRAR = :SALDOACOMPRAR,'
      '  IDITEMSOLI = :IDITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    InsertSQL.Strings = (
      'insert into ITEMSOLI'
      '  (NUMSOLCOMPRA, CODARTIGO, QTDEPEDIDA, QTDEPENDENTE, '
      'SALDOACOMPRAR, IDITEMSOLI)'
      'values'
      '  (:NUMSOLCOMPRA, :CODARTIGO, :QTDEPEDIDA, :QTDEPENDENTE, '
      ':SALDOACOMPRAR, '
      '   :IDITEMSOLI)')
    DeleteSQL.Strings = (
      'delete from ITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    Left = 457
    Top = 8
  end
  object updSCIAnt: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMSOLI'
      'set'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  CODARTIGO = :CODARTIGO,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  QTDEPENDENTE = :QTDEPENDENTE,'
      '  SALDOACOMPRAR = :SALDOACOMPRAR,'
      '  IDITEMSOLI = :IDITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    InsertSQL.Strings = (
      'insert into ITEMSOLI'
      
        '  (NUMSOLCOMPRA, CODARTIGO, QTDEPEDIDA, QTDEPENDENTE, SALDOACOMP' +
        'RAR, IDITEMSOLI)'
      'values'
      
        '  (:NUMSOLCOMPRA, :CODARTIGO, :QTDEPEDIDA, :QTDEPENDENTE, :SALDO' +
        'ACOMPRAR, '
      '   :IDITEMSOLI)')
    DeleteSQL.Strings = (
      'delete from ITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    Left = 457
    Top = 40
  end
  object qrySCIAnt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      NUMSOLCOMPRA,'
      '      CODARTIGO,'
      '      QTDEPEDIDA,'
      '      QTDEPENDENTE,'
      '      SALDOACOMPRAR,'
      '      IDITEMSOLI'
      'FROM'
      '      ITEMSOLI'
      'WHERE'
      '       (IDITEMSOLI = :pIDITEMSOLI)')
    UpdateObject = updSCIAnt
    ValidateWithMask = True
    Left = 592
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDITEMSOLI'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'NUMSOLCOMPRA'
    end
    object StringField1: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object FloatField2: TFloatField
      FieldName = 'QTDEPEDIDA'
    end
    object FloatField3: TFloatField
      FieldName = 'QTDEPENDENTE'
    end
    object FloatField4: TFloatField
      FieldName = 'SALDOACOMPRAR'
    end
    object qrySCIAntIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
      Origin = 'ITEMSOLI.IDITEMSOLI'
    end
  end
  object qryPrograma: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDPROGRAMA,'
      '      CODPROGRAMA,'
      '      DESCPROGRAMA'
      'FROM'
      '      PROGRAMA'
      'ORDER BY 3  ')
    ValidateWithMask = True
    Left = 376
    Top = 353
    object qryProgramaDESCPROGRAMA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCPROGRAMA'
      Origin = 'PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object qryProgramaCODPROGRAMA: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 2
      FieldName = 'CODPROGRAMA'
      Origin = 'PROGRAMA.CODPROGRAMA'
      Size = 2
    end
    object qryProgramaIDPROGRAMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROGRAMA'
      Origin = 'PROGRAMA.IDPROGRAMA'
      Visible = False
    end
  end
end
