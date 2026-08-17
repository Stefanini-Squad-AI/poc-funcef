inherited frmInvProcessar: TfrmInvProcessar
  Left = 6
  Top = 97
  HelpContext = 70025
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Processa o Levantamento de Inventário'
  ClientHeight = 423
  ClientWidth = 777
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 777
    Height = 389
    object pnlMestre: TPanel
      Left = 5
      Top = 5
      Width = 767
      Height = 68
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 154
        Top = 6
        Width = 65
        Height = 13
        Caption = 'Data Início'
      end
      object Label1: TLabel
        Left = 16
        Top = 6
        Width = 99
        Height = 13
        Caption = 'Levantamento Nº'
      end
      object Label4: TLabel
        Left = 278
        Top = 6
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object GroupBox1: TGroupBox
        Left = 528
        Top = 7
        Width = 225
        Height = 41
        Enabled = False
        TabOrder = 3
        object edDataFim: TCMDateTimePicker
          Left = 112
          Top = 13
          Width = 105
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
        object ckbEncerrado: TCheckBox
          Left = 8
          Top = 15
          Width = 97
          Height = 17
          Caption = 'Encerrado em'
          TabOrder = 1
        end
      end
      object Panel2: TPanel
        Left = 151
        Top = 21
        Width = 121
        Height = 23
        BevelOuter = bvNone
        Caption = 'Panel2'
        Enabled = False
        TabOrder = 1
        object dbeDataInicio: TCMDateTimePicker
          Left = 2
          Top = 1
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINILEVANT'
          DataSource = dsInventBens
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
      object btnBuscaMestre: TBitBtn
        Left = 120
        Top = 22
        Width = 21
        Height = 21
        TabOrder = 0
        OnClick = btnBuscaMestreClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object dbeIdInventario: TwwDBEdit
        Left = 16
        Top = 22
        Width = 105
        Height = 21
        DataField = 'IDINVENTARIOBENS'
        DataSource = dsInventBens
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeResponsavel: TwwDBEdit
        Left = 278
        Top = 22
        Width = 241
        Height = 21
        DataField = 'NOMERESP'
        DataSource = dsInventBens
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlDetalhe: TPanel
      Left = 5
      Top = 73
      Width = 767
      Height = 311
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object dbGrd: TwwDBGrid
        Left = 1
        Top = 1
        Width = 765
        Height = 309
        Selected.Strings = (
          'PLACA'#9'14'#9'Patrimonio Nº'#9'No'
          'DESBEM'#9'80'#9'Descrição do Bem'#9'No'
          'DESCFLGPLACA'#9'20'#9'Status'#9'No'
          'NOMELOCAATUAL'#9'40'#9'da Localização'#9'No'
          'NOMELOCANOVO'#9'40'#9'para a Localização'#9'No'
          'DESCCONJATUAL'#9'60'#9'do Conjunto'#9'No'
          'DESCCONJNOVO'#9'60'#9'para o Conjunto'#9'No')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbGrdCalcCellColors
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 777
    Height = 34
    inherited tb97Fundo: TToolbar97
      Left = 589
      DockPos = 589
      inherited bbtnSair: TBitBtn
        Height = 28
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Height = 28
        HelpContext = 70025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 291
      DockPos = 291
      inherited ToolbarSep971: TToolbarSep97
        Left = 210
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 210
        Height = 28
        Caption = '&Gerar Termo de Transferência'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 213
        Height = 28
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 659
    Top = 475
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryInventBens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IB.IDINVENTARIOBENS,'
      '       IB.IDEMPRESA,'
      '       IB.IDRESPONSAVEL,'
      '       IB.DATAINILEVANT,'
      '       IB.DATAFIMLEVANT,'
      '       IB.STATUS,'
      '       IB.IDSELBAIXA,'
      '       P.NOME AS NOMERESP'
      'FROM INVENTARIOBENS IB,'
      '     PESSOA         P'
      'WHERE (IB.IDINVENTARIOBENS = :PIDINVENTARIOBENS)'
      '  AND (IB.IDEMPRESA        = :PIDEMPRESA)'
      '  AND (IB.STATUS >= 1)'
      '  AND (IB.IDRESPONSAVEL    = P.IDPESSOA(+))')
    UpdateObject = updInventBens
    ValidateWithMask = True
    Left = 520
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDINVENTARIOBENS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryInventBensIDINVENTARIOBENS: TFloatField
      FieldName = 'IDINVENTARIOBENS'
    end
    object qryInventBensIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryInventBensIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryInventBensDATAINILEVANT: TDateTimeField
      FieldName = 'DATAINILEVANT'
    end
    object qryInventBensDATAFIMLEVANT: TDateTimeField
      FieldName = 'DATAFIMLEVANT'
    end
    object qryInventBensSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object qryInventBensIDSELBAIXA: TFloatField
      FieldName = 'IDSELBAIXA'
    end
    object qryInventBensNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
  end
  object dsInventBens: TwwDataSource
    AutoEdit = False
    DataSet = qryInventBens
    Left = 592
    Top = 208
  end
  object updInventBens: TUpdateSQL
    ModifySQL.Strings = (
      'update INVENTARIOBENS'
      'set'
      '  STATUS = :STATUS,'
      '  IDSELBAIXA = :IDSELBAIXA'
      'where'
      '  IDINVENTARIOBENS = :OLD_IDINVENTARIOBENS and'
      '  IDEMPRESA = :OLD_IDEMPRESA')
    InsertSQL.Strings = (
      'insert into INVENTARIOBENS'
      '  (STATUS, IDSELBAIXA)'
      'values'
      '  (:STATUS, :IDSELBAIXA)')
    DeleteSQL.Strings = (
      'delete from INVENTARIOBENS'
      'where'
      '  IDINVENTARIOBENS = :OLD_IDINVENTARIOBENS and'
      '  IDEMPRESA = :OLD_IDEMPRESA')
    Left = 664
    Top = 208
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT I.IDINVENTARIOBENS,'
      '       I.IDEMPRESA,'
      '       I.IIBPLACA,'
      '       I.IIBIDBEM,'
      '       I.IIBFLGPLACA,'
      '       I.IIBLOCALATUAL,'
      '       I.IIBCONJUNTOATUAL,'
      '       I.IIBLOCALNOVO,'
      '       I.IIBCONJUNTONOVO,'
      '       I.IIBFLGSITFISICA,'
      
        '       B.PLACA, B.DESBEM, B.IDBEM, B.IDPESSOA, B.IDCONJUNTO, B.I' +
        'DGRUPO, B.IDCLASSEBEM,'
      '       LN.IDLOCALIZACAO,'
      '       DECODE(I.IIBFLGPLACA,0,'#39'...                 '#39','
      '       DECODE(I.IIBFLGPLACA,1,'#39'Ok                  '#39','
      '       DECODE(I.IIBFLGPLACA,2,'#39'Placa não encontrada'#39','
      '       DECODE(I.IIBFLGPLACA,3,'#39'Placa EM outro Local'#39','
      
        '       DECODE(I.IIBFLGPLACA,4,'#39'Placa DE outro Local'#39','#39'...       ' +
        '          '#39'))))) AS DESCFLGPLACA,'
      
        '       CA.DESCCONJUNTO AS DESCCONJATUAL, LA.NOME AS NOMELOCAATUA' +
        'L,'
      '       CN.DESCCONJUNTO AS DESCCONJNOVO,  LN.NOME AS NOMELOCANOVO'
      'FROM ITENSINVBENS I,'
      '     BEM B,'
      '     CONJUNTO CA,'
      '     LOCALIZACAO LA,'
      '     CONJUNTO CN,'
      '     LOCALIZACAO LN'
      'WHERE (I.IDINVENTARIOBENS = :PIDINVENTARIOBENS)'
      '  AND (I.IDEMPRESA        = :PIDEMPRESA)'
      '  AND (I.IIBFLGPLACA IN (02,03,04))'
      '  AND (I.IIBIDBEM        = B.IDBEM)'
      '  AND (B.IDCONJUNTO      = CA.IDCONJUNTO)'
      '  AND (CA.IDLOCALIZACAO  = LA.IDLOCALIZACAO)'
      '  AND (I.IIBCONJUNTONOVO = CN.IDCONJUNTO)'
      '  AND (I.IIBLOCALNOVO    = LN.IDLOCALIZACAO)'
      ''
      'ORDER BY I.IIBFLGPLACA,I.IIBPLACA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 536
    Top = 320
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDINVENTARIOBENS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryPLACA: TFloatField
      DisplayLabel = 'Patrimonio Nº'
      DisplayWidth = 14
      FieldName = 'PLACA'
    end
    object qryDESBEM: TStringField
      DisplayLabel = 'Descrição do Bem'
      DisplayWidth = 80
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryDESCFLGPLACA: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'DESCFLGPLACA'
    end
    object qryNOMELOCAATUAL: TStringField
      DisplayLabel = 'da Localização'
      DisplayWidth = 40
      FieldName = 'NOMELOCAATUAL'
      Size = 60
    end
    object qryNOMELOCANOVO: TStringField
      DisplayLabel = 'para a Localização'
      DisplayWidth = 40
      FieldName = 'NOMELOCANOVO'
      Size = 60
    end
    object qryDESCCONJATUAL: TStringField
      DisplayLabel = 'do Conjunto'
      DisplayWidth = 60
      FieldName = 'DESCCONJATUAL'
      Size = 200
    end
    object qryDESCCONJNOVO: TStringField
      DisplayLabel = 'para o Conjunto'
      DisplayWidth = 60
      FieldName = 'DESCCONJNOVO'
      Size = 200
    end
    object qryIDINVENTARIOBENS: TFloatField
      FieldName = 'IDINVENTARIOBENS'
      Visible = False
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryIIBPLACA: TFloatField
      FieldName = 'IIBPLACA'
      Visible = False
    end
    object qryIIBFLGPLACA: TFloatField
      FieldName = 'IIBFLGPLACA'
      Visible = False
    end
    object qryIIBLOCALATUAL: TFloatField
      FieldName = 'IIBLOCALATUAL'
      Visible = False
    end
    object qryIIBCONJUNTOATUAL: TFloatField
      FieldName = 'IIBCONJUNTOATUAL'
      Visible = False
    end
    object qryIIBLOCALNOVO: TFloatField
      FieldName = 'IIBLOCALNOVO'
      Visible = False
    end
    object qryIIBCONJUNTONOVO: TFloatField
      FieldName = 'IIBCONJUNTONOVO'
      Visible = False
    end
    object qryIIBFLGSITFISICA: TFloatField
      FieldName = 'IIBFLGSITFISICA'
      Visible = False
    end
    object qryIDBEM: TFloatField
      FieldName = 'IDBEM'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Visible = False
    end
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Visible = False
    end
    object qryIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Visible = False
    end
    object qryIIBIDBEM: TFloatField
      FieldName = 'IIBIDBEM'
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 576
    Top = 320
  end
  object qryTermo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDSELBAIXA,'
      '       SBTIPOMOV,'
      '       SBXTERMO        ,'
      '       SBXPROCESSO     ,'
      '       SBXDATA         ,'
      '       IDRESPONSAVEL,'
      '       SBXFLGEXECUTADO ,'
      '       SBXDTAEXECUTADO'
      'FROM  SELBAIXA'
      'WHERE (IDSELBAIXA =:PIDSELBAIXA)')
    UpdateObject = updTermo
    ValidateWithMask = True
    Left = 280
    Top = 188
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDSELBAIXA'
        ParamType = ptUnknown
      end>
    object qryTermoIDSELBAIXA: TFloatField
      FieldName = 'IDSELBAIXA'
    end
    object qryTermoSBTIPOMOV: TFloatField
      FieldName = 'SBTIPOMOV'
    end
    object qryTermoSBXTERMO: TFloatField
      FieldName = 'SBXTERMO'
    end
    object qryTermoSBXPROCESSO: TStringField
      FieldName = 'SBXPROCESSO'
      Size = 80
    end
    object qryTermoSBXDATA: TDateTimeField
      FieldName = 'SBXDATA'
    end
    object qryTermoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryTermoSBXFLGEXECUTADO: TFloatField
      FieldName = 'SBXFLGEXECUTADO'
    end
    object qryTermoSBXDTAEXECUTADO: TDateTimeField
      FieldName = 'SBXDTAEXECUTADO'
    end
  end
  object dsTermo: TwwDataSource
    AutoEdit = False
    DataSet = qryTermo
    Left = 280
    Top = 174
  end
  object updTermo: TUpdateSQL
    ModifySQL.Strings = (
      'update SELBAIXA'
      'set'
      '  SBTIPOMOV = :SBTIPOMOV,'
      '  SBXTERMO = :SBXTERMO,'
      '  SBXPROCESSO = :SBXPROCESSO,'
      '  SBXDATA = :SBXDATA,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  SBXFLGEXECUTADO = :SBXFLGEXECUTADO,'
      '  SBXDTAEXECUTADO = :SBXDTAEXECUTADO'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA')
    InsertSQL.Strings = (
      'insert into SELBAIXA'
      
        '  (IDSELBAIXA, SBTIPOMOV, SBXTERMO, SBXPROCESSO, SBXDATA, IDRESP' +
        'ONSAVEL, '
      '   SBXFLGEXECUTADO, SBXDTAEXECUTADO)'
      'values'
      
        '  (:IDSELBAIXA, :SBTIPOMOV, :SBXTERMO, :SBXPROCESSO, :SBXDATA, :' +
        'IDRESPONSAVEL, '
      '   :SBXFLGEXECUTADO, :SBXDTAEXECUTADO)')
    DeleteSQL.Strings = (
      'delete from SELBAIXA'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA')
    Left = 280
    Top = 160
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SBB.IDSELBAIXA,'
      '       SBB.IDBEM,'
      '       SBB.IDPESSOA,'
      '       SBB.IDCONJUNTO,'
      '       SBB.IDGRUPO,'
      '       SBB.IDLOCALIZACAO,'
      '       SBB.IDRESPONSAVEL,'
      '       SBB.IDCONJATUAL,'
      '       SBB.IDGRUPATUAL,'
      '       SBB.IDLOCALATUAL,'
      '       SBB.IDRESPATUAL'
      'FROM SELBAIXABENS SBB'
      'WHERE (SBB.IDSELBAIXA  = :PIDSELBAIXA)'
      ''
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'SELECTED;CheckBox;Yes;No')
    ValidateWithMask = True
    Left = 344
    Top = 188
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDSELBAIXA'
        ParamType = ptUnknown
      end>
    object qryDetIDSELBAIXA: TFloatField
      FieldName = 'IDSELBAIXA'
    end
    object qryDetIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDetIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryDetIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryDetIDCONJATUAL: TFloatField
      FieldName = 'IDCONJATUAL'
    end
    object qryDetIDGRUPATUAL: TFloatField
      FieldName = 'IDGRUPATUAL'
    end
    object qryDetIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'SELBAIXABENS.IDLOCALIZACAO'
    end
    object qryDetIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'SELBAIXABENS.IDRESPONSAVEL'
    end
    object qryDetIDLOCALATUAL: TFloatField
      FieldName = 'IDLOCALATUAL'
      Origin = 'SELBAIXABENS.IDLOCALATUAL'
    end
    object qryDetIDRESPATUAL: TFloatField
      FieldName = 'IDRESPATUAL'
      Origin = 'SELBAIXABENS.IDRESPATUAL'
    end
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 344
    Top = 174
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update SELBAIXABENS'
      'set'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDCONJATUAL = :IDCONJATUAL,'
      '  IDGRUPATUAL = :IDGRUPATUAL,'
      '  IDLOCALATUAL = :IDLOCALATUAL,'
      '  IDRESPATUAL = :IDRESPATUAL'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into SELBAIXABENS'
      
        '  (IDSELBAIXA, IDBEM, IDPESSOA, IDCONJUNTO, IDGRUPO, IDLOCALIZAC' +
        'AO, IDRESPONSAVEL, '
      '   IDCONJATUAL, IDGRUPATUAL, IDLOCALATUAL, IDRESPATUAL)'
      'values'
      
        '  (:IDSELBAIXA, :IDBEM, :IDPESSOA, :IDCONJUNTO, :IDGRUPO, :IDLOC' +
        'ALIZACAO, '
      
        '   :IDRESPONSAVEL, :IDCONJATUAL, :IDGRUPATUAL, :IDLOCALATUAL, :I' +
        'DRESPATUAL)')
    DeleteSQL.Strings = (
      'delete from SELBAIXABENS'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 344
    Top = 160
  end
  object qryVerificaGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GXCC.IDGRUPO'
      'FROM CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     GRUPOBEMXCC GXCC'
      'WHERE (C.IDCONJUNTO        = :PIDCONJUNTO)'
      '  AND (GXCC.IDGRUPO        = :PIDGRUPO)'
      '  AND (C.IDLOCALIZACAO     = L.IDLOCALIZACAO)'
      '  AND (L.CODCENTROCUSTO    = GXCC.CODCENTROCUSTO)'
      '  AND (L.IDEMPRESA         = GXCC.IDEMPRESA)'
      '')
    ValidateWithMask = True
    Left = 72
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryVerificaGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
  end
  object qryBuscaGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GXCC.IDGRUPO'
      'FROM CLASSEXGRUPO CXG,'
      '     GRUPOBEMXCC GXCC,'
      '     LOCALIZACAO L'
      'WHERE (CXG.IDCLASSEBEM     = :PIDCLASSE)'
      '  AND (L.IDLOCALIZACAO     = :PIDLOCAL)'
      '  AND (CXG.IDGRUPO         = GXCC.IDGRUPO)'
      '  AND (GXCC.CODCENTROCUSTO = L.CODCENTROCUSTO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCLASSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end>
    object qryBuscaGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
  end
  object MSInventBens: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona o Levantamento de Inventário'
    Colunas.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'PESSOA.NOME'
      'INVENTARIOBENS.DATAINILEVANT'
      'INVENTARIOBENS.DATAFIMLEVANT')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Nº Levantamento'
      'Responsável'
      'Data Início'
      'Data Término')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTARIOBENS'
      'PESSOA')
    CamposChave.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'INVENTARIOBENS.IDEMPRESA')
    Filtro.Strings = (
      'INVENTARIOBENS.STATUS < 2'
      'INVENTARIOBENS.IDRESPONSAVEL=PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 150
    Top = 96
  end
  object qryBensEscravos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, IDBEM, PLACA'
      'FROM BEM'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '  AND (SUBSTR(TO_CHAR(PLACA), 1, :TAM) = :PLACABASE)'
      '  AND (PLACA <> :PLACAMESTRE)'
      'ORDER BY PLACA'
      ' ')
    ValidateWithMask = True
    Left = 520
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACABASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLACAMESTRE'
        ParamType = ptUnknown
      end>
    object qryBensEscravosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBensEscravosIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBensEscravosPLACA: TFloatField
      FieldName = 'PLACA'
    end
  end
  object qryLocal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.IDLOCALIZACAO, L.IDRESPONSAVEL'
      'FROM   LOCALIZACAO L'
      'WHERE  (L.IDLOCALIZACAO = :PIDLOCAL)'
      '  AND  (L.IDPESSOA      = :PIDEMPRESA)'
      '')
    ValidateWithMask = True
    Left = 416
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryLocalIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'LOCALIZACAO.IDLOCALIZACAO'
    end
    object qryLocalIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'LOCALIZACAO.IDRESPONSAVEL'
    end
  end
  object qryRemSelBaixa: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'DELETE FROM SELBAIXA'
      'WHERE (IDSELBAIXA = :IDSELBAIXA)'
      '   '
      ' ')
    ValidateWithMask = True
    Left = 357
    Top = 273
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDSELBAIXA'
        ParamType = ptUnknown
      end>
  end
  object qryRemSelBaixaBens: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'DELETE FROM SELBAIXABENS'
      'WHERE (IDSELBAIXA = :IDSELBAIXA)'
      '   '
      ' ')
    ValidateWithMask = True
    Left = 357
    Top = 259
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSELBAIXA'
        ParamType = ptUnknown
      end>
  end
end
