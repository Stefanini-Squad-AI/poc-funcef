inherited FrmEfetivCaixaPeq: TFrmEfetivCaixaPeq
  Left = 9
  Top = 113
  Caption = 'Efetiva Lançamento de Caixa Pequeno'
  ClientHeight = 395
  ClientWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 744
    Height = 356
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 86
      Height = 13
      Caption = 'Caixa Pequeno'
    end
    object Label2: TLabel
      Left = 400
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Favorecido'
    end
    object Label3: TLabel
      Left = 17
      Top = 67
      Width = 174
      Height = 13
      Caption = 'Valor Total dos Lançamentos :'
    end
    object lblDataLanc: TLabel
      Left = 16
      Top = 96
      Width = 111
      Height = 13
      Caption = 'Data da Efetivação'
    end
    object Label4: TLabel
      Left = 400
      Top = 64
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object Label5: TLabel
      Left = 168
      Top = 96
      Width = 63
      Height = 13
      Caption = 'Referência'
    end
    object dblcCaixaPeq: TCMDBLookupCombo
      Left = 16
      Top = 32
      Width = 369
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCAIXAPEQ'#9'60'#9'descrição'#9'F')
      LookupTable = qryCP
      LookupField = 'IDCAIXAPEQUENO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCaixaPeqCloseUp
    end
    object edFavo: TDBEdit
      Left = 400
      Top = 32
      Width = 321
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'RAZAOSOCIAL'
      DataSource = dsForn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edValTot: TDBEdit
      Left = 192
      Top = 64
      Width = 193
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'TOTAL'
      DataSource = dsTot
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edDataEfet: TCMDateTimePicker
      Left = 16
      Top = 112
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
      TabOrder = 3
    end
    object memObs: TMemo
      Left = 400
      Top = 80
      Width = 321
      Height = 54
      Lines.Strings = (
        '')
      MaxLength = 1000
      TabOrder = 5
    end
    object edRef: TEdit
      Left = 168
      Top = 112
      Width = 217
      Height = 21
      MaxLength = 30
      TabOrder = 4
    end
    object chkEncerra: TCheckBox
      Left = 400
      Top = 139
      Width = 233
      Height = 17
      Caption = 'Encerra Caixa Pequeno'
      TabOrder = 6
    end
    object pgc: TPageControl
      Left = 5
      Top = 158
      Width = 734
      Height = 193
      ActivePage = TabLanc
      Align = alBottom
      TabOrder = 7
      object TabLanc: TTabSheet
        Caption = 'Lançamentos'
        object Panel1: TPanel
          Left = 0
          Top = -26
          Width = 726
          Height = 191
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Grdlanc: TwwDBGrid
            Left = 0
            Top = 27
            Width = 510
            Height = 164
            Selected.Strings = (
              'IDLANCCXPEQ'#9'10'#9'Nº do Lançamento'
              'NODOCUMENTO'#9'20'#9'Nº do Documento'
              'DATALANC'#9'10'#9'Data'
              'VLRLANC'#9'10'#9'Valor'
              'PLACONTA'#9'18'#9'Conta'
              'CODSUBCONTA'#9'10'#9'Sub-Conta'
              'CODCENTRORESPON'#9'10'#9'Centro de~Responsabilidade'
              'UNIDNEGOC'#9'10'#9'Atividade~Projeto'
              'NUMSOLCOMPRA'#9'10'#9'Nº da SCI'
              'CODARTIGO'#9'14'#9'Código~Artigo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsLanc
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel4: TPanel
            Left = 510
            Top = 27
            Width = 216
            Height = 164
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel4'
            TabOrder = 1
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Histórico'
              TabOrder = 0
            end
            object memHist: TDBMemo
              Left = 0
              Top = 33
              Width = 216
              Height = 131
              TabStop = False
              Align = alClient
              DataField = 'HISTLANCAMENTO'
              DataSource = dsLanc
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 27
            Align = alTop
            BevelInner = bvLowered
            Caption = 'Lançamentos do Caixa Pequeno'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object TabEncerra: TTabSheet
        Caption = 'Parametros para Encerramento'
        ImageIndex = 1
        object Label6: TLabel
          Left = 16
          Top = 8
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object Label7: TLabel
          Left = 16
          Top = 56
          Width = 102
          Height = 13
          Caption = 'Tipo de Cobrança'
        end
        object Label8: TLabel
          Left = 16
          Top = 104
          Width = 122
          Height = 13
          Caption = 'Tipo de Recebimento'
        end
        object Label9: TLabel
          Left = 280
          Top = 8
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label10: TLabel
          Left = 280
          Top = 56
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object Label11: TLabel
          Left = 280
          Top = 104
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object dblcTipoDoc: TCMDBLookupCombo
          Left = 16
          Top = 24
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          DataField = 'CODTIPDOC'
          LookupTable = qryTipoDoc
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcForma: TCMDBLookupCombo
          Left = 16
          Top = 72
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          DataField = 'CODFORMA'
          LookupTable = qryFormaPag
          LookupField = 'CODFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcTipRec: TCMDBLookupCombo
          Left = 16
          Top = 120
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'#9'F')
          LookupTable = qryTipoRec
          LookupField = 'CODTIPRECDES'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcCentRespon: TwwDBLookupCombo
          Left = 280
          Top = 24
          Width = 249
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição'
            'CODCENTRORESPON'#9'10'#9'Código')
          DataField = 'CODCENTRORESPON'
          LookupTable = qryCRespon
          LookupField = 'CODCENTRORESPON'
          Options = [loTitles]
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcAtiv: TwwDBLookupCombo
          Left = 280
          Top = 72
          Width = 249
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Descrição'
            'UNIDNEGOC'#9'10'#9'Código')
          DataField = 'UNIDNEGOC'
          LookupTable = qryUnidNegoc
          LookupField = 'UNIDNEGOC'
          Options = [loTitles]
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcCCust: TwwDBLookupCombo
          Left = 280
          Top = 120
          Width = 249
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'
            'CODCENTROCUSTO'#9'10'#9'Código')
          LookupTable = qryCCust
          LookupField = 'CODCENTROCUSTO'
          Options = [loTitles]
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 744
    object lbProc: TLabel [0]
      Left = 16
      Top = 13
      Width = 139
      Height = 13
      Caption = 'Processando Integração'
      Transparent = True
    end
    inherited tb97Fundo: TToolbar97
      Left = 492
      DockPos = 492
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object BtnEfetiva: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Efetivar'
        TabOrder = 2
        OnClick = BtnEfetivaClick
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
    object barProc: TProgressBar
      Left = 169
      Top = 10
      Width = 304
      Height = 21
      Min = 0
      Max = 100
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryCP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CP.IDCAIXAPEQUENO,'
      '      CP.IDFORCLI,'
      '      CP.DESCCAIXAPEQ,'
      '      CP.VLRMAXLANC,'
      '      CP.VLRTOTCAIXAPEQ,    '
      '      CP.CODTIPDOC,'
      '      CP.NUMDIASVENC,'
      '      CP.CODFORMA'
      'FROM'
      '      CAIXAPEQUENO CP,'
      '      USUARIOXCAIXAPEQ UXC'
      'WHERE'
      '        (CP.IDPESSOA = :pIDPESSOA)'
      '    AND (UXC.IDUSUARIO = :pIDUSUARIO)'
      '    AND (UXC.IDCAIXAPEQUENO = CP.IDCAIXAPEQUENO)'
      'ORDER BY CP.DESCCAIXAPEQ'
      ' ')
    ValidateWithMask = True
    Left = 655
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryDESCCAIXAPEQ: TStringField
      DisplayLabel = 'descrição'
      DisplayWidth = 60
      FieldName = 'DESCCAIXAPEQ'
      Origin = 'CAIXAPEQUENO.DESCCAIXAPEQ'
      Size = 60
    end
    object qryIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Origin = 'CAIXAPEQUENO.IDFORCLI'
      Visible = False
    end
    object qryVLRMAXLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMAXLANC'
      Origin = 'CAIXAPEQUENO.VLRMAXLANC'
      Visible = False
    end
    object qryIDCAIXAPEQUENO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCAIXAPEQUENO'
      Origin = 'CAIXAPEQUENO.IDCAIXAPEQUENO'
      Visible = False
    end
    object qryCPCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = '"CM.CAIXAPEQUENO".CODTIPDOC'
      Visible = False
    end
    object qryCPNUMDIASVENC: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMDIASVENC'
      Origin = 'CAIXAPEQUENO.NUMDIASVENC'
      Visible = False
    end
    object qryCPCODFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODFORMA'
      Origin = 'CAIXAPEQUENO.CODFORMA'
      Visible = False
    end
    object qryCPVLRTOTCAIXAPEQ: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRTOTCAIXAPEQ'
      Origin = 'BASEDADOS.CAIXAPEQUENO.VLRTOTCAIXAPEQ'
      Visible = False
    end
  end
  object qryLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDLANCCXPEQ,'
      '      IDEMPRESA,'
      '      CODCENTROCUSTO,'
      '      CODSUBCONTA,'
      '      IDPESSOA,'
      '      PLANO,'
      '      PLACONTA,'
      '      CODCENTRORESPON,'
      '      UNIDNEGOC,'
      '      RECPAG,'
      '      CODTIPRECDES,'
      '      IDITEMSOLI,'
      '      NODOCUMENTO,'
      '      DATALANC,'
      '      VLRLANC,'
      '      HISTLANCAMENTO,'
      '      IDBORDEROCXPEQ'
      'FROM'
      '      LANCCAIXAPEQ'
      'WHERE'
      '      (IDBORDEROCXPEQ IS NULL )'
      '  AND (IDCAIXAPEQUENO = :pIDCAIXAPEQUENO)')
    ValidateWithMask = True
    Left = 655
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCAIXAPEQUENO'
        ParamType = ptUnknown
      end>
    object qryLancIDLANCCXPEQ: TFloatField
      DisplayLabel = 'Nº do Lançamento'
      DisplayWidth = 10
      FieldName = 'IDLANCCXPEQ'
      Origin = 'LANCCAIXAPEQ.IDLANCCXPEQ'
    end
    object qryLancNODOCUMENTO: TStringField
      DisplayLabel = 'Nº do Documento'
      DisplayWidth = 20
      FieldName = 'NODOCUMENTO'
      Origin = 'LANCCAIXAPEQ.NODOCUMENTO'
    end
    object qryLancDATALANC: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANC'
      Origin = 'LANCCAIXAPEQ.DATALANC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryLancVLRLANC: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRLANC'
      Origin = 'LANCCAIXAPEQ.VLRLANC'
      DisplayFormat = '#,##0.00'
    end
    object qryLancPLACONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'LANCCAIXAPEQ.PLACONTA'
      Size = 18
    end
    object qryLancCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
      Origin = 'LANCCAIXAPEQ.CODSUBCONTA'
    end
    object qryLancCODCENTRORESPON: TStringField
      DisplayLabel = 'Centro de~Responsabilidade'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'LANCCAIXAPEQ.CODCENTRORESPON'
      Size = 10
    end
    object qryLancUNIDNEGOC: TFloatField
      DisplayLabel = 'Atividade~Projeto'
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'LANCCAIXAPEQ.UNIDNEGOC'
    end
    object qryLancIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Origin = 'LANCCAIXAPEQ.IDEMPRESA'
      Visible = False
    end
    object qryLancCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LANCCAIXAPEQ.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryLancIDPESSOA2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'LANCCAIXAPEQ.IDPESSOA'
      Visible = False
    end
    object qryLancPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'LANCCAIXAPEQ.PLANO'
      Visible = False
    end
    object qryLancRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'LANCCAIXAPEQ.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLancCODTIPRECDES: TStringField
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Origin = 'LANCCAIXAPEQ.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryLancHISTLANCAMENTO: TStringField
      DisplayWidth = 200
      FieldName = 'HISTLANCAMENTO'
      Origin = 'LANCCAIXAPEQ.HISTLANCAMENTO'
      Visible = False
      Size = 200
    end
    object qryLancIDBORDEROCXPEQ: TFloatField
      FieldName = 'IDBORDEROCXPEQ'
      Visible = False
    end
    object qryLancIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
      Origin = 'LANCCAIXAPEQ.IDITEMSOLI'
      Visible = False
    end
  end
  object dsLanc: TwwDataSource
    AutoEdit = False
    DataSet = qryLanc
    Left = 701
    Top = 200
  end
  object qryTot: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      SUM(VLRLANC) AS TOTAL'
      'FROM'
      '      LANCCAIXAPEQ'
      'WHERE'
      '       (IDBORDEROCXPEQ IS NULL )'
      '   AND (IDCAIXAPEQUENO = :pIDCAIXAPEQUENO)'
      '')
    ValidateWithMask = True
    Left = 655
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCAIXAPEQUENO'
        ParamType = ptUnknown
      end>
    object qryTotTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = '"CM.LANCCAIXAPEQ".VLRLANC'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsTot: TwwDataSource
    AutoEdit = False
    DataSet = qryTot
    Left = 699
    Top = 248
  end
  object qryForn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     P.RAZAOSOCIAL,'
      '     E.CONTACFORN,'
      '     E.CODSUBCONTA,'
      '     E.CODCENTROCUSTO,'
      '     E.IDEMPRESA'
      'FROM'
      '      PESSOA P,'
      '      EMPRESAFORN E'
      'WHERE'
      '       (E.IDFORCLI = :pIDFORCLI )'
      '   AND (E.IDFORCLI = P.IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 655
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end>
    object qryFornRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
    object qryFornCONTACFORN: TStringField
      FieldName = 'CONTACFORN'
      Origin = '"CM.EMPRESAFORN".CONTACFORN'
      Size = 18
    end
    object qryFornCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = '"CM.EMPRESAFORN".CODSUBCONTA'
    end
    object qryFornCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = '"CM.EMPRESAFORN".CODCENTROCUSTO'
      Size = 10
    end
    object qryFornIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = '"CM.EMPRESAFORN".IDEMPRESA'
    end
  end
  object dsForn: TwwDataSource
    AutoEdit = False
    DataSet = qryForn
    Left = 699
    Top = 152
  end
  object qryDoc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 701
    Top = 296
  end
  object qryRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDRATEIODOCUM,'
      '    VALOR,'
      '    VALOROUTRAMOEDA'
      'FROM'
      '    RATEIODOCUM'
      'WHERE'
      '     (CODDOCUMENTO = :pCODDOCUMENTO)'
      ' AND (RTRIM(CODTIPRECDES) = :pCODTIPRECDES)'
      ' AND (RECPAG = :pRECPAG)'
      ' AND (RTRIM(CODCENTRORESPON) = :pCODCENTRORESPON)'
      ' AND (UNIDNEGOC = :pUNIDNEGOC)'
      ' AND (IDPESSOA = :pIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 597
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODCENTRORESPON'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pUNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryRateioVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryRateioVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object qryRateioIDRATEIODOCUM: TFloatField
      FieldName = 'IDRATEIODOCUM'
    end
  end
  object qryEmpresaProp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ES.IDESTADO, ES.CODESTADO, E.IDCIDADES, ES.IDPAIS'
      'FROM PESSOA P,'
      '     ENDPESS E,'
      '     CIDADES C,'
      '     ESTADO  ES'
      'WHERE (P.IDPESSOA = :pIDPESSOA) AND'
      '      (E.IDPESSOA = P.IDPESSOA) AND'
      '      (E.IDENDERECO = P.IDENDCOMERCIAL) AND'
      '      (E.IDCIDADES = C.IDCIDADES) AND'
      '      (ES.IDESTADO = C.IDESTADO)'
      '')
    ValidateWithMask = True
    Left = 576
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryEmpresaPropIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'ESTADO.IDESTADO'
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
    object qryEmpresaPropIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
    end
  end
  object qryCli: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     P.RAZAOSOCIAL,'
      '     E.CONTACCLIENTE,'
      '     E.CONTACRECEITA,                          '
      '     E.CODSUBCONTA,'
      '     E.CODCENTROCUSTO,'
      '     E.IDEMPRESA'
      'FROM'
      '      PESSOA P,'
      '      EMPRESACLIENTE E'
      'WHERE'
      '       (E.IDFORCLI = :pIDFORCLI )'
      '   AND (E.IDFORCLI = P.IDPESSOA)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 575
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end>
    object qryCliRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryCliCONTACCLIENTE: TStringField
      FieldName = 'CONTACCLIENTE'
      Origin = 'BASEDADOS.EMPRESACLIENTE.CONTACCLIENTE'
      FixedChar = True
      Size = 18
    end
    object qryCliCONTACRECEITA: TStringField
      FieldName = 'CONTACRECEITA'
      Origin = 'BASEDADOS.EMPRESACLIENTE.CONTACRECEITA'
      FixedChar = True
      Size = 18
    end
    object qryCliCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.EMPRESACLIENTE.CODSUBCONTA'
    end
    object qryCliCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.EMPRESACLIENTE.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryCliIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.EMPRESACLIENTE.IDEMPRESA'
    end
  end
  object qryTipoDoc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'CODTIPDOC,'
      #9'DESCRICAO'
      'FROM'
      #9'TIPODOCRECPAG'
      'WHERE'
      '     (RECPAG = '#39'R'#39')'
      'ORDER BY DEBCRE DESC, DESCRICAO')
    ValidateWithMask = True
    Left = 656
    Top = 73
    object qryTipoDocDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = '"CM.TIPODOCRECPAG".DESCRICAO'
      Size = 35
    end
    object qryTipoDocCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = '"CM.TIPODOCRECPAG".CODTIPDOC'
      Visible = False
    end
  end
  object qryFormaPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODFORMA, RECPAG, DESCRICAO'
      'FROM FORMARECPAG '
      'WHERE (RECPAG = :PRECPAG) AND'
      '               (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 589
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryFormaPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object qryFormaPagCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
    object qryFormaPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryTipoRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODTIPRECDES,'
      '      DESCRICAO'
      'FROM'
      '      TIPORECEBDESEMB'
      'WHERE'
      '       (RECPAG = '#39'R'#39')'
      '   AND (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2'
      '')
    ValidateWithMask = True
    Left = 656
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     U.CODCENTRORESPON,'
      '     U.NOME'
      'FROM'
      ' ('
      '  (SELECT'
      '        CR.CODCENTRORESPON,'
      '        CR.NOME'
      '   FROM'
      '        CENTRESPON CR,'
      '        PESSOAXCRESP PR'
      '   WHERE'
      '         (CR.CODCENTRORESPON = PR.CODCENTRORESPON)'
      '     AND (CR.IDPESSOA = PR.IDPESSOA)'
      '     AND (CR.IDPESSOA = :pIDPESS)'
      '     AND (CR.ATIVO    = '#39'S'#39')'
      '     AND (CR.ANALITICOSINTET = '#39'A'#39')'
      '     AND (PR.IDPESSOAACESSO = :IDUSUARIO))'
      '  UNION ALL'
      '    (SELECT'
      '          CR.CODCENTRORESPON,'
      '          CR.NOME'
      '     FROM'
      '          CENTRESPON CR'
      '     WHERE'
      '           (CR.IDPESSOA = :pIDPESS)'
      '       AND (CR.ATIVO    = '#39'S'#39')'
      '       AND (CR.ANALITICOSINTET = '#39'A'#39')'
      '       AND (NOT EXISTS (SELECT 1'
      '                        FROM PESSOAXCRESP PR'
      '                        WHERE (PR.IDPESSOA = :pIDPESS)'
      '                          AND (PR.IDPESSOAACESSO = :IDUSUARIO)))'
      '     )'
      '  ) U'
      'ORDER BY U.NOME')
    ValidateWithMask = True
    Left = 525
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     UNIDNEGOC,'
      '     NOME'
      'FROM'
      '     UNIDNEGOCIO'
      'WHERE'
      '    (IDPESSOA = :IDPESSOA)'
      'ORDER BY NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 526
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODCENTROCUSTO,'
      '     NOME'
      'FROM'
      '     CENTCUST'
      'WHERE'
      '    (IDEMPRESA = :IDPESSOA)'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 584
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
