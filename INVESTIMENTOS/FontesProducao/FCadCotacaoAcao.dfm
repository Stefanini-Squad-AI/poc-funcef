inherited frmCadCotacaoAcao: TfrmCadCotacaoAcao
  Left = 354
  Top = 172
  HelpContext = 790272
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'frmCadCotacaoAcao'
  ClientHeight = 453
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 8
    Top = 162
    Width = 43
    Height = 13
    Caption = 'Máxima'
  end
  object Label6: TLabel [1]
    Left = 8
    Top = 115
    Width = 42
    Height = 13
    Caption = 'Mínima'
  end
  inherited pnlFundo: TPanel
    Width = 402
    Height = 367
    inherited Bevel2: TBevel
      Width = 400
    end
    object Label19: TLabel [1]
      Left = 16
      Top = 57
      Width = 96
      Height = 13
      Caption = 'Bolsa de Valores'
    end
    object Label11: TLabel [2]
      Left = 16
      Top = 97
      Width = 30
      Height = 13
      Caption = 'Ação'
    end
    object Label10: TLabel [3]
      Left = 16
      Top = 137
      Width = 44
      Height = 13
      Caption = 'Emissor'
    end
    object Label14: TLabel [4]
      Left = 16
      Top = 177
      Width = 28
      Height = 13
      Caption = 'Data'
    end
    object Label9: TLabel [5]
      Left = 196
      Top = 137
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    object Label12: TLabel [6]
      Left = 196
      Top = 177
      Width = 113
      Height = 13
      Caption = 'Quantidade do Lote'
    end
    inherited pnlTitulo: TPanel
      Width = 400
      TabOrder = 7
      inherited lbNomItem: TfcLabel
        Width = 197
        Caption = 'Cotação das Ações'
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 232
      Width = 385
      Height = 121
      Anchors = [akLeft, akRight, akBottom]
      Caption = ' Cotação '
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 64
        Width = 42
        Height = 13
        Caption = 'Mínima'
      end
      object Label2: TLabel
        Left = 134
        Top = 24
        Width = 70
        Height = 13
        Caption = 'Fechamento'
      end
      object Label3: TLabel
        Left = 134
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Máxima'
      end
      object Label4: TLabel
        Left = 10
        Top = 24
        Width = 49
        Height = 13
        Caption = 'Abertura'
      end
      object Label7: TLabel
        Left = 259
        Top = 64
        Width = 107
        Height = 13
        Caption = 'Volume Negociado'
      end
      object Label8: TLabel
        Left = 259
        Top = 24
        Width = 35
        Height = 13
        Caption = 'Média'
      end
      object DBEdit5: TDBEdit
        Left = 10
        Top = 40
        Width = 114
        Height = 21
        DataField = 'VLRABERTURA'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 134
        Top = 40
        Width = 115
        Height = 21
        DataField = 'VLRFECHAMENTO'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 134
        Top = 80
        Width = 115
        Height = 21
        DataField = 'VLRMAXIMA'
        DataSource = ds
        TabOrder = 4
      end
      object dbeMedia: TDBEdit
        Left = 259
        Top = 40
        Width = 114
        Height = 21
        DataField = 'VLRMEDIA'
        DataSource = ds
        TabOrder = 2
      end
      object dbeVolNeg: TDBEdit
        Left = 259
        Top = 80
        Width = 114
        Height = 21
        DataField = 'VOLNEGOCIADO'
        DataSource = ds
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 10
        Top = 80
        Width = 114
        Height = 21
        DataField = 'VLRMINIMA'
        DataSource = ds
        TabOrder = 3
      end
    end
    object DBlkBolsa: TwwDBLookupCombo
      Left = 16
      Top = 73
      Width = 367
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLBOLSAVALORES'#9'30'#9'Descrição'#9'F')
      DataField = 'IDBOLSAVALORES'
      DataSource = ds
      LookupTable = QryBolsa
      LookupField = 'IDBOLSAVALORES'
      Options = [loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = DBlkBolsaExit
    end
    object DBLkAcao: TwwDBLookupCombo
      Left = 16
      Top = 113
      Width = 368
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'40'#9'Descrição'#9'F')
      DataField = 'IDACAO'
      DataSource = ds
      LookupTable = QryAcao
      LookupField = 'IDACAO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbeEmissor: TDBEdit
      Left = 16
      Top = 153
      Width = 171
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'SIGLAEMISSOR'
      DataSource = DsAcao
      TabOrder = 3
    end
    object DBDdataAutoriza: TCMDateTimePicker
      Left = 16
      Top = 193
      Width = 171
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATACOTAACAO'
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
      TabOrder = 4
    end
    object dbeMoeda: TDBEdit
      Left = 196
      Top = 153
      Width = 186
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'MOEDESC'
      DataSource = DsAcao
      TabOrder = 5
    end
    object dbeQtdLote: TDBEdit
      Left = 196
      Top = 193
      Width = 186
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'QTDELOTE'
      DataSource = DsAcao
      TabOrder = 6
    end
  end
  inherited Dock972: TDock97
    Width = 402
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 402
    inherited tb97Fundo: TToolbar97
      Left = 230
      DockPos = 242
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 61
      DockPos = 73
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CotacaoAcao'
      'set'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  DATACOTAACAO = :DATACOTAACAO,'
      '  IDACAO = :IDACAO,'
      '  VLRABERTURA = :VLRABERTURA,'
      '  VLRFECHAMENTO = :VLRFECHAMENTO,'
      '  VLRMINIMA = :VLRMINIMA,'
      '  VLRMAXIMA = :VLRMAXIMA,'
      '  VLRMEDIA = :VLRMEDIA,'
      '  VOLNEGOCIADO = :VOLNEGOCIADO,'
      '  QTDELOTE = :QTDELOTE'
      'where'
      '  IDEMISSOR = :OLD_IDEMISSOR and'
      '  IDBOLSAVALORES = :OLD_IDBOLSAVALORES and'
      '  DATACOTAACAO = :OLD_DATACOTAACAO and'
      '  IDACAO = :OLD_IDACAO')
    InsertSQL.Strings = (
      'insert into CotacaoAcao'
      
        '  (IDEMISSOR, IDBOLSAVALORES, DATACOTAACAO, IDACAO, VLRABERTURA,' +
        ' '
      'VLRFECHAMENTO, '
      '   VLRMINIMA, VLRMAXIMA, VLRMEDIA, VOLNEGOCIADO, QTDELOTE)'
      'values'
      '  (:IDEMISSOR, :IDBOLSAVALORES, :DATACOTAACAO, :IDACAO, '
      ':VLRABERTURA, :VLRFECHAMENTO, '
      '   :VLRMINIMA, :VLRMAXIMA, :VLRMEDIA, :VOLNEGOCIADO, :QTDELOTE)')
    DeleteSQL.Strings = (
      'delete from CotacaoAcao'
      'where'
      '  IDEMISSOR = :OLD_IDEMISSOR and'
      '  IDBOLSAVALORES = :OLD_IDBOLSAVALORES and'
      '  DATACOTAACAO = :OLD_DATACOTAACAO and'
      '  IDACAO = :OLD_IDACAO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'BOLSAVALORES.SGLBOLSAVALORES'
      'EMISSOR.SIGLAEMISSOR'
      'DATACOTAACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'COTACAOACAO.VOLNEGOCIADO'
      'COTACAOACAO.VLRMEDIA')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Bolsa'
      'Emissor'
      'Data'
      'Ação'
      'Volume Negociado '
      'Valor da Média')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'COTACAOACAO'
      'EMISSOR'
      'INVESTIMENTO'
      'BOLSAVALORES')
    CamposChave.Strings = (
      'COTACAOACAO.IDEMISSOR'
      'COTACAOACAO.IDBOLSAVALORES'
      'COTACAOACAO.DATACOTAACAO'
      'COTACAOACAO.IDACAO')
    Filtro.Strings = (
      'COTACAOACAO.IDEMISSOR '#9'= EMISSOR.IDEMISSOR'
      'COTACAOACAO.IDACAO    '#9'= INVESTIMENTO.IDINVESTIMENTO'
      'COTACAOACAO.IDBOLSAVALORES = BOLSAVALORES.IDBOLSAVALORES')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '###,###,###,###0.00'
      '###,###,###,###0.00')
    Larguras.Strings = (
      '15'
      '15'
      '10'
      '40'
      '15'
      '15')
    Left = 285
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 57
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'select     CTA.IdEmissor,'
      '              CTA.IdBolsaValores,'
      '              CTA.DataCotaAcao,'
      '              CTA.IdAcao,'
      '              CTA.VlrAbertura,'
      '              CTA.VlrFechamento,'
      '              CTA.VlrMinima,'
      '              CTA.VlrMaxima,'
      '              CTA.VlrMedia,'
      '              CTA.VolNegociado,'
      '              CTA.QTDELOTE'
      ''
      'From      CotacaoAcao CTA '
      ' ')
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.COTACAOACAO.IDEMISSOR'
    end
    object qryIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BASEDADOS.COTACAOACAO.IDBOLSAVALORES'
    end
    object qryDATACOTAACAO: TDateTimeField
      FieldName = 'DATACOTAACAO'
      Origin = 'BASEDADOS.COTACAOACAO.DATACOTAACAO'
    end
    object qryIDACAO: TFloatField
      FieldName = 'IDACAO'
      Origin = 'BASEDADOS.COTACAOACAO.IDACAO'
    end
    object qryVLRABERTURA: TFloatField
      FieldName = 'VLRABERTURA'
      Origin = 'BASEDADOS.COTACAOACAO.VLRABERTURA'
      EditFormat = '###,###,###,###0.00'
    end
    object qryVLRFECHAMENTO: TFloatField
      FieldName = 'VLRFECHAMENTO'
      Origin = 'BASEDADOS.COTACAOACAO.VLRFECHAMENTO'
      EditFormat = '###,###,###,###0.00'
    end
    object qryVLRMINIMA: TFloatField
      FieldName = 'VLRMINIMA'
      Origin = 'BASEDADOS.COTACAOACAO.VLRMINIMA'
      EditFormat = '###,###,###,###0.00'
    end
    object qryVLRMAXIMA: TFloatField
      FieldName = 'VLRMAXIMA'
      Origin = 'BASEDADOS.COTACAOACAO.VLRMAXIMA'
      EditFormat = '###,###,###,###0.00'
    end
    object qryVLRMEDIA: TFloatField
      FieldName = 'VLRMEDIA'
      Origin = 'BASEDADOS.COTACAOACAO.VLRMEDIA'
      EditFormat = '###,###,###,###0.00'
    end
    object qryVOLNEGOCIADO: TFloatField
      FieldName = 'VOLNEGOCIADO'
      Origin = 'BASEDADOS.COTACAOACAO.VOLNEGOCIADO'
      EditFormat = '###,###,###,###0.00'
    end
    object qryQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'BASEDADOS.COTACAOACAO.QTDELOTE'
      EditFormat = '###,###,###,##0'
    end
  end
  object QryBolsa: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select     CV.IDBOLSAVALORES ,'
      '               CV.SGLBOLSAVALORES'
      ''
      'From      BOLSAVALORES CV'
      ''
      'Where   CV.IDBOLSAVALORES  in '
      '              (select AXB.IDBOLSAVALORES from ACOESXBOLSA AXB)'
      ''
      ''
      'Order by CV.SGLBOLSAVALORES')
    ValidateWithMask = True
    Left = 272
    Top = 120
    object QryBolsaSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Visible = False
    end
  end
  object QryAcao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT'#9'A.IDACAO, A.CODTIPOACAO, A.CODTIPODIREITO, I.DESCINVESTIM' +
        'ENTO,'
      #9'E.IDEMISSOR, E.SIGLAEMISSOR, I.IDMOEDACONTAB, M.MOEDESC,'
      #9'X.QTDELOTE'
      ''
      'FROM '#9'ACAO A, INVESTIMENTO I, EMISSOR E, MOEDA M, '
      #9'ACOESXBOLSA X'
      '   '
      'WHERE '#9'(A.IDACAO IN'
      
        #9'  (SELECT IDACAO FROM ACOESXBOLSA WHERE IDBOLSAVALORES = :BOLSA' +
        ' )) AND'
      #9'(A.IDACAO     '#9'= I.IDINVESTIMENTO)'#9'AND'
      '            '#9'(I.IDEMISSOR '#9'= E.IDEMISSOR)          '#9'AND '
      '            '#9'(I.IDMOEDACONTAB = M.MOECODIGO)    '#9'AND'
      '               '#9'(X.IDBOLSAVALORES = :BOLSA) '#9#9'AND '
      
        '               '#9'(A.IDACAO                    = X.IDACAO)        ' +
        ' '
      ''
      'ORDER BY I.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 320
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'BOLSA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BOLSA'
        ParamType = ptUnknown
      end>
    object QryAcaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryAcaoIDACAO: TFloatField
      FieldName = 'IDACAO'
      Visible = False
    end
    object QryAcaoCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Visible = False
      Size = 5
    end
    object QryAcaoCODTIPODIREITO: TStringField
      FieldName = 'CODTIPODIREITO'
      Visible = False
      Size = 5
    end
    object QryAcaoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object QryAcaoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Visible = False
    end
    object QryAcaoMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Visible = False
    end
    object QryAcaoQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Visible = False
      EditFormat = '###,###,###,##0'
    end
    object QryAcaoSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Visible = False
      Size = 15
    end
  end
  object DsAcao: TwwDataSource
    DataSet = QryAcao
    Left = 256
    Top = 104
  end
  object QryDelCotacaoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE  FROM COTACAOINVEST'
      'WHERE'
      '       DATACOTACAO    =:DATACOTACAO    AND'
      '       IDINVESTIMENTO =:IDINVESTIMENTO')
    ValidateWithMask = True
    Left = 162
    Top = 102
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATACOTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST SET DATAULTIMPCOT = :DATAULTIMPCOT'
      ' ')
    ValidateWithMask = True
    Left = 221
    Top = 112
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTIMPCOT'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 40
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 351
    Top = 178
  end
end
