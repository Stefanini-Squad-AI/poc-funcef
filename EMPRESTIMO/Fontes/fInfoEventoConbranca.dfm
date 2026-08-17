inherited FrmInfoEventoCobranca: TFrmInfoEventoCobranca
  Left = 322
  Top = 243
  BorderStyle = bsSingle
  Caption = 'Adicionar Informações aos Eventos de Cobrança'
  ClientHeight = 306
  ClientWidth = 734
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 734
    Height = 267
    Caption = ' '
    object lblArquv: TLabel
      Left = 15
      Top = 8
      Width = 389
      Height = 13
      Caption = 
        'Arquivo com relação de contratos, NUP, CE, AR e Processo Judicia' +
        'l'
    end
    object lblObs: TLabel
      Left = 15
      Top = 64
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object lblDtEvento: TLabel
      Left = 594
      Top = 165
      Width = 72
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Data Evento'
    end
    object lblEventoCobranca: TLabel
      Left = 304
      Top = 218
      Width = 117
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Evento de Cobrança'
    end
    object edtArqEventoCobranca: TEdit
      Left = 15
      Top = 23
      Width = 652
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object grpIncluiObs: TGroupBox
      Left = 10
      Top = 157
      Width = 287
      Height = 104
      Anchors = [akLeft, akBottom]
      Caption = 'Inclui na Observação'
      TabOrder = 4
      object chkProcJud: TCheckBox
        Left = 10
        Top = 20
        Width = 137
        Height = 17
        Caption = 'Processo Judicial'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkCE: TCheckBox
        Left = 10
        Top = 40
        Width = 97
        Height = 17
        Caption = 'CE'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkAR: TCheckBox
        Left = 10
        Top = 60
        Width = 97
        Height = 17
        Caption = 'AR'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object chkNUP: TCheckBox
        Left = 10
        Top = 82
        Width = 97
        Height = 17
        Caption = 'NUP'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object chkNumCRM: TCheckBox
        Left = 152
        Top = 24
        Width = 97
        Height = 17
        Caption = 'NRº CRM'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object chkDtAjuizamento: TCheckBox
        Left = 152
        Top = 44
        Width = 129
        Height = 17
        Caption = 'Data Ajuizamento'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object chkJurisdicao: TCheckBox
        Left = 152
        Top = 66
        Width = 97
        Height = 17
        Caption = 'Jurisdição'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
    end
    object btnLimpaPart: TBitBtn
      Left = 694
      Top = 21
      Width = 24
      Height = 22
      Hint = 'Limpa a seleção de Participante'
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnClick = btnLimpaPartClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object btnProcurar: TBitBtn
      Left = 668
      Top = 21
      Width = 24
      Height = 22
      Hint = 'Procurar participante(s)'
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnProcurarClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
    object mmoObs: TMemo
      Left = 15
      Top = 79
      Width = 703
      Height = 69
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object tmpDtEvento: TCMDateTimePicker
      Left = 594
      Top = 180
      Width = 121
      Height = 21
      Anchors = [akRight, akBottom]
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
      TabOrder = 5
    end
    object cmbEventoCobranca: TDBLookupComboBox
      Left = 304
      Top = 233
      Width = 412
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      KeyField = 'IDTIPOEVENTOCOBEMPTMO'
      ListField = 'DESCEVENTOCOB'
      ListSource = dsEvCobranca
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 267
    Width = 734
    inherited tb97Fundo: TToolbar97
      Left = 563
      DockPos = 563
      TabOrder = 1
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 150025
        ClickHelpContext = 150025
      end
    end
    object btnAProcessar: TBitBtn
      Left = 448
      Top = 1
      Width = 112
      Height = 35
      Caption = '&Processar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAProcessarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
        88888887788888778F88887222222222088888788888888878F887A228822222
        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
        8888888778FFFF77888888888777778888888888877777888888}
      Layout = blGlyphRight
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 403
    Top = 59
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object Dialog: TOpenDialog
    Title = 'Arquivo de Entrada'
    Left = 524
    Top = 53
  end
  object qryEvCobranca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.IDTIPOEVENTOCOBEMPTMO, T.DESCEVENTOCOB FROM TIPOEVENTOC' +
        'OBEMPTMO T ORDER BY T.IDTIPOEVENTOCOBEMPTMO')
    ValidateWithMask = True
    Left = 184
    Top = 120
  end
  object dsEvCobranca: TDataSource
    DataSet = qryEvCobranca
    Left = 320
    Top = 120
  end
  object qryHstCobrEmptmo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDHISTEVENTOCOBEMPTMO, H.IDTIPOEVENTOCOBEMPTMO, H.IDCON' +
        'TRATOEMPTMO ,H.DATAEVENTOCOB, H.OBSCOB ,'
      
        ' H.CE, H.AR, H.SITAR, H.NUP, H.PROCJUD, H.NUMCRM,H.DTAJUIZAMENTO' +
        ',H.JURISDICAO'
      'FROM HISTEVENTOCOBEMPTMO H'
      ''
      'WHERE H.IDTIPOEVENTOCOBEMPTMO = :IDTIPOEVENTOCOBEMPTMO'
      'AND H.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO'
      'AND H.DATAEVENTOCOB = :DATAEVENTOCOB')
    UpdateObject = updHstCobrEmptmo
    ValidateWithMask = True
    Left = 504
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTIPOEVENTOCOBEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAEVENTOCOB'
        ParamType = ptUnknown
      end>
    object qryHstCobrEmptmoIDHISTEVENTOCOBEMPTMO: TFloatField
      FieldName = 'IDHISTEVENTOCOBEMPTMO'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.IDHISTEVENTOCOBEMPTMO'
    end
    object qryHstCobrEmptmoIDTIPOEVENTOCOBEMPTMO: TFloatField
      FieldName = 'IDTIPOEVENTOCOBEMPTMO'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.IDTIPOEVENTOCOBEMPTMO'
    end
    object qryHstCobrEmptmoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryHstCobrEmptmoDATAEVENTOCOB: TDateTimeField
      FieldName = 'DATAEVENTOCOB'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.DATAEVENTOCOB'
    end
    object qryHstCobrEmptmoOBSCOB: TMemoField
      FieldName = 'OBSCOB'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.OBSCOB'
      BlobType = ftMemo
      Size = 1000
    end
    object qryHstCobrEmptmoCE: TStringField
      FieldName = 'CE'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.CE'
      Size = 30
    end
    object qryHstCobrEmptmoAR: TStringField
      FieldName = 'AR'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.AR'
      Size = 30
    end
    object qryHstCobrEmptmoSITAR: TFloatField
      FieldName = 'SITAR'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.SITAR'
    end
    object qryHstCobrEmptmoNUP: TStringField
      FieldName = 'NUP'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.NUP'
      Size = 30
    end
    object qryHstCobrEmptmoPROCJUD: TStringField
      FieldName = 'PROCJUD'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.PROCJUD'
      Size = 30
    end
    object qryHstCobrEmptmoNUMCRM: TFloatField
      FieldName = 'NUMCRM'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.NUMCRM'
    end
    object qryHstCobrEmptmoDTAJUIZAMENTO: TDateTimeField
      FieldName = 'DTAJUIZAMENTO'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.DTAJUIZAMENTO'
    end
    object qryHstCobrEmptmoJURISDICAO: TStringField
      FieldName = 'JURISDICAO'
      Origin = 'BASEDADOS.HISTEVENTOCOBEMPTMO.JURISDICAO'
      Size = 200
    end
  end
  object updHstCobrEmptmo: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTEVENTOCOBEMPTMO'
      'set '
      '  OBSCOB = :OBSCOB,'
      '  CE = :CE,'
      '  AR = :AR,'
      '  SITAR = :SITAR,'
      '  NUP = :NUP,'
      '  PROCJUD = :PROCJUD,'
      '  NUMCRM = :NUMCRM,'
      '  DTAJUIZAMENTO = :DTAJUIZAMENTO,'
      '  JURISDICAO = :JURISDICAO'
      'where'
      '  IDHISTEVENTOCOBEMPTMO = :OLD_IDHISTEVENTOCOBEMPTMO and'
      '  IDTIPOEVENTOCOBEMPTMO = :OLD_IDTIPOEVENTOCOBEMPTMO and'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO and'
      '  DATAEVENTOCOB = :OLD_DATAEVENTOCOB')
    InsertSQL.Strings = (
      'insert into HISTEVENTOCOBEMPTMO'
      '  (IDHISTEVENTOCOBEMPTMO, IDTIPOEVENTOCOBEMPTMO, '
      'IDCONTRATOEMPTMO, DATAEVENTOCOB, '
      
        '   OBSCOB, CE, AR, SITAR, NUP, PROCJUD, NUMCRM, DTAJUIZAMENTO, J' +
        'URISDICAO)'
      'values'
      '  (:IDHISTEVENTOCOBEMPTMO, :IDTIPOEVENTOCOBEMPTMO, '
      ':IDCONTRATOEMPTMO, :DATAEVENTOCOB, '
      '   :OBSCOB, :CE, :AR, :SITAR, :NUP, :PROCJUD,'
      '   :NUMCRM, :DTAJUIZAMENTO, :JURISDICAO)')
    Left = 408
    Top = 120
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.IDTIPOEVENTOCOBEMPTMO, T.DESCEVENTOCOB FROM TIPOEVENTOC' +
        'OBEMPTMO T ORDER BY T.IDTIPOEVENTOCOBEMPTMO')
    ValidateWithMask = True
    Left = 256
    Top = 120
  end
end
