inherited frmParamContab: TfrmParamContab
  Left = 208
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Parametrização Contábil'
  ClientHeight = 257
  ClientWidth = 410
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 410
    Height = 218
    object grpPeriodo: TGroupBox
      Left = 16
      Top = 16
      Width = 153
      Height = 65
      Caption = ' Movimentação até '
      TabOrder = 0
      object eDataMov: TCMDateTimePicker
        Left = 14
        Top = 24
        Width = 121
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
        ShowButton = True
        TabOrder = 0
      end
    end
    object rdgGrupo: TRadioGroup
      Left = 200
      Top = 16
      Width = 193
      Height = 65
      Caption = ' Grupos Contábeis dos Bens '
      ItemIndex = 0
      Items.Strings = (
        'Patrimoniais'
        'Investimentos Imobiliários')
      TabOrder = 1
    end
    object rdgMovim: TRadioGroup
      Left = 16
      Top = 88
      Width = 377
      Height = 72
      Caption = 'Movimentação'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Entradas'
        'Baixas'
        'Depreciação'
        'Reavaliação'
        'Acréscimos'
        'Todas')
      TabOrder = 2
    end
    object pnlStatus: TPanel
      Left = 5
      Top = 172
      Width = 400
      Height = 41
      Align = alBottom
      TabOrder = 3
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
        Width = 383
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 381
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
  end
  inherited Dock971: TDock97
    Top = 218
    Width = 410
    inherited tb97Fundo: TToolbar97
      Left = 237
      DockPos = 237
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 69
      DockPos = 69
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.IDPESSOA, B.IDGRUPO, B.IDCONJUNTO, B.CODSUBCON' +
        'TA,'
      '       B.PLACA, B.DESBEM, G.NOME AS DESCGRUPO,'
      
        '       CTMG.IDTIPOMOVIMENTACAO, CTMG.PLANO, CTMG.PLACONTA, CTMG.' +
        'TIPOLANCAMENTO,'
      '       RD.CODCENTROCUSTO,CC.NOME'
      'FROM   BEM B,'
      '       GRUPO G,'
      '       CONTASTIPOSMOVIMENTOGRUPOS CTMG,'
      '       RATEIODEPRECIACAO RD,'
      '       CENTCUST CC'
      'WHERE (B.IDPESSOA = :PIDPESSOA)'
      '  AND (CTMG.IDTIPOMOVIMENTACAO IN (14,18,35,15,22,34,21,19,36))'
      '  AND ((B.FLGDEPREC = 0) OR (B.FLGDEPREC IS NULL ))'
      '  AND ((B.BAIXATOTAL <> '#39'S'#39') OR (B.BAIXATOTAL IS NULL))'
      '  AND (B.TAXADEP <> 0 )'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      '  AND (B.CONTROLE = '#39'T'#39')'
      '  AND (B.REGISTRO = '#39'I'#39')'
      '  AND (CTMG.PLANO = :PPLANO)'
      '  AND (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDGRUPO = CTMG.IDGRUPO)'
      '  AND (B.IDCONJUNTO = RD.IDCONJUNTO)'
      '  AND (RD.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (RD.IDEMPRESA      = CC.IDEMPRESA)'
      
        'ORDER BY B.IDGRUPO, B.PLACA, CTMG.IDTIPOMOVIMENTACAO, CTMG.TIPOL' +
        'ANCAMENTO DESC'
      '')
    ValidateWithMask = True
    Left = 160
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
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
    object qryBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryBemCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBemIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
    end
    object qryBemPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBemPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryBemTIPOLANCAMENTO: TStringField
      FieldName = 'TIPOLANCAMENTO'
      Size = 1
    end
    object qryBemCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryBemNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object qryCtaCtbGrp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOMOVIMENTACAO, PLANO, PLACONTA, TIPOLANCAMENTO'
      'FROM   CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE (IDGRUPO = :PIDGRUPO)'
      '  AND (PLANO   = :PLANO)'
      'ORDER BY IDTIPOMOVIMENTACAO, TIPOLANCAMENTO DESC'
      '')
    ValidateWithMask = True
    Left = 480
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryCtaCtbGrpIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.IDTIPOMOVIMENTACAO'
    end
    object qryCtaCtbGrpPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.PLANO'
    end
    object qryCtaCtbGrpPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.PLACONTA'
      Size = 18
    end
    object qryCtaCtbGrpTIPOLANCAMENTO: TStringField
      FieldName = 'TIPOLANCAMENTO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.TIPOLANCAMENTO'
      Size = 1
    end
  end
  object qryCcRd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.CODCENTROCUSTO,'
      '       C.NOME,'
      '       C.STATUSGRUPOCDC AS TIPO,'
      '       R.IDCONJUNTO,'
      '       R.PARTICIPACAO'
      'FROM  CENTCUST          C,'
      '      RATEIODEPRECIACAO R'
      'WHERE (R.IDEMPRESA  = :PIDEMPRESA)'
      '  AND (R.IDCONJUNTO = :PIDCONJUNTO)'
      '  AND (C.CODCENTROCUSTO = R.CODCENTROCUSTO)'
      ''
      '')
    ValidateWithMask = True
    Left = 544
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end>
    object qryCcRdCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryCcRdNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qryCcRdTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qryCcRdPARTICIPACAO: TFloatField
      FieldName = 'PARTICIPACAO'
    end
    object qryCcRdIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
  end
end
