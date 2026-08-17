inherited frmEstornaDepreciacao: TfrmEstornaDepreciacao
  Left = 288
  Top = 170
  HelpContext = 70049
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Estorno do Fechamento do Periodo'
  ClientHeight = 214
  ClientWidth = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 339
    Height = 175
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 337
      Height = 173
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 464
        Top = 408
        Width = 93
        Height = 13
        Caption = 'Data do Estorno'
      end
      object Data: TLabel
        Left = 103
        Top = 40
        Width = 119
        Height = 13
        Caption = 'Data do Fechamento'
        OnDblClick = DataDblClick
      end
      object eDataEst: TCMDateTimePicker
        Left = 464
        Top = 424
        Width = 130
        Height = 21
        Hint = 'Data da execução do estorno'
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
        ParentShowHint = False
        ShowHint = True
        ShowButton = True
        TabOrder = 1
      end
      object edDataFechamento: TCMDateTimePicker
        Left = 104
        Top = 56
        Width = 122
        Height = 21
        Hint = 'Data da movimentação a ser estornada'
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
        ParentShowHint = False
        ShowHint = True
        ShowButton = True
        TabOrder = 0
        OnChange = edDataFechamentoChange
        OnExit = edDataFechamentoExit
      end
      object pnlStatus: TPanel
        Left = 0
        Top = 124
        Width = 329
        Height = 41
        TabOrder = 2
        Visible = False
        object lblStatus: TLabel
          Left = 8
          Top = 4
          Width = 53
          Height = 13
          Caption = 'Processo'
        end
        object pnlprgBar: TPanel
          Left = 8
          Top = 18
          Width = 314
          Height = 17
          BevelOuter = bvLowered
          Caption = 'pnlprgBar'
          TabOrder = 0
          object prgBar: TGauge
            Left = 1
            Top = 1
            Width = 312
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
      object chkDeprecImob: TCheckBox
        Left = 103
        Top = 85
        Width = 127
        Height = 17
        Caption = 'Processar Imóveis'
        TabOrder = 3
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 175
    Width = 339
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 275
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70049
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 98
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Estornar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 459
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HM.IDMOVIMENTACAO, HM.IDPESSOA, HM.IDBEM, HM.DATAMOVIMENT' +
        'ACAO, HM.VALOFI,'
      
        '       HM.DATAULTDEP, HM.PLNCODIGO, B.DEPLANC, B.CMBEM, G.IDGRUP' +
        'O,'
      
        '       G.FLGIMOVEL, DECODE(HM.FLGNCAF,NULL,0,HM.FLGNCAF) AS NCAF' +
        ','
      '       C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     GRUPO G,'
      '     CONJUNTO C'
      'WHERE (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '  AND (HM.IDTIPOMOVIMENTACAO = :PIDTIPOMOV)'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (HM.TIPDEPPRORATA = 2)'
      '  AND (HM.IDPESSOA = :PIDPESSOA)'
      '  AND (HM.IDBEM = B.IDBEM)'
      '  AND (HM.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      'ORDER BY G.IDGRUPO'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryHistoricoIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDMOVIMENTACAO'
    end
    object qryHistoricoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDPESSOA'
    end
    object qryHistoricoIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDBEM'
    end
    object qryHistoricoDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAMOVIMENTACAO'
    end
    object qryHistoricoVALOFI: TFloatField
      FieldName = 'VALOFI'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.VALOFI'
    end
    object qryHistoricoDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAULTDEP'
    end
    object qryHistoricoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.PLNCODIGO'
    end
    object qryHistoricoDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = 'BASEDADOS.BEM.DEPLANC'
    end
    object qryHistoricoCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = 'BASEDADOS.BEM.CMBEM'
    end
    object qryHistoricoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.GRUPO.IDGRUPO'
    end
    object qryHistoricoFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'BASEDADOS.GRUPO.FLGIMOVEL'
    end
    object qryHistoricoNCAF: TFloatField
      FieldName = 'NCAF'
    end
    object qryHistoricoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryHistoricoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object qryUpdGrupo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM GRUPO  G,'
      '     PLANOGRUPO P'
      'WHERE (P.IDPESSOA = :PIDPESSOA)'
      '  AND (G.TIPO     = '#39'A'#39')'
      '  AND (G.STATUS   = '#39'A'#39')'
      'ORDER BY G.NOME'
      '')
    UpdateObject = updGrupo
    ValidateWithMask = True
    Left = 416
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryUpdGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryUpdGrupoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'GRUPO.MOECODIGO'
    end
    object qryUpdGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryUpdGrupoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
    object qryUpdGrupoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'GRUPO.STATUS'
      Size = 1
    end
    object qryUpdGrupoVALALUGUEL: TFloatField
      FieldName = 'VALALUGUEL'
      Origin = 'GRUPO.VALALUGUEL'
    end
    object qryUpdGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryUpdGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryUpdGrupoDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'GRUPO.DATAULTDEP'
    end
    object qryUpdGrupoDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = 'GRUPO.DATARECALCDEP'
    end
    object qryUpdGrupoULTIDBEM: TFloatField
      FieldName = 'ULTIDBEM'
      Origin = 'GRUPO.ULTIDBEM'
    end
    object qryUpdGrupoFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'GRUPO.FLGIMOVEL'
    end
  end
  object updGrupo: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  MOECODIGO = :MOECODIGO,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  STATUS = :STATUS,'
      '  VALALUGUEL = :VALALUGUEL,'
      '  DEPRECIACAO = :DEPRECIACAO,'
      '  CLASSE = :CLASSE,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  DATARECALCDEP = :DATARECALCDEP,'
      '  ULTIDBEM = :ULTIDBEM,'
      '  FLGIMOVEL = :FLGIMOVEL'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (IDGRUPO, MOECODIGO, NOME, TIPO, STATUS, VALALUGUEL, DEPRECIAC' +
        'AO, CLASSE, '
      '   DATAULTDEP, DATARECALCDEP, ULTIDBEM, FLGIMOVEL)'
      'values'
      
        '  (:IDGRUPO, :MOECODIGO, :NOME, :TIPO, :STATUS, :VALALUGUEL, :DE' +
        'PRECIACAO, '
      '   :CLASSE, :DATAULTDEP, :DATARECALCDEP, :ULTIDBEM, :FLGIMOVEL)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 416
    Top = 360
  end
  object qryParamCAF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDAFISCAL, MOEDAGERENCIAL, MOEDAOFICIAL,'
      '       MASCCODGRUPO, SISTEMAS, INTEGRACONTAB,'
      '       PLANOVIGENTE, FLGREMOVEPLANCTB'
      'FROM PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 352
    Top = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCAFMOEDAFISCAL: TFloatField
      FieldName = 'MOEDAFISCAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAFISCAL'
    end
    object qryParamCAFMOEDAGERENCIAL: TFloatField
      FieldName = 'MOEDAGERENCIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAGERENCIAL'
    end
    object qryParamCAFMOEDAOFICIAL: TFloatField
      FieldName = 'MOEDAOFICIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAOFICIAL'
    end
    object qryParamCAFMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = 'PARAMETROSCAFMANUT.MASCCODGRUPO'
    end
    object qryParamCAFSISTEMAS: TStringField
      FieldName = 'SISTEMAS'
      Origin = 'PARAMETROSCAFMANUT.SISTEMAS'
      Size = 8
    end
    object qryParamCAFINTEGRACONTAB: TStringField
      FieldName = 'INTEGRACONTAB'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACONTAB'
      Size = 1
    end
    object qryParamCAFPLANOVIGENTE: TFloatField
      FieldName = 'PLANOVIGENTE'
      Origin = 'PARAMETROSCAFMANUT.PLANOVIGENTE'
    end
    object qryParamCAFFLGREMOVEPLANCTB: TStringField
      FieldName = 'FLGREMOVEPLANCTB'
      Origin = 'PARAMETROSCAFMANUT.FLGREMOVEPLANCTB'
      Size = 1
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 416
    Top = 408
  end
  object qryAlteraBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BEM'
      'SET DEPLANC    = :DEPLANC,'
      '    DATAULTDEP = :DATAULTDEP,'
      '    FLGDEPREC  = :FLGDEPREC'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 648
    Top = 16
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryHistReaval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HM.IDMOVIMENTACAO, HM.IDPESSOA, HM.IDBEM, HM.DATAMOVIMENT' +
        'ACAO,'
      '       HM.PLNCODIGO,  HM.VALOFI, HM.DATAULTDEP,'
      
        '       B.IDGRUPO, G.FLGIMOVEL, R.IDREAVALIACAO, R.DEPLANC, R.CMB' +
        'EM,'
      '       R.FLGULTREAVAL, C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM   HISTORICOMOVIMENTACAO HM,'
      '       BEM B,'
      '       GRUPO G,'
      '       REAVALIACAO R,'
      '       CONJUNTO C'
      'WHERE (HM.DATAMOVIMENTACAO   = :PDATAMOV)'
      '  AND (HM.IDTIPOMOVIMENTACAO = :PIDTIPOMOV)'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (HM.TIPDEPPRORATA = 2)'
      '  AND (HM.IDPESSOA       = :PIDPESSOA)'
      '  AND (HM.IDBEM          = B.IDBEM)'
      '  AND (HM.IDPESSOA       = B.IDPESSOA)'
      '  AND (B.IDGRUPO         = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO      = C.IDCONJUNTO)'
      '  AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 56
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryHistReavalIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
    object qryHistReavalIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryHistReavalIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryHistReavalDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryHistReavalPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryHistReavalVALOFI: TFloatField
      FieldName = 'VALOFI'
    end
    object qryHistReavalDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryHistReavalIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryHistReavalFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
    end
    object qryHistReavalIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
    end
    object qryHistReavalDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryHistReavalCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryHistReavalFLGULTREAVAL: TFloatField
      FieldName = 'FLGULTREAVAL'
    end
    object qryHistReavalIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryHistReavalIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object qryAlteraReaval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE REAVALIACAO'
      'SET DEPLANC    = :DEPLANC,'
      '    DATAULTDEP = :DATAULTDEP,'
      '    FLGDEPREC  = :FLGDEPREC'
      'WHERE (IDREAVALIACAO = :IDREAVALIACAO)'
      '  AND (IDBEM         = :IDBEM)'
      '  AND (IDPESSOA      = :IDPESSOA)')
    ValidateWithMask = True
    Left = 648
    Top = 64
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryHistAcresc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HM.IDMOVIMENTACAO, HM.IDPESSOA, HM.IDBEM, HM.DATAMOVIMENT' +
        'ACAO,'
      
        '       HM.PLNCODIGO,  HM.VALOFI, HM.DATAULTDEP, C.IDLOCALIZACAO,' +
        ' C.IDRESPONSAVEL,'
      
        '       B.IDGRUPO, G.FLGIMOVEL, AV.IDACRESCIMO, AV.DEPLANC, AV.CM' +
        'BEM'
      'FROM   HISTORICOMOVIMENTACAO HM,'
      '       BEM B,'
      '       GRUPO G,'
      '       ACRESCIMOVALOR AV,'
      '       CONJUNTO C'
      'WHERE (HM.DATAMOVIMENTACAO   = :PDATAMOV)'
      '  AND (HM.IDTIPOMOVIMENTACAO = :PIDTIPOMOV)'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (HM.TIPDEPPRORATA = 2)'
      '  AND (HM.IDPESSOA           = :PIDPESSOA)'
      '  AND (HM.IDBEM              = B.IDBEM)'
      '  AND (HM.IDPESSOA           = B.IDPESSOA)'
      '  AND (B.IDGRUPO             = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO          = C.IDCONJUNTO)'
      '  AND (HM.IDREAVALACRESC     = AV.IDACRESCIMO)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 264
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryHistAcrescIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDMOVIMENTACAO'
    end
    object qryHistAcrescIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDPESSOA'
    end
    object qryHistAcrescIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDBEM'
    end
    object qryHistAcrescDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAMOVIMENTACAO'
    end
    object qryHistAcrescPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.PLNCODIGO'
    end
    object qryHistAcrescVALOFI: TFloatField
      FieldName = 'VALOFI'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.VALOFI'
    end
    object qryHistAcrescDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAULTDEP'
    end
    object qryHistAcrescIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.BEM.IDGRUPO'
    end
    object qryHistAcrescFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'BASEDADOS.GRUPO.FLGIMOVEL'
    end
    object qryHistAcrescIDACRESCIMO: TFloatField
      FieldName = 'IDACRESCIMO'
      Origin = 'BASEDADOS.ACRESCIMOVALOR.IDACRESCIMO'
    end
    object qryHistAcrescDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = 'BASEDADOS.ACRESCIMOVALOR.DEPLANC'
    end
    object qryHistAcrescCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = 'BASEDADOS.ACRESCIMOVALOR.CMBEM'
    end
    object qryHistAcrescIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'BASEDADOS.CONJUNTO.IDLOCALIZACAO'
    end
    object qryHistAcrescIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'BASEDADOS.CONJUNTO.IDRESPONSAVEL'
    end
  end
  object qryAlteraAcresc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE ACRESCIMOVALOR'
      'SET DEPLANC    = :DEPLANC,'
      '    DATAULTDEP = :DATAULTDEP,'
      '    FLGDEPREC  = :FLGDEPREC'
      'WHERE (IDACRESCIMO   = :IDACRESCIMO)'
      '  AND (IDBEM         = :IDBEM)'
      '  AND (IDPESSOA      = :IDPESSOA)')
    ValidateWithMask = True
    Left = 648
    Top = 112
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryExclusaoHistorico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM'
      '   HISTCARTINV H'
      'WHERE'
      '   ( H.NATURMOVCARTINV = '#39'P'#39' )'
      '   AND ( H.TIPMOVCARTINV = '#39'DEP'#39' )'
      '   AND ( H.DATAMOVCARTINV =:DATA )')
    ValidateWithMask = True
    Left = 360
    Top = 248
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaHistoricoExclusao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV'
      'FROM'
      '   HISTCARTINV H'
      'WHERE'
      '   ( H.NATURMOVCARTINV = '#39'P'#39' )'
      '   AND ( H.TIPMOVCARTINV = '#39'DEP'#39' )'
      '   AND ( H.DATAMOVCARTINV =:DATA )')
    ValidateWithMask = True
    Left = 360
    Top = 232
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qryBuscaHistoricoExclusaoIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
    end
  end
  object qryVerUltDep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(HM.DATAMOVIMENTACAO) AS DATAULT'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     GRUPO G'
      
        'WHERE ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (HM.IDTIPOMOVIMENTACAO IN (14,18,35))'
      '  AND (HM.TIPDEPPRORATA <> 2)'
      '  AND (HM.IDPESSOA = :PIDPESSOA)'
      '  AND (HM.IDBEM  = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 72
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryVerUltDepDATAULT: TDateTimeField
      FieldName = 'DATAULT'
    end
  end
  object qryRemHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTORICOMOVIMENTACAO HM'
      'WHERE (EXISTS (SELECT HM1.IDMOVIMENTACAO'
      '               FROM  HISTORICOMOVIMENTACAO HM1,'
      '                     BEM B,'
      '                     GRUPO G'
      '               WHERE (HM1.DATAMOVIMENTACAO = :PDATAMOV)'
      
        '                 AND ((HM1.IDTIPOMOVIMENTACAO = 14) OR (HM1.IDTI' +
        'POMOVIMENTACAO = 18) OR (HM1.IDTIPOMOVIMENTACAO = 35))'
      
        '                 AND ((HM1.IDMOVIMENTACAO >= :PIDMOVMIN) AND (HM' +
        '1.IDMOVIMENTACAO <= :PIDMOVMAX))'
      
        '                 AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIM' +
        'OVEL = :PFLGIMOVELFIM))'
      '                 AND (HM1.TIPDEPPRORATA = 2)'
      '                 AND (HM1.IDBEM = B.IDBEM)'
      '                 AND (B.IDGRUPO = G.IDGRUPO)'
      '                 AND (HM.IDMOVIMENTACAO = HM1.IDMOVIMENTACAO) ))'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 56
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVMIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVMAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELFIM'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemValMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM VALORMOVIMENTACAO'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemDepBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DEPRECIACAOBEM'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemDepReav: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DEPRECIACAOREAVAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemDepAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DEPRECIACAOACRESC'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryVerUltFec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(HM.DATAMOVIMENTACAO) AS DATAULT'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     GRUPO G'
      
        'WHERE ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (HM.IDTIPOMOVIMENTACAO IN (14,18,35))'
      '  AND (HM.TIPDEPPRORATA = 2)'
      '  AND (HM.IDPESSOA = :PIDPESSOA)'
      '  AND (HM.IDBEM  = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 156
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryVerUltFecDATAULT: TDateTimeField
      FieldName = 'DATAULT'
    end
  end
  object qryVerUltMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HM.DATAMOVIMENTACAO'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     GRUPO G'
      
        'WHERE ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (HM.DATAMOVIMENTACAO > :PDATAMOV)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 01)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 03)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 32)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 17)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 04)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 67)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 68)'
      '  AND (HM.IDPESSOA = :PIDPESSOA)'
      '  AND (HM.IDBEM  = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryVerUltMovDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAMOVIMENTACAO'
    end
  end
end
