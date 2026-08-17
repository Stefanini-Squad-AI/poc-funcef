inherited frmMovDepreciacao: TfrmMovDepreciacao
  Left = 262
  Top = 101
  HelpContext = 70048
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Fechamento do Periodo'
  ClientHeight = 210
  ClientWidth = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 377
    Height = 171
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 375
      Height = 169
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Data: TLabel
        Left = 120
        Top = 32
        Width = 119
        Height = 13
        Caption = 'Data do Fechamento'
      end
      object edDataFechamento: TCMDateTimePicker
        Left = 120
        Top = 48
        Width = 133
        Height = 24
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
        ShowHint = False
        ShowButton = True
        TabOrder = 0
        OnCloseUp = edDataFechamentoExit
        OnChange = edDataFechamentoExit
        OnExit = edDataFechamentoExit
      end
      object pnlStatus: TPanel
        Left = 1
        Top = 127
        Width = 373
        Height = 41
        Align = alBottom
        TabOrder = 1
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
          Width = 351
          Height = 17
          BevelOuter = bvLowered
          Caption = 'pnlprgBar'
          TabOrder = 0
          object prgBar: TGauge
            Left = 1
            Top = 1
            Width = 349
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
        Left = 117
        Top = 82
        Width = 148
        Height = 17
        Caption = 'Depreciar os Imóveis'
        TabOrder = 2
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 171
    Width = 377
    inherited tb97Fundo: TToolbar97
      Left = 205
      DockPos = 274
      inherited sep1: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70048
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 28
      DockPos = 97
      inherited ToolbarSep971: TToolbarSep97
        Left = 89
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 89
        Caption = '&Executar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 92
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 736
    Top = 472
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryGrupoBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDPESSOA,B.IDBEM,G.IDGRUPO,G.FLGIMOVEL'
      'FROM GRUPO  G,'
      '     BEM B'
      'WHERE (B.IDBEM    = :PIDBEM)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (G.IDGRUPO  = B.IDGRUPO)'
      '')
    ValidateWithMask = True
    Left = 632
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryGrupoBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryGrupoBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryGrupoBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryGrupoBemFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
    end
  end
  object qryReavaliacoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDBEM, R.IDPESSOA, R.VALORG, R.CMBEM, R.DEPLANC,'
      '       R.CMDEP, R.DATAREAVALIACAO, R.DATAULTDEP,'
      '       R.IDREAVALIACAO, R.IDMOVIMENTACAO, R.DEPGER, R.DEPFIS,'
      '       R.VALFIS, R.VALGER, R.FLGDEPREC, R.TAXADEP, B.PLACA,'
      '       B.IDGRUPO, B.DESBEM, B.DATAINICIODEP, B.IDCONJUNTO,'
      '       B.UNIDNEGOC, NVL(B.CODSUBCONTA,0) AS CODSUBCONTA,'
      '       R.FLGULTREAVAL,C.IDLOCALIZACAO,C.IDRESPONSAVEL'
      'FROM   BEM B,'
      '       REAVALIACAO R,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (B.IDPESSOA =  :PIDPESSOA)'
      '  AND ((R.FLGDEPREC = 0) OR (R.FLGDEPREC IS NULL))'
      '  AND ((B.BAIXATOTAL = '#39'N'#39') OR (B.BAIXATOTAL IS NULL))'
      '  AND (R.TAXADEP <> 0)'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (R.DATAREAVALIACAO <= :PDATAMOV )'
      '  AND (B.CONTROLE   = '#39'T'#39')'
      '  AND (B.REGISTRO   = '#39'I'#39')'
      '  AND (R.IDBEM      = B.IDBEM)'
      '  AND (R.IDPESSOA   = B.IDPESSOA)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updReavaliacoes
    ValidateWithMask = True
    Left = 48
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryReavaliacoesIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryReavaliacoesIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryReavaliacoesVALORG: TFloatField
      FieldName = 'VALORG'
      currency = True
    end
    object qryReavaliacoesCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryReavaliacoesDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryReavaliacoesCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryReavaliacoesDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object qryReavaliacoesDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryReavaliacoesIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
    end
    object qryReavaliacoesIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
    object qryReavaliacoesDEPGER: TFloatField
      FieldName = 'DEPGER'
      currency = True
    end
    object qryReavaliacoesDEPFIS: TFloatField
      FieldName = 'DEPFIS'
      currency = True
    end
    object qryReavaliacoesVALFIS: TFloatField
      FieldName = 'VALFIS'
      currency = True
    end
    object qryReavaliacoesVALGER: TFloatField
      FieldName = 'VALGER'
      currency = True
    end
    object qryReavaliacoesFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryReavaliacoesTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryReavaliacoesIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryReavaliacoesDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryReavaliacoesDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryReavaliacoesIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryReavaliacoesUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryReavaliacoesCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryReavaliacoesPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryReavaliacoesFLGULTREAVAL: TFloatField
      FieldName = 'FLGULTREAVAL'
    end
    object qryReavaliacoesIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryReavaliacoesIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object updReavaliacoes: TUpdateSQL
    ModifySQL.Strings = (
      'update REAVALIACAO'
      'set'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DATAREAVALIACAO = :DATAREAVALIACAO,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  IDREAVALIACAO = :IDREAVALIACAO,'
      '  IDMOVIMENTACAO = :IDMOVIMENTACAO,'
      '  DEPGER = :DEPGER,'
      '  DEPFIS = :DEPFIS,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  TAXADEP = :TAXADEP'
      'where'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    InsertSQL.Strings = (
      'insert into REAVALIACAO'
      
        '  (IDBEM, IDPESSOA, VALORG, CMBEM, DEPLANC, CMDEP, DATAREAVALIAC' +
        'AO, DATAULTDEP, '
      
        '   IDREAVALIACAO, IDMOVIMENTACAO, DEPGER, DEPFIS, VALFIS, VALGER' +
        ', FLGDEPREC, '
      '   TAXADEP)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :VALORG, :CMBEM, :DEPLANC, :CMDEP, :DATARE' +
        'AVALIACAO, '
      
        '   :DATAULTDEP, :IDREAVALIACAO, :IDMOVIMENTACAO, :DEPGER, :DEPFI' +
        'S, :VALFIS, '
      '   :VALGER, :FLGDEPREC, :TAXADEP)')
    DeleteSQL.Strings = (
      'delete from REAVALIACAO'
      'where'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    Left = 48
    Top = 315
  end
  object qryAcrescimos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.IDBEM, A.IDPESSOA, A.VALORG, A.CMBEM, A.DEPLANC,'
      '       A.CMDEP, A.DATAACRESCIMO, A.DATAULTDEP, A.TAXADEP,'
      '       A.IDACRESCIMO, A.IDMOVIMENTACAO, A.DEPGER, A.DEPFIS,'
      '       A.VALFIS, A.VALGER, A.FLGDEPREC,B.UNIDNEGOC,'
      '       NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, B.PLACA,'
      '       B.IDGRUPO, B.DESBEM, B.DATAINICIODEP, B.IDCONJUNTO,'
      '       C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM   BEM B,'
      '       ACRESCIMOVALOR A,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (B.IDPESSOA      =  :PIDPESSOA)'
      '  AND ((A.FLGDEPREC = 0) OR (A.FLGDEPREC IS NULL))'
      '  AND ((B.BAIXATOTAL    = '#39'N'#39') OR (B.BAIXATOTAL IS NULL))'
      '  AND (A.TAXADEP <> 0)'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (A.DATAACRESCIMO <= :PDATAMOV)'
      '  AND (B.CONTROLE      = '#39'T'#39')'
      '  AND (B.REGISTRO      = '#39'I'#39')'
      '  AND (A.IDBEM         = B.IDBEM)'
      '  AND (A.IDPESSOA      = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      ''
      ' ')
    UpdateObject = updAcrescimos
    ValidateWithMask = True
    Left = 48
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryAcrescimosIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryAcrescimosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryAcrescimosVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryAcrescimosCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryAcrescimosDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryAcrescimosCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryAcrescimosDATAACRESCIMO: TDateTimeField
      FieldName = 'DATAACRESCIMO'
    end
    object qryAcrescimosDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryAcrescimosTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryAcrescimosIDACRESCIMO: TFloatField
      FieldName = 'IDACRESCIMO'
    end
    object qryAcrescimosIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
    object qryAcrescimosDEPGER: TFloatField
      FieldName = 'DEPGER'
    end
    object qryAcrescimosDEPFIS: TFloatField
      FieldName = 'DEPFIS'
    end
    object qryAcrescimosVALFIS: TFloatField
      FieldName = 'VALFIS'
    end
    object qryAcrescimosVALGER: TFloatField
      FieldName = 'VALGER'
    end
    object qryAcrescimosFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryAcrescimosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryAcrescimosCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryAcrescimosPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryAcrescimosIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryAcrescimosDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryAcrescimosDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryAcrescimosIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryAcrescimosIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryAcrescimosIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object updAcrescimos: TUpdateSQL
    ModifySQL.Strings = (
      'update ACRESCIMOVALOR'
      'set'
      '  IDACRESCIMO = :IDACRESCIMO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBEM = :IDBEM,'
      '  IDMOVIMENTACAO = :IDMOVIMENTACAO,'
      '  DATAACRESCIMO = :DATAACRESCIMO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  TAXADEP = :TAXADEP,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGDEPREC = :FLGDEPREC'
      'where'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    InsertSQL.Strings = (
      'insert into ACRESCIMOVALOR'
      
        '  (IDACRESCIMO, IDPESSOA, IDBEM, IDMOVIMENTACAO, DATAACRESCIMO, ' +
        'VALORG, '
      
        '   CMBEM, VALFIS, VALGER, TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGE' +
        'R, DATAULTDEP, '
      '   FLGDEPREC)'
      'values'
      
        '  (:IDACRESCIMO, :IDPESSOA, :IDBEM, :IDMOVIMENTACAO, :DATAACRESC' +
        'IMO, :VALORG, '
      
        '   :CMBEM, :VALFIS, :VALGER, :TAXADEP, :DEPLANC, :CMDEP, :DEPFIS' +
        ', :DEPGER, '
      '   :DATAULTDEP, :FLGDEPREC)')
    DeleteSQL.Strings = (
      'delete from ACRESCIMOVALOR'
      'where'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    Left = 49
    Top = 379
  end
  object qryInsHistorico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTORICOMOVIMENTACAO'
      '           (IDMOVIMENTACAO,'
      '            IDMODULO,'
      '            IDTIPOMOVIMENTACAO,'
      '            IDPESSOA,'
      '            IDBEM,'
      '            DATAMOVIMENTACAO,'
      '            VALOFI,'
      '            VALGER,'
      '            VALFIS,'
      '            IDREAVALACRESC,'
      '            DATAULTDEP)'
      'VALUES     (:PIDMOVIMENTACAO,'
      '            :PIDMODULO,'
      '            :PIDTIPOMOVIMENTACAO,'
      '            :PIDPESSOA,'
      '            :PIDBEM,'
      '            :PDATAMOVIMENTACAO,'
      '            :PVALOFI,'
      '            :PVALGER,'
      '            :PVALFIS,'
      '            :PIDREAVALACRESC,'
      '            :PDATAULTDEP)'
      '')
    ValidateWithMask = True
    Left = 288
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALOFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDREAVALACRESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object QryCCrd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.CODCENTROCUSTO,'
      '       C.NOME,'
      '       C.STATUSGRUPOCDC AS TIPO,'
      '       R.IDCONJUNTO,'
      '       R.PARTICIPACAO'
      'FROM  CENTCUST          C,'
      '      RATEIODEPRECIACAO R'
      'WHERE (R.IDEMPRESA  = :EMPRESA)'
      '  AND (R.IDCONJUNTO = :CONJUNTO)'
      '  AND (C.CODCENTROCUSTO = R.CODCENTROCUSTO)'
      ''
      '')
    ValidateWithMask = True
    Left = 208
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONJUNTO'
        ParamType = ptUnknown
      end>
    object QryCCrdCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object QryCCrdNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object QryCCrdTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QryCCrdPARTICIPACAO: TFloatField
      FieldName = 'PARTICIPACAO'
    end
    object QryCCrdIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
  end
  object qryCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO,COTDATA,INDICEBASE,COTVALOR, '
      '      COTMESREF '
      'FROM COTACAOMOEDA'
      'WHERE'
      '           ( MOECODIGO = :Moecodigo)'
      ' AND  ( COTMESREF = :CotMesRef)')
    ValidateWithMask = True
    Left = 544
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Moecodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CotMesRef'
        ParamType = ptUnknown
      end>
    object qryCotacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'COTACAOMOEDA.MOECODIGO'
    end
    object qryCotacaoCOTDATA: TDateTimeField
      FieldName = 'COTDATA'
      Origin = 'COTACAOMOEDA.COTDATA'
    end
    object qryCotacaoINDICEBASE: TFloatField
      FieldName = 'INDICEBASE'
      Origin = 'COTACAOMOEDA.INDICEBASE'
    end
    object qryCotacaoCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
    object qryCotacaoCOTMESREF: TStringField
      FieldName = 'COTMESREF'
      Origin = 'COTACAOMOEDA.COTMESREF'
      Size = 6
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
    Left = 208
    Top = 248
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
    Left = 208
    Top = 296
  end
  object qryAuxContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT PLANO,'
      '       PLACONTA, LACDEBCRE, CODCENTROCUSTO, CODSUBCONTA,'
      '       (0) AS IDGRUPO,'
      '       ('#39'                  '#39') AS PLACONTADEB,'
      '       ('#39'                  '#39') AS PLACONTACRE,'
      '       ('#39'          '#39') AS CODCENTROCUSTODEB,'
      '       ('#39'          '#39') AS CODCENTROCUSTOCRE,'
      '       (0) AS CODSUBCONTADEB,'
      '       (0) AS CODSUBCONTACRE,'
      '       UNIDNEGOC, IDPLANOPREV, IDPATRO,'
      '       ('#39' '#39') AS PLATIPCONVOFIDEB,'
      '       ('#39' '#39') AS PLATIPCONVGERDEB,'
      '       ('#39' '#39') AS PLATIPCONVOFICRE,'
      '       ('#39' '#39') AS PLATIPCONVGERCRE,'
      
        '       LACNUMDOC, LACHIST1, LACHIST2, LACHIST3, LACHIST4, LACHIS' +
        'T5,'
      '       LACVALOR, LACVALOFICIAL, LACVALGERENCIAL,'
      '       (0) AS LACVALORDEB,'
      '       (0) AS LACVALORCRE'
      'FROM LANCAMENTO'
      'WHERE (PLNCODIGO = 0)')
    UpdateObject = updAuxContab
    ValidateWithMask = True
    Left = 312
    Top = 40
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMESUBCONTA, IDPESSOA,CODSUBCONTA'
      'FROM SUBCONTA'
      'WHERE (IDPESSOA  =  :PIDPESSOA)'
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 368
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySubContaNOMESUBCONTA: TStringField
      DisplayLabel = 'SubConta'
      DisplayWidth = 60
      FieldName = 'NOMESUBCONTA'
      Origin = 'SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qrySubContaCODSUBCONTA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
      Origin = 'SUBCONTA.CODSUBCONTA'
      Visible = False
    end
    object qrySubContaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'SUBCONTA.IDPESSOA'
      Visible = False
    end
  end
  object updAuxContab: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  LACVALOR = :LACVALOR,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACVALORDEB = :LACVALORDEB,'
      '  LACVALORCRE = :LACVALORCRE'
      'where'
      '  PLANO = :OLD_PLANO and'
      '  PLACONTA = :OLD_PLACONTA and'
      '  LACDEBCRE = :OLD_LACDEBCRE and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO and'
      '  CODSUBCONTA = :OLD_CODSUBCONTA and'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  PLACONTADEB = :OLD_PLACONTADEB and'
      '  PLACONTACRE = :OLD_PLACONTACRE and'
      '  CODCENTROCUSTODEB = :OLD_CODCENTROCUSTODEB and'
      '  CODCENTROCUSTOCRE = :OLD_CODCENTROCUSTOCRE and'
      '  CODSUBCONTADEB = :OLD_CODSUBCONTADEB and'
      '  CODSUBCONTACRE = :OLD_CODSUBCONTACRE and'
      '  UNIDNEGOC = :OLD_UNIDNEGOC and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPATRO = :OLD_IDPATRO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLANO, PLACONTA, LACDEBCRE, CODCENTROCUSTO, CODSUBCONTA, IDGR' +
        'UPO, PLACONTADEB, '
      
        '   PLACONTACRE, CODCENTROCUSTODEB, CODCENTROCUSTOCRE, CODSUBCONT' +
        'ADEB, CODSUBCONTACRE, '
      
        '   UNIDNEGOC, IDPLANOPREV, IDPATRO, PLATIPCONVOFIDEB, PLATIPCONV' +
        'GERDEB, '
      
        '   PLATIPCONVOFICRE, PLATIPCONVGERCRE, LACNUMDOC, LACHIST1, LACH' +
        'IST2, LACHIST3, '
      
        '   LACHIST4, LACHIST5, LACVALOR, LACVALOFICIAL, LACVALGERENCIAL,' +
        ' LACVALORDEB, '
      '   LACVALORCRE)'
      'values'
      
        '  (:PLANO, :PLACONTA, :LACDEBCRE, :CODCENTROCUSTO, :CODSUBCONTA,' +
        ' :IDGRUPO, '
      
        '   :PLACONTADEB, :PLACONTACRE, :CODCENTROCUSTODEB, :CODCENTROCUS' +
        'TOCRE, '
      
        '   :CODSUBCONTADEB, :CODSUBCONTACRE, :UNIDNEGOC, :IDPLANOPREV, :' +
        'IDPATRO, '
      
        '   :PLATIPCONVOFIDEB, :PLATIPCONVGERDEB, :PLATIPCONVOFICRE, :PLA' +
        'TIPCONVGERCRE, '
      
        '   :LACNUMDOC, :LACHIST1, :LACHIST2, :LACHIST3, :LACHIST4, :LACH' +
        'IST5, :LACVALOR, '
      '   :LACVALOFICIAL, :LACVALGERENCIAL, :LACVALORDEB, :LACVALORCRE)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLANO = :OLD_PLANO and'
      '  PLACONTA = :OLD_PLACONTA and'
      '  LACDEBCRE = :OLD_LACDEBCRE and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO and'
      '  CODSUBCONTA = :OLD_CODSUBCONTA and'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  PLACONTADEB = :OLD_PLACONTADEB and'
      '  PLACONTACRE = :OLD_PLACONTACRE and'
      '  CODCENTROCUSTODEB = :OLD_CODCENTROCUSTODEB and'
      '  CODCENTROCUSTOCRE = :OLD_CODCENTROCUSTOCRE and'
      '  CODSUBCONTADEB = :OLD_CODSUBCONTADEB and'
      '  CODSUBCONTACRE = :OLD_CODSUBCONTACRE and'
      '  UNIDNEGOC = :OLD_UNIDNEGOC and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPATRO = :OLD_IDPATRO')
    Left = 312
    Top = 27
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA,G.IDGRUPO,G.MOECODIGO,G.NOME,G.TIPO,G.STATUS,G' +
        '.VALALUGUEL,G.DEPRECIACAO,'
      
        '       G.CLASSE,G.DATAULTDEP,G.DATARECALCDEP,G.ULTIDBEM,G.FLGIMO' +
        'VEL'
      'FROM GRUPO  G,'
      '     PLANOGRUPO P'
      'WHERE (G.IDGRUPO  = :PIDGRUPO)'
      '  AND (P.IDPESSOA = :PIDPESSOA)'
      '  AND (G.TIPO     = '#39'A'#39')'
      '  AND (G.STATUS   = '#39'A'#39')'
      'ORDER BY G.NOME'
      '')
    ValidateWithMask = True
    Left = 208
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryGrupoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PLANOGRUPO.IDPESSOA'
    end
    object qryGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryGrupoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'GRUPO.MOECODIGO'
    end
    object qryGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrupoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
    object qryGrupoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'GRUPO.STATUS'
      Size = 1
    end
    object qryGrupoVALALUGUEL: TFloatField
      FieldName = 'VALALUGUEL'
      Origin = 'GRUPO.VALALUGUEL'
    end
    object qryGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrupoDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'GRUPO.DATAULTDEP'
    end
    object qryGrupoDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = 'GRUPO.DATARECALCDEP'
    end
    object qryGrupoULTIDBEM: TFloatField
      FieldName = 'ULTIDBEM'
      Origin = 'GRUPO.ULTIDBEM'
    end
    object qryGrupoFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'GRUPO.FLGIMOVEL'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 632
    Top = 64
  end
  object qryContasxCc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO FROM CONTASXCC '
      'WHERE (IDEMPRESA               = :IEMPRESA)'
      '      AND (PLANO                        = :IPLANO)'
      '      AND (PLACONTA                 = :SCONTA)'
      '      AND (CODCENTROCUSTO = :SCCUSTO)')
    ValidateWithMask = True
    Left = 368
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SCCUSTO'
        ParamType = ptUnknown
      end>
    object qryContasxCcCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CONTASXCC.CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryHistCtb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTORICOMOVIMENTACAO  '
      'SET PLNCODIGO = :PPLNCODIGO'
      'WHERE (IDTIPOMOVIMENTACAO = :PIDTIPOMOVIMENTACAO)'
      '  AND (DATAMOVIMENTACAO   = :PDATAMOVIMENTACAO)'
      '  AND (PLNCODIGO IS NULL)'
      '  ')
    ValidateWithMask = True
    Left = 208
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTVALOR '
      'FROM COTACAOMOEDA'
      'WHERE (MOECODIGO = :PCODIGO)'
      '      AND (COTDATA      = :DATA)'
      '')
    ValidateWithMask = True
    Left = 545
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qryMoedaCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'BASEDADOS.COTACAOMOEDA.COTVALOR'
    end
  end
  object qryTemp: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 632
    Top = 112
  end
  object qryUltDeprec: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 288
    Top = 296
  end
  object qryPlanoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLATIPCONVGER,PLATIPCONVOFICIAL'
      'FROM   PLANOCONTA'
      'WHERE (PLANO           = :PPLANO)'
      '  AND (RTRIM(PLACONTA) = :PPLACONTA)'
      '')
    ValidateWithMask = True
    Left = 288
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptUnknown
      end>
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(VM.VALOFI) AS VALOROPERACAO,'
      '   HM.IDPESSOA, HM.DATAMOVIMENTACAO,'
      '   I.IDIMOVEL, I.IDCARTEIRAINVEST'
      'FROM'
      '   HISTORICOMOVIMENTACAO HM,'
      '   IMOVELXBEM IB,'
      '   IMOVEL I,'
      '   VALORMOVIMENTACAO VM'
      'WHERE'
      '   ('
      '   ( HM.DATAMOVIMENTACAO =:DATADEPREC )'
      '   )'
      '   AND'
      '   ('
      '   ( VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO )'
      '   AND ( HM.IDMODULO = 64 )'
      '   AND ( HM.IDTIPOMOVIMENTACAO IN (14, 18, 35) )'
      '   AND ( IB.IDBEM = HM.IDBEM )'
      '   AND ( IB.IDPESSOA = HM.IDPESSOA )'
      '   AND ( I.IDIMOVEL = IB.IDIMOVEL )'
      '   )'
      'GROUP BY'
      '   I.IDIMOVEL, I.IDCARTEIRAINVEST, I.IDIMOVEL, '
      '   HM.IDPESSOA, HM.DATAMOVIMENTACAO')
    ValidateWithMask = True
    Left = 632
    Top = 160
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATADEPREC'
        ParamType = ptUnknown
      end>
    object qryVALOROPERACAO: TFloatField
      FieldName = 'VALOROPERACAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
  end
  object qryAlteraBemCM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BEM'
      'SET CMBEM         = :CMBEM,'
      '    DATAINICIODEP = :DATAINICIODEP,'
      '    DATAULTDEP    = :DATAULTDEP,'
      '    DATARECALCDEP = :DATARECALCDEP'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 262
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINICIODEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATARECALCDEP'
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
  object qryAlteraBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BEM'
      'SET DEPLANC       = :DEPLANC,'
      '    CMDEP         = :CMDEP,'
      '    DATAINICIODEP = :DATAINICIODEP,'
      '    DATAULTDEP    = :DATAULTDEP,'
      '    DATARECALCDEP = :DATARECALCDEP,'
      '    FLGDEPREC     = :FLGDEPREC'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINICIODEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATARECALCDEP'
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
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.IDPESSOA, B.VALORG, B.VALFIS, B.DEPFIS, B.BAIX' +
        'ATOTAL, B.UNIDNEGOC,'
      
        '       B.DEPLANC, B.CMDEP, B.CMBEM, B.TAXADEP, B.DTAINCLUSAO, B.' +
        'FLGDEPREC, B.DATAULTDEP,'
      
        '       B.IDGRUPO, B.DESBEM, B.IDCONJUNTO, B.DATAINICIODEP, B.DAT' +
        'ARECALCDEP,'
      
        '       NVL(B.CODSUBCONTA,0) AS CODSUBCONTA,((B.VALORG+B.CMBEM) -' +
        ' (B.DEPLANC - B.CMDEP)) AS VALCTB,'
      '       B.PLACA, C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM   BEM B,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (B.IDPESSOA = :PIDPESSOA)'
      '  AND ((B.FLGDEPREC = 0) OR (B.FLGDEPREC IS NULL ))'
      '  AND ((B.BAIXATOTAL <> '#39'S'#39') OR (B.BAIXATOTAL IS NULL))'
      '  AND (B.TAXADEP <> 0 )'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (B.CONTROLE = '#39'T'#39')'
      '  AND (B.REGISTRO = '#39'I'#39')'
      '  AND (((B.VALORG+B.CMBEM) - (B.DEPLANC - B.CMDEP)) > 0 )'
      '  AND (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      'ORDER BY IDGRUPO,IDBEM'
      ''
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 234
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
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
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBemVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryBemVALFIS: TFloatField
      FieldName = 'VALFIS'
    end
    object qryBemDEPFIS: TFloatField
      FieldName = 'DEPFIS'
    end
    object qryBemBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      FixedChar = True
      Size = 1
    end
    object qryBemUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryBemCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryBemCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryBemFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryBemDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
    end
    object qryBemCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryBemVALCTB: TFloatField
      FieldName = 'VALCTB'
    end
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBemIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryBemIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object qryVerUltDep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(G.DATAULTDEP) AS DATAMOVIMENTACAO'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (PG.IDPESSOA = :PIDPESSOA)'
      '  AND (G.TIPO = '#39'A'#39')'
      '  AND (G.DATAULTDEP IS NOT NULL)'
      '  AND (PG.IDGRUPO  = G.IDGRUPO)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 208
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
    object qryVerUltDepDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
  end
  object qryCtaCtbDep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDGRUPO, IDTIPOMOVIMENTACAO, PLANO, PLACONTA, TIPOLANCAME' +
        'NTO'
      'FROM   CONTASTIPOSMOVIMENTOGRUPOS'
      
        'WHERE (IDTIPOMOVIMENTACAO IN (14, 18, 69, 35, 15, 21, 22, 19, 34' +
        ', 36))'
      '  AND (PLANO = :PLANO)'
      '    '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryVerUltDepOld: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HM.DATAMOVIMENTACAO'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     GRUPO G'
      'WHERE (HM.IDTIPOMOVIMENTACAO IN (14,18,35))'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (HM.IDPESSOA = :PIDPESSOA)'
      '  AND (HM.DATAMOVIMENTACAO >= :PDATAMOV)'
      '  AND (HM.IDBEM  = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      'ORDER BY HM.DATAMOVIMENTACAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 160
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
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
  end
end
