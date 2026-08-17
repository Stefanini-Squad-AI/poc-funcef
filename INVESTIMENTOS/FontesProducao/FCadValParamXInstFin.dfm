inherited frmCadValParamInstFinOld: TfrmCadValParamInstFinOld
  Left = 269
  Top = 49
  Caption = 'Cadastro de indicadores utilizados pela Instituição Financeira'
  ClientHeight = 377
  ClientWidth = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 522
    Height = 291
    object Label13: TLabel
      Left = 335
      Top = 29
      Width = 115
      Height = 13
      Caption = 'Regras Cadastradas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox10: TGroupBox
      Left = 257
      Top = 12
      Width = 249
      Height = 267
      Caption = 'Regra '
      TabOrder = 0
      object edRegraUsada: TEdit
        Left = 17
        Top = 17
        Width = 209
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnDragDrop = edRegraUsadaDragDrop
        OnDragOver = edRegraUsadaDragOver
      end
      object bbtnVerRegra7: TBitBtn
        Left = 17
        Top = 41
        Width = 209
        Height = 21
        Hint = 'Descrição dos Passos da Regra'
        Caption = 'Ver Regra Selecionada'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnVerRegra7Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
          00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
          00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
          F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
          F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
          FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
          0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
          00337777FFFF77FF7733EEEE0000000003337777777777777333}
        NumGlyphs = 2
      end
      object dblkplstRegra: TDBLookupListBox
        Left = 5
        Top = 74
        Width = 239
        Height = 186
        Hint = 
          'Utilize arrastar e colar para defirnir as regras do tipo de cont' +
          'rato.'
        DataField = 'IDREGRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDREGRA'
        ListField = 'NOMEREGRA'
        ListSource = dsRegra
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = dblkplstRegraDblClick
        OnDragDrop = dblkplstRegraDragDrop
        OnDragOver = dblkplstRegraDragOver
        OnMouseDown = dblkplstRegraMouseDown
      end
    end
    object bbCalcFator: TBitBtn
      Left = 193
      Top = 92
      Width = 31
      Height = 32
      Hint = 'Regra para cálculo de parcelas'
      Caption = 'bbCalcFator'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbCalcFatorClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 21
      Top = 12
      Width = 225
      Height = 129
      Caption = ' Instituição '
      TabOrder = 2
      object LbParaml: TLabel
        Left = 8
        Top = 72
        Width = 54
        Height = 13
        Caption = 'Indicador'
      end
      object Label2: TLabel
        Left = 8
        Top = 14
        Width = 29
        Height = 13
        Caption = 'Sigla'
      end
      object DBLkParam: TwwDBLookupCombo
        Left = 8
        Top = 89
        Width = 209
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPARAMINSTFIN'#9'40'#9'Indicador')
        DataField = 'IDPARAMINSTFIN'
        DataSource = ds
        LookupTable = QryParamXiNSTfIN
        LookupField = 'IDPARAMINSTFIN'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object DBLkInstFin: TwwDBLookupCombo
        Left = 8
        Top = 30
        Width = 209
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAINSTFIN'#9'40'#9'Instituição Financeira ')
        DataField = 'IDINSTFIN'
        DataSource = ds
        LookupTable = QryInstFin
        LookupField = 'IDINSTFIN'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnExit = DBLkInstFinExit
      end
    end
    object GroupBox2: TGroupBox
      Left = 21
      Top = 150
      Width = 225
      Height = 129
      Caption = 'Dados'
      TabOrder = 3
      object LblData: TLabel
        Left = 8
        Top = 68
        Width = 32
        Height = 13
        Caption = 'Data '
      end
      object Label1: TLabel
        Left = 8
        Top = 14
        Width = 34
        Height = 13
        Caption = 'Valor '
      end
      object dbeDataRef: TCMDateTimePicker
        Left = 8
        Top = 84
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAREFPRINSTFIN'
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
        TabOrder = 0
      end
      object REdtValor: TRealEdit
        Left = 8
        Top = 36
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 522
  end
  inherited Dock971: TDock97
    Top = 338
    Width = 522
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update cm.valparamxInstFin'
      'set'
      '  IDPARAMINSTFIN = :IDPARAMINSTFIN,'
      '  DATAREFPRINSTFIN = :DATAREFPRINSTFIN,'
      '  IDINSTFIN = :IDINSTFIN,'
      '  VLRPARAMINSTFIN = :VLRPARAMINSTFIN,'
      '  IDREGRAUSOINSTFIN = :IDREGRAUSOINSTFIN'
      'where'
      '  IDPARAMINSTFIN = :OLD_IDPARAMINSTFIN AND'
      '  DATAREFPRINSTFIN = :OLD_DATAREFPRINSTFIN AND'
      '  IDINSTFIN = :OLD_IDINSTFIN'
      '')
    InsertSQL.Strings = (
      'insert into cm.valparamxInstFin'
      
        '  (IDPARAMINSTFIN, DATAREFPRINSTFIN, IDINSTFIN, VLRPARAMINSTFIN,' +
        ' IDREGRAUSOINSTFIN)'
      'values'
      
        '  (:IDPARAMINSTFIN, :DATAREFPRINSTFIN, :IDINSTFIN, :VLRPARAMINST' +
        'FIN, :IDREGRAUSOINSTFIN)')
    DeleteSQL.Strings = (
      'delete from cm.valparamxInstFin'
      'where'
      '  IDPARAMINSTFIN = :OLD_IDPARAMINSTFIN')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IDINSTFIN'
      'IDPARAMINSTFIN'
      'DATAREFPRINSTFIN')
    TipodeDado.Strings = (
      'N'
      'N'
      'D')
    Descricao.Strings = (
      'Instituição'
      'Parâmetro'
      'Data')
    Tabelas.Strings = (
      'CM.VALPARAMXINSTFIN')
    CamposChave.Strings = (
      'IDPARAMINSTFIN'
      'IDINSTFIN'
      'DATAREFPRINSTFIN')
    Left = 362
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterPost = qryAfterPost
    AfterScroll = qryAfterScroll
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select       VPI.IdParamInstFin,'
      '                VPI.IdInstFin,'
      '                VPI.DataRefPrInstFin ,'
      '                VPI.IdRegraUsoInstFin, '
      '                VPI.VlrParamInstFin '
      ''
      'from         cm.ValParamXInstFin VPI')
    object qryIDPARAMINSTFIN: TFloatField
      FieldName = 'IDPARAMINSTFIN'
      Origin = 'VALPARAMXINSTFIN.IDPARAMINSTFIN'
    end
    object qryIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
      Origin = 'VALPARAMXINSTFIN.IDINSTFIN'
    end
    object qryDATAREFPRINSTFIN: TDateTimeField
      FieldName = 'DATAREFPRINSTFIN'
      Origin = 'VALPARAMXINSTFIN.DATAREFPRINSTFIN'
    end
    object qryIDREGRAUSOINSTFIN: TFloatField
      FieldName = 'IDREGRAUSOINSTFIN'
      Origin = 'VALPARAMXINSTFIN.IDREGRAUSOINSTFIN'
    end
    object qryVLRPARAMINSTFIN: TFloatField
      FieldName = 'VLRPARAMINSTFIN'
      Origin = 'VALPARAMXINSTFIN.VLRPARAMINSTFIN'
    end
  end
  object QryParamXiNSTfIN: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select        PXI.IdParamInstFin,'
      '                 PXI.IdInstFin,'
      '                 P.DESCPARAMINSTFIN,'
      '                 P.IDPARAMINSTFIN '
      ''
      'from        CM.PARAMXINSTFIN PXI ,'
      '              CM.PARAMINSTFIN P'
      ''
      'where     (P.IDPARAMINSTFIN = PXI.IDPARAMINSTFIN)')
    ValidateWithMask = True
    Left = 32
    Top = 151
  end
  object DSParamXiNSTfIN: TwwDataSource
    DataSet = QryParamXiNSTfIN
    Left = 64
    Top = 151
  end
  object QryInstFin: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select IF.IDINSTFIN,'
      '          IF.SIGLAINSTFIN'
      'from   cm.InstFin IF')
    ValidateWithMask = True
    Left = 32
    Top = 95
    object QryInstFinSIGLAINSTFIN: TStringField
      DisplayLabel = 'Instituição Financeira '
      DisplayWidth = 40
      FieldName = 'SIGLAINSTFIN'
      Size = 10
    end
    object QryInstFinIDINSTFIN: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINSTFIN'
      Visible = False
    end
  end
  object DSInstFin: TwwDataSource
    DataSet = QryInstFin
    Left = 64
    Top = 95
  end
  object dsRegra: TDataSource
    DataSet = qryRegra
    Left = 237
    Top = 91
  end
  object qryRegra: TQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select         A.IDREGRA,'
      '                   A.NOMEREGRA'
      ''
      'From           CM.REGRA A'
      ''
      'Order by      A.NOMEREGRA')
    Left = 206
    Top = 91
    object qryRegraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'REGRA.IDREGRA'
    end
    object qryRegraNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'REGRA.NOMEREGRA'
      Size = 60
    end
  end
  object qryProcura: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 392
    Top = 8
  end
end
