inherited frmSimulaAtivos: TfrmSimulaAtivos
  Left = 285
  Top = 203
  Caption = 'Simulação de Ativos'
  ClientHeight = 171
  ClientWidth = 380
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 380
    Height = 132
    object lblMensagem: TLabel
      Left = 8
      Top = 89
      Width = 74
      Height = 13
      Caption = 'lblMensagem'
      Visible = False
    end
    object dbData: TGroupBox
      Left = 40
      Top = 16
      Width = 302
      Height = 65
      Caption = ' Período para Simular os Ativos '
      TabOrder = 0
      object deDataSimIni: TCMDateTimePicker
        Left = 16
        Top = 24
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
      end
      object deDataSimFim: TCMDateTimePicker
        Left = 167
        Top = 24
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
        TabOrder = 1
      end
    end
    object prgBarAtuFluxo: TProgressBar
      Left = 1
      Top = 109
      Width = 378
      Height = 22
      Align = alBottom
      Min = 0
      Max = 100
      Step = 2
      TabOrder = 1
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 132
    Width = 380
    inherited tb97Fundo: TToolbar97
      Left = 128
      DockPos = 128
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
        TabOrder = 2
      end
      object bbtnCalcula: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Calcular'
        TabOrder = 0
        OnClick = bbtnCalculaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 296
    Top = 32
  end
  object qryFluxoOrc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.MOEDACOTA,'
      '       A.APLICRESGATEJUROS,'
      '       A.VALOR,'
      '       A.CONTAAPLICACAO,'
      '       A.PRAZORESGATE,'
      '       A.JUROSPREVISTOS,'
      '       A.DATAPREVRESGATE,'
      '       A.DATALANCAMENTO,'
      '       A.NUMCOTAS,'
      '       A.VLRRESGPREV,'
      '       A.TIPOAPLICACAO,'
      '       A.CODLANCAPLIC,'
      '       A.PERCUSTO,      '
      '       A.PERCUSTOREND,  '
      '       X.SALDOVALOR'
      'FROM APLICACOES A,'
      
        '     (SELECT CONTAAPLICACAO, SUM(DECODE(APLICRESGATEJUROS,'#39'R'#39',(V' +
        'ALOR*-1),VALOR)) AS SALDOVALOR'
      '      FROM APLICACOES'
      '      GROUP BY CONTAAPLICACAO'
      
        '      HAVING SUM(DECODE(APLICRESGATEJUROS,'#39'R'#39',(VALOR*-1),VALOR))' +
        ' <> 0) X'
      'WHERE (A.IDPESSOA = :IDPESSOA) AND'
      '      (X.CONTAAPLICACAO = A.CONTAAPLICACAO) AND'
      '      (A.APLICRESGATEJUROS = '#39'A'#39') AND'
      '      (A.DATAPREVRESGATE >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND'
      '      (A.DATAPREVRESGATE <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      'ORDER BY A.CONTAAPLICACAO, A.DATAPREVRESGATE'
      '')
    ValidateWithMask = True
    Left = 64
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    object qryFluxoOrcMOEDACOTA: TFloatField
      FieldName = 'MOEDACOTA'
    end
    object qryFluxoOrcAPLICRESGATEJUROS: TStringField
      FieldName = 'APLICRESGATEJUROS'
      Size = 1
    end
    object qryFluxoOrcVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryFluxoOrcCONTAAPLICACAO: TFloatField
      FieldName = 'CONTAAPLICACAO'
    end
    object qryFluxoOrcPRAZORESGATE: TFloatField
      FieldName = 'PRAZORESGATE'
    end
    object qryFluxoOrcJUROSPREVISTOS: TFloatField
      FieldName = 'JUROSPREVISTOS'
    end
    object qryFluxoOrcDATAPREVRESGATE: TDateTimeField
      FieldName = 'DATAPREVRESGATE'
    end
    object qryFluxoOrcDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryFluxoOrcNUMCOTAS: TFloatField
      FieldName = 'NUMCOTAS'
    end
    object qryFluxoOrcVLRRESGPREV: TFloatField
      FieldName = 'VLRRESGPREV'
    end
    object qryFluxoOrcTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
    end
    object qryFluxoOrcCODLANCAPLIC: TFloatField
      FieldName = 'CODLANCAPLIC'
    end
    object qryFluxoOrcSALDOVALOR: TFloatField
      FieldName = 'SALDOVALOR'
    end
    object qryFluxoOrcPERCUSTO: TFloatField
      FieldName = 'PERCUSTO'
    end
    object qryFluxoOrcPERCUSTOREND: TFloatField
      FieldName = 'PERCUSTOREND'
    end
  end
  object qryTipoAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.*,'
      '       S.MOECODIGO AS MOECODIGOD,'
      '       S.PRAZORESGATEPREV  AS PRAZORESGATEPREVD,'
      '       S.TXJUROSPREV AS TXJUROSPREVD,'
      '       S.IDEMPRESA AS IDEMPRESAD,'
      '       S.CODCENTROCUSTO AS CODCENTROCUSTOD,'
      '       S.CODTIPRECDES AS CODTIPRECDESD,'
      '       S.RECPAG AS RECPAGD,'
      '       S.CODCENTRORESPON AS CODCENTRORESPOND,'
      '       S.UNIDNEGOC AS UNIDNEGOCD'
      'FROM TIPOAPLICACAO T,'
      
        '     (SELECT TIPOAPLICACAO, MOECODIGO, PRAZORESGATEPREV, TXJUROS' +
        'PREV,'
      
        '             IDEMPRESA, CODCENTROCUSTO, CODTIPRECDES, RECPAG, CO' +
        'DCENTRORESPON,'
      '             UNIDNEGOC'
      '      FROM TIPOAPLICACAO) S'
      'WHERE (T.TIPOAPLICACAO = :TIPOAPLICACAO) AND'
      
        '      (DECODE(T.TIPOAPLICSUBST,NULL,T.TIPOAPLICACAO,T.TIPOAPLICS' +
        'UBST) = S.TIPOAPLICACAO)')
    ValidateWithMask = True
    Left = 160
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOAPLICACAO'
        ParamType = ptUnknown
      end>
    object qryTipoAplicIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryTipoAplicCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryTipoAplicCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryTipoAplicRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryTipoAplicCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryTipoAplicUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryTipoAplicMOECODIGOD: TFloatField
      FieldName = 'MOECODIGOD'
    end
    object qryTipoAplicPRAZORESGATEPREVD: TFloatField
      FieldName = 'PRAZORESGATEPREVD'
    end
    object qryTipoAplicTXJUROSPREVD: TFloatField
      FieldName = 'TXJUROSPREVD'
    end
    object qryTipoAplicIDEMPRESAD: TFloatField
      FieldName = 'IDEMPRESAD'
    end
    object qryTipoAplicCODCENTROCUSTOD: TStringField
      FieldName = 'CODCENTROCUSTOD'
      Size = 10
    end
    object qryTipoAplicCODTIPRECDESD: TStringField
      FieldName = 'CODTIPRECDESD'
      Size = 15
    end
    object qryTipoAplicRECPAGD: TStringField
      FieldName = 'RECPAGD'
      Size = 1
    end
    object qryTipoAplicCODCENTRORESPOND: TStringField
      FieldName = 'CODCENTRORESPOND'
      Size = 10
    end
    object qryTipoAplicUNIDNEGOCD: TFloatField
      FieldName = 'UNIDNEGOCD'
    end
    object qryTipoAplicFLGREAPLICA: TStringField
      FieldName = 'FLGREAPLICA'
      Size = 1
    end
    object qryTipoAplicTIPOAPLICSUBST: TFloatField
      FieldName = 'TIPOAPLICSUBST'
    end
    object qryTipoAplicTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
    end
    object qryTipoAplicDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryTipoAplicFIXAVARIAVEL: TStringField
      FieldName = 'FIXAVARIAVEL'
      Size = 1
    end
    object qryTipoAplicTIPORESGATE: TStringField
      FieldName = 'TIPORESGATE'
      Size = 1
    end
    object qryTipoAplicTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryTipoAplicTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryTipoAplicMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryTipoAplicTXJUROSPREV: TFloatField
      FieldName = 'TXJUROSPREV'
    end
    object qryTipoAplicPRAZORESGATEPREV: TFloatField
      FieldName = 'PRAZORESGATEPREV'
    end
    object qryTipoAplicIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryTipoAplicPERCUSTO: TFloatField
      FieldName = 'PERCUSTO'
    end
    object qryTipoAplicIDCONTAORCCUS: TStringField
      FieldName = 'IDCONTAORCCUS'
      Size = 25
    end
    object qryTipoAplicIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
    end
    object qryTipoAplicIDCONTAORCREC: TStringField
      FieldName = 'IDCONTAORCREC'
      Size = 25
    end
    object qryTipoAplicPERCUSTOREND: TFloatField
      FieldName = 'PERCUSTOREND'
    end
  end
  object qryParametro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.IDEMPRESA,'
      '       T.CODCENTROCUSTO,'
      '       T.CODTIPRECDES,'
      '       T.RECPAG,'
      '       T.CODCENTRORESPON,'
      '       T.UNIDNEGOC,'
      '       P.TIPOAPLICACAO'
      'FROM TIPOAPLICACAO T, PARAMFINANC P'
      'WHERE (T.TIPOAPLICACAO = P.TIPOAPLICACAO) AND'
      '      (P.IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 187
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParametroIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = '"TIPOAPLICACAO".IDEMPRESA'
    end
    object qryParametroCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = '"TIPOAPLICACAO".CODCENTROCUSTO'
      Size = 10
    end
    object qryParametroCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = '"TIPOAPLICACAO".CODTIPRECDES'
      Size = 15
    end
    object qryParametroRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = '"TIPOAPLICACAO".RECPAG'
      Size = 1
    end
    object qryParametroCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = '"TIPOAPLICACAO".CODCENTRORESPON'
      Size = 10
    end
    object qryParametroUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = '"TIPOAPLICACAO".UNIDNEGOC'
    end
    object qryParametroTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
      Origin = 'PARAMFINANC.TIPOAPLICACAO'
    end
  end
  object qryCalcSaldoCaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(DECODE(RECPAG,'#39'P'#39',VALOR*-1,VALOR)) AS SALDO'
      'FROM FLUXOORCADO'
      
        'WHERE (DATAPROGRAMADA <= TO_DATE(:DATAPROGRAMADA,'#39'DD/MM/YYYY'#39')) ' +
        'AND'
      '      (IDPESSOA = :IDPESSOA) AND'
      '      (PRAZO    = :PRAZO)')
    ValidateWithMask = True
    Left = 80
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAPROGRAMADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRAZO'
        ParamType = ptUnknown
      end>
    object qryCalcSaldoCaixaSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object qryLancConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.MOEDACOTA,'
      '       A.APLICRESGATEJUROS,'
      '       A.VALOR,'
      '       A.CONTAAPLICACAO,'
      '       A.PRAZORESGATE,'
      '       A.JUROSPREVISTOS,'
      '       A.DATAPREVRESGATE,'
      '       A.DATALANCAMENTO,'
      '       A.NUMCOTAS,'
      '       A.VLRRESGPREV,'
      '       A.TIPOAPLICACAO,'
      '       A.CODLANCAPLIC'
      'FROM APLICACOES A'
      'WHERE (A.CONTAAPLICACAO = :CONTAAPLICACAO) AND'
      '      (A.IDPESSOA = :IDPESSOA) AND'
      '      (A.APLICRESGATEJUROS <> '#39'J'#39') AND'
      '      (A.CODLANCAPLIC <> :CODLANCAPLIC)'
      'ORDER BY A.DATALANCAMENTO'
      '')
    ValidateWithMask = True
    Left = 296
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CONTAAPLICACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODLANCAPLIC'
        ParamType = ptUnknown
      end>
    object qryLancContaMOEDACOTA: TFloatField
      FieldName = 'MOEDACOTA'
    end
    object qryLancContaAPLICRESGATEJUROS: TStringField
      FieldName = 'APLICRESGATEJUROS'
      Size = 1
    end
    object qryLancContaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryLancContaCONTAAPLICACAO: TFloatField
      FieldName = 'CONTAAPLICACAO'
    end
    object qryLancContaPRAZORESGATE: TFloatField
      FieldName = 'PRAZORESGATE'
    end
    object qryLancContaJUROSPREVISTOS: TFloatField
      FieldName = 'JUROSPREVISTOS'
    end
    object qryLancContaDATAPREVRESGATE: TDateTimeField
      FieldName = 'DATAPREVRESGATE'
    end
    object qryLancContaDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryLancContaNUMCOTAS: TFloatField
      FieldName = 'NUMCOTAS'
    end
    object qryLancContaVLRRESGPREV: TFloatField
      FieldName = 'VLRRESGPREV'
    end
    object qryLancContaTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
    end
    object qryLancContaCODLANCAPLIC: TFloatField
      FieldName = 'CODLANCAPLIC'
    end
  end
  object qryLancSimulAtivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM LANCSIMULAATIVO')
    ValidateWithMask = True
    Left = 226
    Top = 10
    object qryLancSimulAtivoIDLANCSIMULAATIVO: TFloatField
      FieldName = 'IDLANCSIMULAATIVO'
      Origin = 'LANCSIMULAATIVO.IDLANCSIMULAATIVO'
    end
    object qryLancSimulAtivoTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
      Origin = 'LANCSIMULAATIVO.TIPOAPLICACAO'
    end
    object qryLancSimulAtivoDATALANC: TDateTimeField
      FieldName = 'DATALANC'
      Origin = 'LANCSIMULAATIVO.DATALANC'
    end
    object qryLancSimulAtivoDATAPREVRESGATE: TDateTimeField
      FieldName = 'DATAPREVRESGATE'
      Origin = 'LANCSIMULAATIVO.DATAPREVRESGATE'
    end
    object qryLancSimulAtivoFLGTIPOLANC: TStringField
      FieldName = 'FLGTIPOLANC'
      Origin = 'LANCSIMULAATIVO.FLGTIPOLANC'
      Size = 1
    end
    object qryLancSimulAtivoVLRAPLICRESG: TFloatField
      FieldName = 'VLRAPLICRESG'
      Origin = 'LANCSIMULAATIVO.VLRAPLICRESG'
    end
    object qryLancSimulAtivoVLRRECEITA: TFloatField
      FieldName = 'VLRRECEITA'
      Origin = 'LANCSIMULAATIVO.VLRRECEITA'
    end
    object qryLancSimulAtivoVLRDESPESA: TFloatField
      FieldName = 'VLRDESPESA'
      Origin = 'LANCSIMULAATIVO.VLRDESPESA'
    end
  end
  object qryEmpresaProp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ES.IDPAIS, ES.CODESTADO, EP.IDCIDADES'
      'FROM PESSOA P,'
      '     ENDPESS EP,'
      '     CIDADES C,'
      '     ESTADO ES,'
      '     EMPRESAPROP E'
      'WHERE'
      '    (E.IDPESSOA = :IDPESSOA) AND'
      '    (P.IDPESSOA = E.IDPESSOA) AND'
      '    (P.IDENDCOMERCIAL = EP.IDENDERECO) AND'
      '    (EP.IDCIDADES = C.IDCIDADES) AND'
      '    (C.IDESTADO = ES.IDESTADO)'
      '')
    ValidateWithMask = True
    Left = 238
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryEmpresaPropIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
    end
    object qryEmpresaPropCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryEmpresaPropIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'ENDPESS.IDCIDADES'
    end
  end
end
