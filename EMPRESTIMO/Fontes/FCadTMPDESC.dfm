inherited frmCadTMPDESC: TfrmCadTMPDESC
  Left = 171
  Top = 166
  Caption = ''
  ClientHeight = 300
  ClientWidth = 498
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel [0]
    Left = 392
    Top = 42
    Width = 44
    Height = 13
    Caption = 'Parcela'
  end
  inherited pnlFundo: TPanel
    Width = 498
    Height = 232
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Contrato'
    end
    object Label3: TLabel
      Left = 307
      Top = 28
      Width = 112
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mês de Referência:'
    end
    object Label4: TLabel
      Left = 315
      Top = 52
      Width = 104
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mês de Cobrança:'
    end
    object Label20: TLabel
      Left = 152
      Top = 10
      Width = 37
      Height = 13
      Caption = 'Ordem'
    end
    object Label5: TLabel
      Left = 16
      Top = 58
      Width = 89
      Height = 13
      Caption = 'Rubrica Interna'
    end
    object Label6: TLabel
      Left = 363
      Top = 76
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sit.Envio:'
    end
    object Label2: TLabel
      Left = 152
      Top = 58
      Width = 92
      Height = 13
      Caption = 'Rubrica Externa'
    end
    object Label7: TLabel
      Left = 16
      Top = 202
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Label8: TLabel
      Left = 16
      Top = 154
      Width = 106
      Height = 13
      Caption = 'Data Recebimento'
    end
    object Label9: TLabel
      Left = 312
      Top = 202
      Width = 104
      Height = 13
      Caption = 'IDHistMovEmptmo'
    end
    object Label11: TLabel
      Left = 152
      Top = 202
      Width = 88
      Height = 13
      Caption = 'Valor Recebido'
    end
    object Label12: TLabel
      Left = 389
      Top = 148
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lote:'
    end
    object Label13: TLabel
      Left = 349
      Top = 172
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lote Prévia:'
    end
    object Label14: TLabel
      Left = 354
      Top = 116
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Folha:'
    end
    object dbeContrato: TwwDBEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IDDESCONTO'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit3: TwwDBEdit
      Left = 152
      Top = 24
      Width = 121
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'ORDEM'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit5: TwwDBEdit
      Left = 424
      Top = 24
      Width = 57
      Height = 21
      TabStop = False
      DataField = 'MESREFERENCIA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit6: TwwDBEdit
      Left = 424
      Top = 48
      Width = 57
      Height = 21
      TabStop = False
      DataField = 'MESCOBRANCA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit4: TwwDBEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      TabStop = False
      DataField = 'IDPROVENTO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit7: TwwDBEdit
      Left = 424
      Top = 72
      Width = 57
      Height = 21
      DataField = 'SITENVIO'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 152
      Top = 72
      Width = 121
      Height = 21
      TabStop = False
      DataField = 'CODPROVDESC'
      DataSource = ds
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit2: TwwDBEdit
      Left = 16
      Top = 216
      Width = 121
      Height = 21
      DataField = 'VALOR'
      DataSource = ds
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBedtDataReceb: TCMDateTimePicker
      Left = 16
      Top = 168
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATARECEBIMENTO'
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
      TabOrder = 7
    end
    object wwDBEdit8: TwwDBEdit
      Left = 312
      Top = 216
      Width = 169
      Height = 21
      TabStop = False
      DataField = 'IDHISTMOVEMPTMO'
      DataSource = ds
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit9: TwwDBEdit
      Left = 152
      Top = 216
      Width = 121
      Height = 21
      DataField = 'VALORRECEBIDO'
      DataSource = ds
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit10: TwwDBEdit
      Left = 424
      Top = 144
      Width = 57
      Height = 21
      DataField = 'IDLOTE'
      DataSource = ds
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit11: TwwDBEdit
      Left = 424
      Top = 168
      Width = 57
      Height = 21
      DataField = 'LOTEPREVIA'
      DataSource = ds
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit12: TwwDBEdit
      Left = 424
      Top = 112
      Width = 57
      Height = 21
      DataField = 'FLGDESCFOLHA'
      DataSource = ds
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 498
    inherited Toolbar971: TToolbar97
      Visible = False
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
      inherited btnRefresh: TToolbarButton97
        Width = 25
        Enabled = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 371
        Width = 25
      end
    end
  end
  inherited Dock971: TDock97
    Top = 267
    Width = 498
    inherited tb97Fundo: TToolbar97
      Left = 326
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 154
    end
  end
  inherited ds: TwwDataSource
    Left = 464
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TMPDESC'
      'set'
      '  IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  IDPROVENTO = :IDPROVENTO,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  IDLOTE = :IDLOTE,'
      '  SITENVIO = :SITENVIO,'
      '  LOTEPREVIA = :LOTEPREVIA,'
      '  VALOR = :VALOR,'
      '  VALORRECEBIDO = :VALORRECEBIDO'
      'where'
      '  IDTMPDESC = :OLD_IDTMPDESC')
    InsertSQL.Strings = (
      'insert into TMPDESC'
      
        '  (IDTMPDESC, IDHISTMOVEMPTMO, MESCOBRANCA, MESREFERENCIA, DATAR' +
        'ECEBIMENTO, '
      
        '   IDPROVENTO, CODPROVDESC, FLGDESCFOLHA, IDLOTE, SITENVIO, LOTE' +
        'PREVIA, '
      '   VALOR, VALORRECEBIDO)'
      'values'
      
        '  (:IDTMPDESC, :IDHISTMOVEMPTMO, :MESCOBRANCA, :MESREFERENCIA, :' +
        'DATARECEBIMENTO, '
      
        '   :IDPROVENTO, :CODPROVDESC, :FLGDESCFOLHA, :IDLOTE, :SITENVIO,' +
        ' :LOTEPREVIA, '
      '   :VALOR, :VALORRECEBIDO)')
    DeleteSQL.Strings = (
      'delete from TMPDESC'
      'where'
      '  IDTMPDESC = :OLD_IDTMPDESC')
    Left = 400
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 760
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 696
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '   TMP.IDTMPDESC        ,'
      ''
      '   TMP.IDMODULO         ,'
      ''
      '   TMP.IDDESCONTO       ,'
      '   TMP.ORDEM            ,'
      '   TMP.IDHISTMOVEMPTMO  ,'
      ''
      '   TMP.MESCOBRANCA      ,'
      '   TMP.MESREFERENCIA    ,'
      ''
      '   TMP.IDEMPRESAPROP    ,'
      '   TMP.IDPESSOA         ,'
      '   TMP.FLGTIPODESC      ,'
      '   TMP.IDTITULAR        ,'
      ''
      '   TMP.DATARECEBIMENTO  ,'
      '   TMP.IDPESSJUR        ,'
      '   TMP.IDPROVENTO       ,'
      '   TMP.IDPLANOPREV      ,'
      ''
      '   TMP.MATRICULA        ,'
      '   TMP.INSCRICAONUMERO  ,'
      ''
      '   TMP.CODPROVDESC      ,'
      '   TMP.FLGDESCFOLHA     ,'
      '   TMP.DATAREFERENCIA   ,'
      '   TMP.REFERENCIA       ,'
      ''
      '   TMP.FLGATRASODEVOL   ,'
      ''
      '   TMP.DATACOBRANCA     ,'
      '   TMP.IDLOTE           ,'
      '   TMP.SITENVIO         ,'
      '   TMP.TRGDTINCLUSAO    ,'
      '   TMP.TRGUSERINCLUSAO  ,'
      '   TMP.LOTEPREVIA       ,'
      '   TMP.VALORINFO        ,'
      ''
      '   TMP.VALOR            ,'
      '   TMP.VALORRECEBIDO'
      ''
      'FROM'
      '   TMPDESC        TMP'
      ''
      'WHERE'
      '       TMP.IDMODULO     IN (15, 32)'
      '   AND IDTMPDESC        =:PIDTMPDESC')
    Left = 432
    Top = 0
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end>
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object qryMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryFLGTIPODESC: TStringField
      FieldName = 'FLGTIPODESC'
      FixedChar = True
      Size = 1
    end
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qryIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object qryREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object qryFLGATRASODEVOL: TStringField
      FieldName = 'FLGATRASODEVOL'
      FixedChar = True
      Size = 1
    end
    object qryDATACOBRANCA: TDateTimeField
      FieldName = 'DATACOBRANCA'
    end
    object qryIDLOTE: TFloatField
      FieldName = 'IDLOTE'
    end
    object qrySITENVIO: TStringField
      FieldName = 'SITENVIO'
      FixedChar = True
      Size = 1
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryLOTEPREVIA: TFloatField
      FieldName = 'LOTEPREVIA'
    end
    object qryVALORINFO: TFloatField
      FieldName = 'VALORINFO'
    end
    object qryVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
  end
end
