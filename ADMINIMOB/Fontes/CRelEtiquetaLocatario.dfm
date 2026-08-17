inherited cfgRelEtiquetaLocatario: TcfgRelEtiquetaLocatario
  Left = 99
  Top = 220
  HelpContext = 640010
  Caption = 'Etiquetas para Locatários'
  ClientHeight = 235
  ClientWidth = 538
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 538
    Height = 202
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 111
      Height = 13
      Caption = 'Modelo da Etiqueta'
    end
    object btnModeloEtiqueta: TfcShapeBtn
      Left = 392
      Top = 16
      Width = 129
      Height = 41
      Caption = 'Modelo de'#13#10'Etiqueta'
      Color = clBtnFace
      DitherColor = clWhite
      Glyph.Data = {
        1E040000424D1E04000000000000760000002800000030000000270000000100
        040000000000A803000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8777777777777777888888888888888888888880000000000000000000000007
        888888888888888888888880FBFBFBFBFBFBFBFBFBFBFB078888888888888888
        88888880B0BFBFB0BFBFB0BFBFB0BF07888888888888888888888880F0FB0BF0
        FB0BF0FB0BF0FB07888888888888888888888880000000000000000000000008
        88888888888888888888888880EEEEEEEEEEEEE0788888888888888888888888
        8888888880EEEEEEEEEEEE078888888888888888888888888888888880EE0000
        0EEEE07F8F8F8F8888888888888888888888888880EE0870EEEE07F8F8F8F8F8
        88888888888888888888888880EE080EEEE0077F8F8F8F888888888888888888
        8888888880EE00EEEE0770007788888888888888888888888888888880EE0EEE
        E07887F70077888888888888888888888888888880EEEEEE078887FF77077788
        88888888888888888888888880EEEEE08888887FF70088778888888888888888
        8888888880EEEE088888887FF033087778888888888888888888888880EEE088
        88888880F003307778888888888888888888888880EE0888888888880BB03307
        78778888888888888888888880E088888888888880BB03307888888888888888
        888888888008888888888888880BB03308777777787888888888888880888888
        888888888880BB0330F888888877888888888888888888888888888888880BB0
        3308877777777788888888888888888888888888888880BB0330888777777777
        8888888888888888888888888888880BB0330888877777777888888888888888
        8888888888888880BB0330888880000008888888888888888888888888888888
        0BB03308888880008888888888888888888888888888888880BB006088888888
        88888888888888888888888888888888880B0E00088888888888888888888888
        88888888888888888880E0870088888888888888888888888888888888888888
        88880F887088888888888888888888888888888888888888888880F808888888
        8888888888888888888888888888888888888800888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888}
      Margin = 8
      ParentClipping = True
      RoundRectBias = 25
      ShadeColors.Btn3DLight = 14671839
      ShadeColors.BtnHighlight = 15724527
      ShadeColors.BtnShadow = 6316128
      ShadeColors.BtnBlack = 3158064
      ShadeStyle = fbsHighlight
      Spacing = 2
      TabOrder = 1
      TextOptions.Alignment = taLeftJustify
      TextOptions.LineSpacing = 1
      TextOptions.VAlignment = vaVCenter
      TextOptions.WordWrap = True
      OnClick = btnModeloEtiquetaClick
    end
    object DBcboEtiqueta: TwwDBLookupCombo
      Left = 16
      Top = 24
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MODELOETIQ'#9'60'#9'MODELOETIQ')
      LookupTable = qryModeloEtiq
      LookupField = 'IDETIQUETA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnDropDown = DBcboEtiquetaDropDown
    end
    object rdgContrato: TRadioGroup
      Left = 376
      Top = 144
      Width = 249
      Height = 41
      Caption = 'Contratos'
      Columns = 2
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        '&Locação'
        '&Remuneração')
      TabOrder = 2
      Visible = False
    end
    object chkMatricial: TCheckBox
      Left = 16
      Top = 168
      Width = 225
      Height = 17
      Caption = 'Etiquetas para Impressora Matricial'
      TabOrder = 4
    end
    object MemReports: TMemo
      Left = 280
      Top = 24
      Width = 75
      Height = 21
      Color = clAqua
      Lines.Strings = (
        'MemReport'
        's')
      TabOrder = 5
      Visible = False
    end
    object chkFolha: TCheckBox
      Left = 16
      Top = 149
      Width = 241
      Height = 17
      Caption = 'Somente Locatários da Folha Aluguéis'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    inline molResponsavel1: TmolResponsavel
      Left = 8
      Top = 56
      Width = 524
      TabOrder = 6
      inherited edtResponsavel: TEdit
        Width = 457
      end
      inherited btnBuscaResponsavel: TBitBtn
        Left = 464
      end
      inherited btnLimpaResponsavel: TBitBtn
        Left = 488
      end
      inherited btnAbrePessoa: TBitBtn
        Left = 280
        Visible = False
      end
    end
    inline molAdministradora1: TmolAdministradora
      Left = 8
      Top = 96
      Width = 521
      TabOrder = 7
      inherited edtAdministradora: TEdit
        Width = 457
      end
      inherited btnBuscaAdministradora: TBitBtn
        Left = 464
      end
      inherited btnLimpaAdministradora: TBitBtn
        Left = 488
      end
      inherited btnAbrePessoa: TBitBtn
        Left = 280
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 202
    Width = 538
    inherited tb97Fundo: TToolbar97
      Left = 366
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object qryModeloEtiq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDETIQUETA, MODELOETIQ, IDREPORTS, ORIGEMCM    '
      'FROM ETIQUETA'
      'ORDER BY MODELOETIQ')
    ValidateWithMask = True
    Left = 232
    Top = 21
    object qryModeloEtiqMODELOETIQ: TStringField
      DisplayWidth = 60
      FieldName = 'MODELOETIQ'
      Origin = 'ETIQUETA.MODELOETIQ'
      Size = 60
    end
    object qryModeloEtiqIDETIQUETA: TFloatField
      FieldName = 'IDETIQUETA'
      Origin = 'ETIQUETA.IDETIQUETA'
      Visible = False
    end
    object qryModeloEtiqIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'ETIQUETA.IDREPORTS'
      Visible = False
    end
    object qryModeloEtiqORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'ETIQUETA.ORIGEMCM'
      Visible = False
    end
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 160
    Top = 21
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object pplEtiquetasLocatario: TppBDEPipeline
    DataSource = dsEtiquetasLocatario
    UserName = 'lEtiquetasLocatario'
    Left = 288
    Top = 160
  end
  object dsEtiquetasLocatario: TwwDataSource
    DataSet = qryEtiquetasLocatario
    Left = 288
    Top = 148
  end
  object qryEtiquetasLocatario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '   P.IDPESSOA, P.RAZAOSOCIAL AS NOME, E.LOGRADOURO, E.NUMERO, E.' +
        'COMPLEMENTO,'
      
        '   E.BAIRRO, CD.NOME AS CIDADE, E.CODESTADO, E.CEP, CP.NOME AS C' +
        'ONTATO'
      'FROM'
      
        '   PESSOA P, ENDPESS E, CONTATOPESS CP, CONTRATOIMOVEL C, CIDADE' +
        'S CD'
      ''
      'WHERE'
      '   1=2 AND   ( C.IDPESSOA =:PIDPESSOA )'
      
        '   AND ( ( C.CONDATAFIM >= :PCONDATAFIM ) OR ( C.FLGINDETERMINAD' +
        'O = '#39'S'#39' ) )'
      '   AND ( P.IDENDCOBRANCA = E.IDENDERECO (+) )'
      '   AND ( P.IDENDCOBRANCA = CP.IDENDERECO (+) )'
      '   AND ( P.IDPESSOA  = C.IDLOCATARIO )'
      '   AND ( E.IDCIDADES = CD.IDCIDADES (+) )'
      ''
      '   AND ( C.CONDATACARENCIA < :PCONDATACARENCIA )'
      '   AND ( C.FLGTIPOCONTRATO = :PFLGTIPOCONTRATO )'
      
        '   AND ( (:PIDADMINIMOVEL IS NULL)    OR (C.IDADMINIMOVEL = :PID' +
        'ADMINIMOVEL) )'
      
        '   AND ( (:PFLGCOBRANCAAUTO IS NULL ) OR (C.FLGCOBRANCAAUTO =:PF' +
        'LGCOBRANCAAUTO ) )'
      
        '   AND ( (:PIDRESPONSAVEL IS NULL)    OR (C.IDRESPONSAVEL =:PIDR' +
        'ESPONSAVEL) )'
      ''
      ''
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PCONDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PCONDATACARENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCOBRANCAAUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCOBRANCAAUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end>
    object qryEtiquetasLocatarioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryEtiquetasLocatarioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryEtiquetasLocatarioLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryEtiquetasLocatarioNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryEtiquetasLocatarioCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryEtiquetasLocatarioBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryEtiquetasLocatarioCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryEtiquetasLocatarioCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryEtiquetasLocatarioCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryEtiquetasLocatarioCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
  end
end
