inherited frmExecEntradaManual: TfrmExecEntradaManual
  Left = 232
  Top = 126
  HelpContext = 150030
  Caption = 'Entrada Manual de Cobranças e Devoluções'
  ClientHeight = 374
  ClientWidth = 618
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 618
    Height = 306
    object Label1: TLabel
      Left = 208
      Top = 98
      Width = 25
      Height = 13
      Caption = 'Item'
    end
    object Label5: TLabel
      Left = 288
      Top = 178
      Width = 44
      Height = 13
      Caption = 'Parcela'
    end
    object Label12: TLabel
      Left = 208
      Top = 138
      Width = 78
      Height = 13
      Caption = 'Data Prevista'
    end
    object Label7: TLabel
      Left = 496
      Top = 138
      Width = 80
      Height = 13
      Caption = 'Valor Previsto'
    end
    object Label14: TLabel
      Left = 328
      Top = 138
      Width = 98
      Height = 13
      Caption = 'Data Vencimento'
    end
    object Label2: TLabel
      Left = 368
      Top = 178
      Width = 64
      Height = 13
      Caption = 'Seqüencial'
    end
    object Label3: TLabel
      Left = 448
      Top = 178
      Width = 43
      Height = 13
      Caption = 'Restam'
    end
    object Label4: TLabel
      Left = 16
      Top = 226
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object lblParcelaAlt: TLabel
      Left = 208
      Top = 178
      Width = 71
      Height = 13
      Caption = 'Parcela (Alt)'
    end
    object Label6: TLabel
      Left = 528
      Top = 178
      Width = 49
      Height = 13
      Caption = 'Tx.Juros'
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 598
      inherited edtNome: TEdit
        Width = 345
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 544
        OnClick = molContratoEmptmobtnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 568
        OnClick = molContratoEmptmobtnLimpaContratoClick
      end
    end
    object rdgTipo: TRadioGroup
      Left = 208
      Top = 56
      Width = 185
      Height = 33
      Caption = ' Tipo '
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Cobrar'
        'Devolver')
      TabOrder = 2
      OnClick = rdgTipoClick
    end
    object rdgEvento: TRadioGroup
      Left = 16
      Top = 56
      Width = 169
      Height = 157
      Caption = ' Movimento '
      ItemIndex = 0
      Items.Strings = (
        'Prestação'
        'Encargos'
        'Valor não Programado'
        'Abatimento do Saldo'
        'Incorporação ao Saldo')
      TabOrder = 1
      OnClick = rdgEventoClick
    end
    object DBcboItem: TwwDBLookupCombo
      Left = 208
      Top = 112
      Width = 393
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ITEDESCRICAO'#9'40'#9'ITEDESCRICAO'#9'F')
      DataField = 'IDITEMEMPTMO'
      DataSource = ds
      LookupTable = qryLookItem
      LookupField = 'IDITEMEMPTMO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbsParcela: TwwDBSpinEdit
      Left = 288
      Top = 192
      Width = 65
      Height = 21
      Increment = 1
      DataField = 'HMEPARCELA'
      DataSource = ds
      TabOrder = 9
      UnboundDataType = wwDefault
    end
    object DBedtDataPrevista: TCMDateTimePicker
      Left = 208
      Top = 152
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HMEDATAPREVISTA'
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
      TabOrder = 5
      OnEnter = DBedtDataPrevistaEnter
      OnExit = DBedtDataPrevistaExit
    end
    object dbeValorPrevisto: TwwDBEdit
      Left = 496
      Top = 152
      Width = 105
      Height = 21
      DataField = 'HMEVLRPREVISTO'
      DataSource = ds
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object CMDateTimePicker1: TCMDateTimePicker
      Left = 328
      Top = 152
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HMEDATAVENCTO'
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
      TabOrder = 6
    end
    object dbsSeq: TwwDBSpinEdit
      Left = 368
      Top = 192
      Width = 65
      Height = 21
      Increment = 1
      DataField = 'HMESEQCOBRANCA'
      DataSource = ds
      TabOrder = 10
      UnboundDataType = wwDefault
    end
    object DBrdgFormaCobranca: TDBRadioGroup
      Left = 408
      Top = 56
      Width = 193
      Height = 33
      Caption = ' Forma de Cobrança '
      Columns = 2
      DataField = 'HMEFORMACOBRANCA'
      DataSource = ds
      Items.Strings = (
        'Folha'
        'Financeiro')
      TabOrder = 3
      Values.Strings = (
        'F'
        'C')
    end
    object wwDBSpinEdit1: TwwDBSpinEdit
      Left = 448
      Top = 192
      Width = 65
      Height = 21
      Increment = 1
      DataField = 'HMENUMPARCELAS'
      DataSource = ds
      TabOrder = 11
      UnboundDataType = wwDefault
    end
    object DBmemObs: TDBRichEdit
      Left = 16
      Top = 240
      Width = 585
      Height = 49
      DataField = 'HMEOBSERVACAO'
      DataSource = ds
      ScrollBars = ssBoth
      TabOrder = 13
    end
    object DBspnParcelaAlt: TwwDBSpinEdit
      Left = 208
      Top = 192
      Width = 65
      Height = 21
      Increment = 1
      DataField = 'HMEPARCELAALT'
      DataSource = ds
      TabOrder = 8
      UnboundDataType = wwDefault
    end
    object wwDBEdit1: TwwDBEdit
      Left = 528
      Top = 192
      Width = 73
      Height = 21
      DataField = 'HMETXJUROS'
      DataSource = ds
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 618
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 363
        Width = 17
      end
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 618
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEPARCELA = :HMEPARCELA,'
      '  HMEPARCELAALT = :HMEPARCELAALT,'
      '  HMENUMPARCELAS = :HMENUMPARCELAS,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  HMEORIGEM = :HMEORIGEM,'
      '  HMEFORMACOBRANCA = :HMEFORMACOBRANCA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMEDATA = :HMEDATA,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEDATAEFETIVA = :HMEDATAPREVISTA,'
      '  HMEDATAATUALIZA = :HMEDATAATUALIZA,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMEANOCOBRANCA = :HMEANOCOBRANCA,'
      '  HMEMESCOBRANCA = :HMEMESCOBRANCA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMEVLREFETIVO = :HMEVLRPREVISTO,'
      '  HMECENTRALIZA = :HMECENTRALIZA,'
      '  HMEDESTACADO = :HMEDESTACADO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMEDATAVENCTO = :HMEDATAVENCTO,'
      '  HMETIPOFOLHA = :HMETIPOFOLHA,'
      '  HMERECPAG = :HMERECPAG,'
      '  FLGBAIXADO = :FLGBAIXADO,'
      '  FLGENVIO = :FLGENVIO,'
      '  VERSAO = :VERSAO,'
      '  FLGENTRADAMANUAL = :FLGENTRADAMANUAL,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  HMEOBSERVACAO = :HMEOBSERVACAO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      '  (IDHISTMOVEMPTMO, IDCONTRATOEMPTMO, IDITEMEMPTMO, '
      'HMEPARCELA, HMEPARCELAALT, '
      '   HMENUMPARCELAS, HMETIPOMOV, HMEORIGEM, HMEFORMACOBRANCA, '
      'HMESEQCOBRANCA, '
      '   HMEDATA, HMEDATAPREVISTA, HMEDATAEFETIVA, HMEDATAATUALIZA, '
      'HMEANOCOMPETENCIA, '
      '   HMEMESCOMPETENCIA, HMEANOCOBRANCA, HMEMESCOBRANCA, '
      'HMEVLRPREVISTO, HMEVLREFETIVO, '
      '   HMECENTRALIZA, HMEDESTACADO, HMESALDODEV, HMEDATAVENCTO, '
      'HMETIPOFOLHA, '
      '   HMERECPAG, FLGBAIXADO, FLGENVIO, VERSAO, FLGENTRADAMANUAL, '
      'HMETXJUROS, '
      '   HMEOBSERVACAO)'
      'values'
      '  (:IDHISTMOVEMPTMO, :IDCONTRATOEMPTMO, :IDITEMEMPTMO, '
      ':HMEPARCELA, :HMEPARCELAALT, '
      '   :HMENUMPARCELAS, :HMETIPOMOV, :HMEORIGEM, :HMEFORMACOBRANCA, '
      ':HMESEQCOBRANCA, '
      
        '   :HMEDATA, :HMEDATAPREVISTA, :HMEDATAEFETIVA, :HMEDATAATUALIZA' +
        ', '
      ':HMEANOCOMPETENCIA, '
      '   :HMEMESCOMPETENCIA, :HMEANOCOBRANCA, :HMEMESCOBRANCA, '
      ':HMEVLRPREVISTO, '
      '   :HMEVLREFETIVO, :HMECENTRALIZA, :HMEDESTACADO, :HMESALDODEV, '
      ':HMEDATAVENCTO, '
      '   :HMETIPOFOLHA, :HMERECPAG, :FLGBAIXADO, :FLGENVIO, :VERSAO, '
      ':FLGENTRADAMANUAL, '
      '   :HMETXJUROS, :HMEOBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'CNT.IDCONTRATOEMPTMO'
      'DEP.MATRICULA'
      'HME.HMEDATAVENCTO'
      'HME.HMEVLRPREVISTO'
      'HME.IDITEMEMPTMO'
      'ITE.ITEDESCRICAO'
      'PES.NOME'
      'HME.IDHISTMOVEMPTMO')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'N'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Contrato'
      'Matrícula'
      'Data Vencto.'
      'Valor'
      'Nº Item'
      'Item'
      'Mutuário'
      'Chave')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTMOVEMPTMO  HME'
      'CONTRATOEMPTMO CNT'
      'DEPENTIT       DEP'
      'PESSOA         PES'
      'ITEMEMPTMO     ITE')
    CamposChave.Strings = (
      'HME.IDHISTMOVEMPTMO'
      'CNT.IDCONTRATOEMPTMO'
      'DEP.MATRICULA'
      'HME.HMEDATAVENCTO'
      'HME.HMEVLRPREVISTO'
      'HME.IDITEMEMPTMO'
      'ITE.ITEDESCRICAO'
      'PES.NOME'
      'CNT.IDBENEF')
    Filtro.Strings = (
      'HME.FLGENTRADAMANUAL     = 1'
      '(HME.FLGBAIXADO          = 0 OR HME.HMECENTRALIZA = 0)'
      'NVL(HME.FLGESTORNADO, 0) = 0'
      'CNT.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO'
      'CNT.IDBENEF              = PES.IDPESSOA'
      'CNT.IDBENEF              = DEP.IDPESSOA'
      'CNT.IDPESSOA             = DEP.IDTITULAR'
      'HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO')
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
      '15'
      '13'
      '10'
      '13'
      '5'
      '15'
      '45'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
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
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 568
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 953
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 496
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDHISTMOVEMPTMO,'
      '   IDCONTRATOEMPTMO,'
      '   IDITEMEMPTMO,'
      ''
      '   HMEPARCELA, HMEPARCELAALT, HMENUMPARCELAS,'
      ''
      '   HMETIPOMOV,'
      '   HMEORIGEM,'
      '   HMEFORMACOBRANCA,'
      '   HMESEQCOBRANCA,'
      '   HMEDATA,'
      '   HMEDATAPREVISTA,'
      '   HMEDATAEFETIVA,'
      '   HMEDATAATUALIZA,'
      '   HMEANOCOMPETENCIA,'
      '   HMEMESCOMPETENCIA,'
      '   HMEANOCOBRANCA,'
      '   HMEMESCOBRANCA,'
      '   HMEVLRPREVISTO,'
      '   HMEVLREFETIVO,'
      '   HMECENTRALIZA,'
      '   HMEDESTACADO,'
      '   HMESALDODEV,'
      '   HMEDATAVENCTO,'
      '   HMETIPOFOLHA,'
      '   HMERECPAG,'
      '   FLGBAIXADO,'
      '   FLGENVIO,'
      '   VERSAO,'
      '   FLGENTRADAMANUAL,'
      '   HMETXJUROS,'
      '   HMEOBSERVACAO'
      'FROM'
      '   HISTMOVEMPTMO'
      'WHERE'
      '   IDHISTMOVEMPTMO =:PIDHISTMOVEMPTMO')
    Top = 0
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
    object qryIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDITEMEMPTMO'
    end
    object qryHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEPARCELA'
    end
    object qryHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMETIPOMOV'
    end
    object qryHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEORIGEM'
    end
    object qryHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMESEQCOBRANCA'
    end
    object qryHMEDATA: TDateTimeField
      FieldName = 'HMEDATA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATA'
    end
    object qryHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAPREVISTA'
    end
    object qryHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAATUALIZA'
    end
    object qryHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEANOCOMPETENCIA'
    end
    object qryHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEMESCOMPETENCIA'
    end
    object qryHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEANOCOBRANCA'
    end
    object qryHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEMESCOBRANCA'
    end
    object qryHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
    object qryHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMECENTRALIZA'
    end
    object qryHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDESTACADO'
    end
    object qryHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMESALDODEV'
    end
    object qryHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMENUMPARCELAS'
    end
    object qryHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAVENCTO'
    end
    object qryHMETIPOFOLHA: TStringField
      FieldName = 'HMETIPOFOLHA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMETIPOFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGBAIXADO'
    end
    object qryFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGENVIO'
    end
    object qryVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
    object qryFLGENTRADAMANUAL: TFloatField
      FieldName = 'FLGENTRADAMANUAL'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGENTRADAMANUAL'
    end
    object qryHMEOBSERVACAO: TMemoField
      FieldName = 'HMEOBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLREFETIVO'
    end
    object qryHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAEFETIVA'
    end
    object qryHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMETXJUROS'
      DisplayFormat = '#,#0.00#'
    end
    object qryHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEPARCELAALT'
    end
  end
  object qryLookItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    ITE.IDITEMEMPTMO,'
      '    ITE.ITEDESCRICAO,'
      '    ITC.FLGDESTACADO,'
      '    ITC.FLGCENTRALIZA,'
      '    ITC.ITCTRATASALDODEV'
      'FROM'
      '    CONTRATOEMPTMO CNT,'
      '    ITEMXTIPOCONTR ITC,'
      '    ITEMEMPTMO     ITE'
      'WHERE'
      '       CNT.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND ITC.ITCEVENTO          =:PITCEVENTO'
      '   AND (ITC.FLGDESTACADO      = 1 OR ITC.FLGCENTRALIZA = 1)'
      
        '   AND ((:FLGSALDODEV         IS NULL) OR (ITC.ITCTRATASALDODEV ' +
        '=:FLGSALDODEV))'
      '   AND ITC.IDTIPOCONTREMPTMO  = CNT.IDTIPOCONTREMPTMO'
      '   AND ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 264
    Top = 278
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGSALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGSALDODEV'
        ParamType = ptInput
      end>
    object qryLookItemITEDESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object qryLookItemIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMEMPTMO.IDITEMEMPTMO'
      Visible = False
    end
    object qryLookItemFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGDESTACADO'
      Visible = False
    end
    object qryLookItemFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGCENTRALIZA'
      Visible = False
    end
    object qryLookItemITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCTRATASALDODEV'
    end
  end
end
