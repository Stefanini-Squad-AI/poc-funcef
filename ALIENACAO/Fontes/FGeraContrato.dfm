inherited frmGeraContrato: TfrmGeraContrato
  Left = 337
  Top = 146
  HelpContext = 1350002
  Caption = 'Geração de Contrato de Venda'
  ClientHeight = 406
  ClientWidth = 546
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 546
    Height = 367
    object pcBens: TPageControl
      Left = 1
      Top = 177
      Width = 544
      Height = 189
      ActivePage = tsEvento
      Align = alClient
      TabOrder = 0
      object tsEvento: TTabSheet
        Caption = 'Evento'
        object gbObs: TGroupBox
          Left = 5
          Top = 0
          Width = 518
          Height = 156
          Caption = 'Observações'
          TabOrder = 0
          object meObs: TMemo
            Left = 16
            Top = 21
            Width = 481
            Height = 120
            Lines.Strings = (
              'meObs')
            MaxLength = 2000
            TabOrder = 0
          end
        end
      end
      object tsBens: TTabSheet
        Caption = 'Bens'
        ImageIndex = 1
        object dbgrdBens: TwwDBGrid
          Left = 0
          Top = 0
          Width = 536
          Height = 161
          Selected.Strings = (
            'SEL_BEM'#9'3'#9#9'F'
            'DESBEM'#9'94'#9'Bem'#9'F'
            'NOME_GRUPO'#9'60'#9'Grupo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsBens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnDblClick = dbgrdBensDblClick
          IndicatorColor = icBlack
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 544
      Height = 176
      Align = alTop
      TabOrder = 1
      inline molComprador1: TmolComprador
        Left = 8
        Top = 53
        Width = 529
        inherited edtRazaoSocial: TEdit
          Left = 7
          Width = 465
          TabStop = False
          TabOrder = 2
        end
        inherited btnBuscaForn: TBitBtn
          Left = 472
          TabOrder = 0
          OnClick = molComprador1btnBuscaFornClick
        end
        inherited btnLimpaForn: TBitBtn
          Left = 496
          TabOrder = 1
        end
      end
      inline molProposta1: TmolProposta
        Left = 7
        Top = 9
        Width = 530
        TabOrder = 1
        inherited edtNomProp: TEdit
          Width = 361
          TabStop = False
          TabOrder = 2
        end
        inherited btnBuscaProp: TBitBtn
          Left = 472
          TabOrder = 0
          OnClick = molProposta1btnBuscaPropClick
        end
        inherited btnLimpaProp: TBitBtn
          Left = 496
          TabOrder = 1
        end
        inherited edtNumProp: TEdit
          TabStop = False
        end
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 100
        Width = 180
        Height = 58
        Caption = 'Data de Assinatura'
        TabOrder = 2
        object edDataAssinatura: TCMDateTimePicker
          Left = 15
          Top = 18
          Width = 150
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
      end
      object cbBaixa: TCheckBox
        Left = 205
        Top = 103
        Width = 297
        Height = 17
        Caption = 'Apenas baixa do Patrimônio o imóvel já alienado'
        TabOrder = 3
      end
      object rgTipoContrato: TRadioGroup
        Left = 205
        Top = 123
        Width = 289
        Height = 35
        Caption = ' Tipo de Contrato '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Alienação'
          'Acordo')
        TabOrder = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 367
    Width = 546
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 292
      inherited sep1: TToolbarSep97
        Left = 165
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 167
      end
      object btnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gerar'
        Enabled = False
        TabOrder = 2
        OnClick = btnGerarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65523
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.FLGTIPOCONTRATO,'
      '     CI.CONDATAASSINATURA,'
      '     CI.IDLOCATARIO,'
      '     CI.VLRPROPOSTA,'
      '     CI.VLRCONTABIL,'
      '     CI.FLGSTATUS'
      'FROM'
      '     CONTRATOIMOVEL CI'
      'WHERE'
      '     (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      ' ')
    UpdateObject = updQry
    ValidateWithMask = True
    Left = 248
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONNUMERO'
    end
    object qryCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONNOME'
      Size = 60
    end
    object qryFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.FLGTIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object qryIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.IDLOCATARIO'
    end
    object qryCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONDATAASSINATURA'
    end
    object qryFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qryVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.VLRPROPOSTA'
    end
    object qryVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.VLRCONTABIL'
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 283
    Top = 8
  end
  object updQry: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOIMOVEL'
      'set'
      '  CONNUMERO = :CONNUMERO,'
      '  CONNOME = :CONNOME,'
      '  FLGTIPOCONTRATO = :FLGTIPOCONTRATO,'
      '  CONDATAASSINATURA = :CONDATAASSINATURA,'
      '  IDLOCATARIO = :IDLOCATARIO,'
      '  VLRCONTABIL = :VLRCONTABIL,'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    InsertSQL.Strings = (
      'insert into CONTRATOIMOVEL'
      '  (IDCONTRATOIMOVEL, CONNUMERO, CONNOME, FLGTIPOCONTRATO, '
      'CONDATAASSINATURA, '
      '   IDLOCATARIO, VLRCONTABIL, FLGSTATUS)'
      'values'
      '  (:IDCONTRATOIMOVEL, :CONNUMERO, :CONNOME, :FLGTIPOCONTRATO, '
      ':CONDATAASSINATURA, '
      '   :IDLOCATARIO, :VLRCONTABIL, :FLGSTATUS)')
    DeleteSQL.Strings = (
      'delete from CONTRATOIMOVEL'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    Left = 328
    Top = 8
  end
  object qryImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CI.IDIMOVEL,'
      '       IM.IDIMOVELMESTRE,'
      '       CI.IDCONTRATOIMOVEL,'
      '       CI.VLRVENDA,'
      '       CI.VLRCONTABIL,'
      '       IM.FLGSTATUS,'
      '       IM.FLGATIVO,'
      '       IM.CODTIPIMOVEL,'
      '       IM.IMODATACOMPRA,'
      '       IM.IMOVLRCOMPRA,'
      '       DECODE(CI.FLGRATEIO, 1, CIMPERCENTRATEIO, 100) AS PERCENT'
      '  FROM CONTRATOXIMOVEL CI,'
      '       IMOVEL IM'
      ' WHERE CI.IDIMOVEL = IM.IDIMOVEL'
      '   AND CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL'
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
    Left = 248
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryImovelIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryImovelVLRVENDA: TFloatField
      FieldName = 'VLRVENDA'
    end
    object qryImovelVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
    end
    object qryImovelFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qryImovelFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryImovelPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
    object qryImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryImovelIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qryImovelIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
  end
  object qryCondPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCONTRATOIMOVEL,'
      '     IDCONDPAGIMOVEL,'
      '     DATAVENCIMENTO,'
      '     TIPOCONDPAG'
      'FROM'
      '     CONDPAGIMOVEL'
      'WHERE (TIPOCONDPAG <> '#39'R'#39')'
      '  AND (IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 328
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
    end
    object qryCondPagDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.DATAVENCIMENTO'
    end
    object qryCondPagTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.TIPOCONDPAG'
      FixedChar = True
      Size = 1
    end
  end
  object dsBens: TwwDataSource
    AutoEdit = False
    DataSet = qryBens
    Left = 267
    Top = 235
  end
  object qryBens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO, I.IMOCODI' +
        'GO,'
      
        '   IB.IDIMOVEL, IB.IDBEM, IB.IXBPERCENT, IB.IXBGRUPO, B.IDGRUPO,' +
        ' I.CODTIPIMOVEL,'
      
        '   B.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPONSAVEL, B.DESBEM, G.N' +
        'OME AS NOME_GRUPO,'
      '   0 AS VLR_BEM, 1 AS SEL_BEM'
      'FROM'
      
        '   IMOVEL I, IMOVEL IM, IMOVELXBEM IB, BEM B, CONJUNTO C, GRUPO ' +
        'G'
      'WHERE'
      '   IB.IDBEM = B.IDBEM'
      '   AND (I.IDIMOVEL = IB.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND ( B.IDGRUPO = G.IDGRUPO(+))'
      '   AND ( B.IDCONJUNTO = C.IDCONJUNTO(+) )'
      
        '   AND ( (:PBAIXATOTAL IS NULL) OR (B.BAIXATOTAL = :PBAIXATOTAL)' +
        ' )'
      '   AND ( (:PGRUPO IS NULL) OR (IB.IXBGRUPO = :PGRUPO) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (IB.IDIMOVEL = :PIDIMOVEL) )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR ((I.IDIMOVELMESTRE = :PID' +
        'IMOVELMESTRE) AND (I.FLGATIVO = 1)) )'
      '   AND ( (:PIDBEM    IS NULL) OR (IB.IDBEM = :PIDBEM) )'
      
        '   AND ( (:PDATAINCLUSAO IS NULL) OR (B.DTAINCLUSAO = :PDATAINCL' +
        'USAO) )'
      ''
      'ORDER BY IMOVEL_EXTENSO, IDIMOVEL, DESBEM'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBens
    ControlType.Strings = (
      'VLR_BEM;CheckBox;0;1'
      'SEL_BEM;CheckBox;1;0')
    ValidateWithMask = True
    Left = 337
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end>
    object qryBensSEL_BEM: TFloatField
      DisplayWidth = 5
      FieldName = 'SEL_BEM'
    end
    object qryBensDESBEM: TStringField
      DisplayLabel = 'Bem'
      DisplayWidth = 200
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBensNOME_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 60
      FieldName = 'NOME_GRUPO'
      Size = 60
    end
    object qryBensVLR_BEM: TFloatField
      DisplayLabel = '   '
      DisplayWidth = 3
      FieldName = 'VLR_BEM'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryBensIXBGRUPO: TStringField
      DisplayWidth = 9
      FieldName = 'IXBGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryBensIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryBensIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Visible = False
    end
    object qryBensIMOVEL_EXTENSO: TStringField
      DisplayWidth = 123
      FieldName = 'IMOVEL_EXTENSO'
      Visible = False
      Size = 123
    end
    object qryBensCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryBensIMOCODIGO: TStringField
      DisplayWidth = 15
      FieldName = 'IMOCODIGO'
      Visible = False
      Size = 15
    end
    object qryBensIXBPERCENT: TFloatField
      DisplayWidth = 10
      FieldName = 'IXBPERCENT'
      Visible = False
      DisplayFormat = '##0.00%'
    end
    object qryBensIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryBensIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Visible = False
    end
    object qryBensIDLOCALIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCALIZACAO'
      Visible = False
    end
    object qryBensIDRESPONSAVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
  end
  object updBens: TUpdateSQL
    Left = 432
    Top = 240
  end
end
