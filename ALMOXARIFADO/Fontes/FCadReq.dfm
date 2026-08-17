inherited FrmCadReq: TFrmCadReq
  Left = 85
  Top = 56
  Caption = 'Cadastro de Requisições de Materiais'
  ClientHeight = 445
  ClientWidth = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 620
    Height = 359
    inherited pnlMestre: TPanel
      Width = 610
      Height = 116
      object lbALmox: TLabel
        Left = 304
        Top = 8
        Width = 120
        Height = 13
        Caption = 'Almoxarifado Destino'
      end
      object Label1: TLabel
        Left = 10
        Top = 9
        Width = 116
        Height = 13
        Caption = 'Almoxarifado Origem'
      end
      object Label14: TLabel
        Left = 424
        Top = 72
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object RgTipoMov: TDBRadioGroup
        Left = 8
        Top = 48
        Width = 119
        Height = 58
        Caption = ' Destino '
        DataField = 'CUSTOTRANSF'
        DataSource = ds
        Items.Strings = (
          'Transferência'
          'Custo')
        TabOrder = 1
        Values.Strings = (
          'T'
          'C')
        OnClick = RgTipoMovClick
      end
      object GrpDatas: TGroupBox
        Left = 136
        Top = 48
        Width = 277
        Height = 58
        Caption = ' Datas '
        TabOrder = 2
        object Label4: TLabel
          Left = 14
          Top = 15
          Width = 47
          Height = 13
          Caption = 'Emissão'
        end
        object Label5: TLabel
          Left = 143
          Top = 15
          Width = 74
          Height = 13
          Caption = 'Necessidade'
        end
        object edDataEmi: TCMDateTimePicker
          Left = 14
          Top = 29
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAEMISSAO'
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
          OnExit = edDataEmiExit
        end
        object edDataNec: TCMDateTimePicker
          Left = 143
          Top = 29
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATANECESSIDADE'
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
          TabOrder = 1
        end
      end
      object edAlmox: TEdit
        Left = 304
        Top = 24
        Width = 297
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Text = 'edalmox'
      end
      object dblcAlmox: TwwDBLookupCombo
        Left = 10
        Top = 23
        Width = 287
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCALMOX'#9'40'#9'Nome'
          'CODALMOXARIFADO'#9'10'#9'Código')
        DataField = 'CODALMOXAORIGEM'
        DataSource = ds
        LookupTable = qryAlmox
        LookupField = 'CODALMOXARIFADO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcAlmoxExit
      end
      object dblcAtiv: TwwDBLookupCombo
        Left = 424
        Top = 85
        Width = 177
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNIDNEGOC'#9'10'#9'Código')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = qryUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 121
      Width = 610
      Height = 233
      Tabs.Strings = (
        'Itens da Requisição'
        'Observação')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 512
        Height = 174
        inherited tbsDet: TTabSheet
          Caption = 'Itens da Requisição'
          inherited dbgrdDet: TwwDBGrid
            Width = 504
            Height = 146
            Selected.Strings = (
              'CODARTIGO'#9'14'#9'Codigo'#9'No'
              'DESCRICAO'#9'35'#9'Descrição'#9'No'
              'CODMEDIDA'#9'4'#9'Unidade~Medida'#9'No'
              'VALORUN'#9'10'#9'Valor~Unitário'#9'No'
              'QTDEPEDIDA'#9'10'#9'Quantidade~Pedida'#9'No')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 504
            Height = 146
            object Label9: TLabel
              Left = 184
              Top = 40
              Width = 19
              Height = 13
              Caption = 'UN'
            end
            object Label10: TLabel
              Left = 16
              Top = 40
              Width = 103
              Height = 13
              Caption = 'Saldo em Estoque'
            end
            object Label6: TLabel
              Left = 112
              Top = 0
              Width = 104
              Height = 13
              Caption = 'Descrição do Item'
            end
            object Label7: TLabel
              Left = 16
              Top = 0
              Width = 25
              Height = 13
              Caption = 'Item'
            end
            object Label8: TLabel
              Left = 320
              Top = 0
              Width = 31
              Height = 13
              Caption = 'Unid.'
            end
            object Label11: TLabel
              Left = 392
              Top = 40
              Width = 101
              Height = 13
              Caption = 'Valor Requisitado'
            end
            object Label12: TLabel
              Left = 392
              Top = 0
              Width = 32
              Height = 13
              Caption = 'Qtde.'
            end
            object Label13: TLabel
              Left = 272
              Top = 40
              Width = 78
              Height = 13
              Caption = 'Valor Unitário'
            end
            object Label15: TLabel
              Left = 16
              Top = 80
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dblcItem: TwwDBLookupCombo
              Left = 16
              Top = 16
              Width = 91
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODARTIGO'#9'14'#9'Código'
                'DESCRICAO'#9'50'#9'Descrição')
              DataField = 'CODARTIGO'
              DataSource = dsDet
              LookupTable = qryArtigo
              LookupField = 'CODARTIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcItemCloseUp
            end
            object dblcDesc: TwwDBLookupCombo
              Left = 112
              Top = 16
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'
                'CODARTIGO'#9'14'#9'Código')
              DataField = 'CODARTIGO'
              DataSource = dsDet
              LookupTable = qryArtigo
              LookupField = 'CODARTIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcDescCloseUp
            end
            object dblcUN: TwwDBLookupCombo
              Left = 320
              Top = 16
              Width = 60
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = dsDet
              LookupTable = qryUnidMed
              LookupField = 'CODMEDIDA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object edValb: TRealEdit
              Left = 392
              Top = 56
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Color = 14286847
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 5
              NumberFormat = fNumber
              Signal = False
            end
            object edQtde: TDBRealEdit
              Left = 392
              Top = 16
              Width = 98
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              OnExit = edQtdeExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEPEDIDA'
              DataSource = dsDet
            end
            object dbUn: TDBEdit
              Left = 184
              Top = 56
              Width = 73
              Height = 21
              Color = clSilver
              DataField = 'CODMEDCUSTO'
              DataSource = dsArtigo
              Enabled = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBRealEdit1: TDBRealEdit
              Left = 272
              Top = 56
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Enabled = False
              Lines.Strings = (
                '      0,00')
              TabOrder = 6
              WordWrap = False
              OnExit = edQtdeExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORUN'
              DataSource = dsDet
            end
            object edSaldo: TRealEdit
              Left = 16
              Top = 56
              Width = 151
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object DBMemo2: TDBMemo
              Left = 16
              Top = 96
              Width = 473
              Height = 57
              DataField = 'OBS'
              DataSource = dsDet
              MaxLength = 250
              TabOrder = 8
            end
          end
        end
        object TabObs: TTabSheet
          Caption = 'TabObs'
          ImageIndex = 1
          object DBMemo1: TDBMemo
            Left = 0
            Top = 0
            Width = 504
            Height = 146
            Align = alClient
            DataField = 'OBS'
            DataSource = ds
            MaxLength = 250
            TabOrder = 0
          end
        end
      end
      inherited Dock973: TDock97
        Width = 602
        object Label2: TLabel [0]
          Left = 392
          Top = 8
          Width = 63
          Height = 13
          Caption = 'Valor Total'
        end
        object edValTot: TRealEdit
          Left = 464
          Top = 4
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = 14286847
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      inherited Dock974: TDock97
        Left = 516
        Height = 174
      end
    end
  end
  inherited Dock972: TDock97
    Width = 620
    object Label3: TLabel [0]
      Left = 450
      Top = 7
      Width = 100
      Height = 13
      Caption = 'Nº da Requisição'
    end
    object edNumReq: TDBEdit
      Left = 450
      Top = 21
      Width = 151
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'NUMREQUISICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 620
    inherited tb97Fundo: TToolbar97
      Left = 446
      DockPos = 446
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 278
      DockPos = 278
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      NUMREQUISICAO,'
      '      IDUSUARIOINCLUSAO,                      '
      '      IDPESSOA,'
      '      IDEMPRESA,'
      '      CODCENTROCUSTO,'
      '      CODALMOXAORIGEM,'
      '      CUSTOTRANSF,'
      '      DATAEMISSAO,'
      '      REQATENDIDA,'
      '      DATANECESSIDADE,                         '
      '      IMPRESSO,'
      '      CODALMOXADESTINO,'
      '      IDPROCESSO,'
      '      UNIDNEGOC,'
      '      OBS         '
      'FROM'
      '     REQMAT'
      'WHERE ( NUMREQUISICAO = :pNUMREQ)'
      ' ')
    Left = 71
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pNUMREQ'
        ParamType = ptUnknown
      end>
    object qryNUMREQUISICAO: TFloatField
      FieldName = 'NUMREQUISICAO'
      Origin = 'REQMAT.NUMREQUISICAO'
    end
    object qryIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'REQMAT.IDUSUARIOINCLUSAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'REQMAT.IDPESSOA'
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'REQMAT.IDEMPRESA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'REQMAT.CODCENTROCUSTO'
      Size = 10
    end
    object qryCODALMOXAORIGEM: TFloatField
      FieldName = 'CODALMOXAORIGEM'
      Origin = 'REQMAT.CODALMOXAORIGEM'
    end
    object qryCUSTOTRANSF: TStringField
      FieldName = 'CUSTOTRANSF'
      Origin = 'REQMAT.CUSTOTRANSF'
      Size = 1
    end
    object qryDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'REQMAT.DATAEMISSAO'
    end
    object qryREQATENDIDA: TStringField
      FieldName = 'REQATENDIDA'
      Origin = 'REQMAT.REQATENDIDA'
      Size = 1
    end
    object qryDATANECESSIDADE: TDateTimeField
      FieldName = 'DATANECESSIDADE'
      Origin = 'REQMAT.DATANECESSIDADE'
    end
    object qryIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      Origin = 'REQMAT.IMPRESSO'
      Size = 1
    end
    object qryCODALMOXADESTINO: TFloatField
      FieldName = 'CODALMOXADESTINO'
      Origin = 'REQMAT.CODALMOXADESTINO'
    end
    object qryIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = 'REQMAT.IDPROCESSO'
    end
    object qryUNIDNEGOC2: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.REQMAT.UNIDNEGOC'
    end
    object qryOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BASEDADOS.REQMAT.OBS'
      Size = 250
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 180
    Top = 4
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 11
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update REQMAT'
      'set'
      '  NUMREQUISICAO = :NUMREQUISICAO,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  CODALMOXAORIGEM = :CODALMOXAORIGEM,'
      '  CUSTOTRANSF = :CUSTOTRANSF,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  REQATENDIDA = :REQATENDIDA,'
      '  DATANECESSIDADE = :DATANECESSIDADE,'
      '  IMPRESSO = :IMPRESSO,'
      '  CODALMOXADESTINO = :CODALMOXADESTINO,'
      '  IDPROCESSO = :IDPROCESSO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  OBS = :OBS'
      'where'
      '  NUMREQUISICAO = :OLD_NUMREQUISICAO')
    InsertSQL.Strings = (
      'insert into REQMAT'
      
        '  (NUMREQUISICAO, IDUSUARIOINCLUSAO, IDPESSOA, IDEMPRESA, CODCEN' +
        'TROCUSTO, '
      
        '   CODALMOXAORIGEM, CUSTOTRANSF, DATAEMISSAO, REQATENDIDA, DATAN' +
        'ECESSIDADE, '
      '   IMPRESSO, CODALMOXADESTINO, IDPROCESSO, UNIDNEGOC, OBS)'
      'values'
      
        '  (:NUMREQUISICAO, :IDUSUARIOINCLUSAO, :IDPESSOA, :IDEMPRESA, :C' +
        'ODCENTROCUSTO, '
      
        '   :CODALMOXAORIGEM, :CUSTOTRANSF, :DATAEMISSAO, :REQATENDIDA, :' +
        'DATANECESSIDADE, '
      '   :IMPRESSO, :CODALMOXADESTINO, :IDPROCESSO, :UNIDNEGOC, :OBS)')
    DeleteSQL.Strings = (
      'delete from REQMAT'
      'where'
      '  NUMREQUISICAO = :OLD_NUMREQUISICAO')
    Left = 41
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'REQMAT.NUMREQUISICAO'
      'ALMOX.DESCALMOX'
      'REQMAT.DATAEMISSAO'
      'REQMAT.DATANECESSIDADE'
      'ARTIGO.CODARTIGO'
      'PRODUTO.DESCPROD')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Nº  da Requisição'
      'Almoxarifado Origem'
      'Data de Emissão'
      'Data de Necessidade'
      'Código do Item'
      'Descrção do Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REQMAT'
      'ALMOX'
      'ARTIGO'
      'ITEMPEDI'
      'PRODUTO')
    CamposChave.Strings = (
      'REQMAT.NUMREQUISICAO')
    Filtro.Strings = (
      'REQMAT.REQATENDIDA = '#39'F'#39
      'ITEMPEDI.FLGSCI = '#39'N'#39
      'REQMAT.CODALMOXAORIGEM = CODALMOXARIFADO'
      'REQMAT.NUMREQUISICAO = ITEMPEDI.NUMREQUISICAO'
      'ARTIGO.CODARTIGO =  ITEMPEDI.CODARTIGO'
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '10'
      '10'
      '14'
      '40')
    Left = 120
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 11
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 393
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 78
    Top = 50
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 160
    Top = 60
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        I.NUMREQUISICAO,'
      '        I.CODARTIGO,'
      '        I.CODMEDIDA,'
      '        I.VALORUN,  '
      '        I.QTDEPEDIDA,'
      '        I.QTDEPENDENTE,'
      
        '       ( P.DESCPROD  || '#39' '#39' || A.CODCOR || '#39' '#39' ||  A.CODTAMANHO)' +
        '  DESCRICAO,   '
      '       (0) AS VALOR,'
      '       OBS'
      'FROM'
      '     ITEMPEDI I,'
      '     ARTIGO A,'
      '     PRODUTO P'
      'WHERE'
      '            ( I.NUMREQUISICAO = :pNUM)'
      '   AND ( A.CODARTIGO = I.CODARTIGO)'
      '   AND ( A.CODPRODUTO = P.CODPRODUTO)')
    UpdateObject = udpDet
    ValidateWithMask = True
    Left = 222
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pNUM'
        ParamType = ptUnknown
      end>
    object qryDetCODARTIGO: TStringField
      DisplayLabel = 'Codigo'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Origin = 'ITEMPEDI.CODARTIGO'
      Size = 14
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = '"CM.PRODUTO".DESCPROD'
      Size = 50
    end
    object qryDetCODMEDIDA: TStringField
      DisplayLabel = 'Unidade~Medida'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'ITEMPEDI.CODMEDIDA'
      Size = 4
    end
    object qryDetVALORUN: TFloatField
      DisplayLabel = 'Valor~Unitário'
      DisplayWidth = 10
      FieldName = 'VALORUN'
      Origin = 'ITEMPEDI.VALORUN'
      DisplayFormat = '#.##0,00'
    end
    object qryDetQTDEPEDIDA: TFloatField
      DisplayLabel = 'Quantidade~Pedida'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      Origin = 'ITEMPEDI.QTDEPEDIDA'
      DisplayFormat = '#.##0,00'
    end
    object qryDetNUMREQUISICAO: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMREQUISICAO'
      Origin = 'ITEMPEDI.NUMREQUISICAO'
      Visible = False
    end
    object qryDetQTDEPENDENTE: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEPENDENTE'
      Origin = 'ITEMPEDI.QTDEPENDENTE'
      Visible = False
      DisplayFormat = '#.##0,00'
    end
    object qryDetVALOR: TFloatField
      FieldName = 'VALOR'
      Visible = False
    end
    object qryDetOBS: TStringField
      FieldName = 'OBS'
      Visible = False
      Size = 250
    end
  end
  object udpDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMPEDI'
      'set'
      '  NUMREQUISICAO = :NUMREQUISICAO,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  VALORUN = :VALORUN,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  QTDEPENDENTE = :QTDEPENDENTE,'
      '  OBS = :OBS'
      'where'
      '  NUMREQUISICAO = :OLD_NUMREQUISICAO and'
      '  rtrim(CODARTIGO) = :OLD_CODARTIGO')
    InsertSQL.Strings = (
      'insert into ITEMPEDI'
      
        '  (NUMREQUISICAO, CODARTIGO, CODMEDIDA, VALORUN, QTDEPEDIDA, QTD' +
        'EPENDENTE, '
      '   OBS)'
      'values'
      
        '  (:NUMREQUISICAO, :CODARTIGO, :CODMEDIDA, :VALORUN, :QTDEPEDIDA' +
        ', :QTDEPENDENTE, '
      '   :OBS)')
    DeleteSQL.Strings = (
      'delete from ITEMPEDI'
      'where'
      '  NUMREQUISICAO = :OLD_NUMREQUISICAO and'
      '  rtrim(CODARTIGO) = :OLD_CODARTIGO')
    Left = 270
    Top = 4
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     UXA.CODALMOXARIFADO,'
      '     ALM.DESCALMOX,'
      '     ALM.CODCUSTEIO'
      'FROM'
      '     ALMOX ALM,'
      '     USUXALMOX UXA'
      'WHERE'
      '       (UXA.IDUSUARIO = :pIDUSUARIO)'
      '   AND (UXA.IDPESSOA  = :pIDPESSOA)'
      '   AND (UXA.CODALMOXARIFADO <> :pCODALMOX)'
      '   AND (UXA.CODALMOXARIFADO = ALM.CODALMOXARIFADO)'
      'ORDER BY ALM.DESCALMOX')
    ValidateWithMask = True
    Left = 311
    Top = 231
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end>
  end
  object qryArtigo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     U.CODARTIGO,'
      '     U.CODMEDCUSTO,'
      '     U.DESCRICAO'
      'FROM'
      '('
      'SELECT'
      '       A.CODARTIGO,'
      '       P.CODMEDCUSTO,'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO) AS ' +
        'DESCRICAO'
      'FROM'
      '       ARTIGO A,'
      '       PRODUTO P'
      'WHERE'
      
        '       (((A.FLGBLOQUEADO <> '#39'R'#39') AND (A.FLGBLOQUEADO <> '#39'A'#39')) OR' +
        ' (A.FLGBLOQUEADO IS NULL))'
      '   AND ( A.FLGATIVO = '#39'S'#39' )'
      '   AND ( A.CODPRODUTO = P.CODPRODUTO)'
      
        '   AND (NOT EXISTS (SELECT 1 FROM USUXGRUPPROD WHERE  (IDUSUARIO' +
        ' = :IDUSUARIO) AND (IDPESSOA = :IDPESSOA)))'
      'UNION ALL'
      '  SELECT'
      '       A.CODARTIGO,'
      '       P.CODMEDCUSTO,'
      
        '       (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODCOR)  A' +
        'S DESCRICAO'
      '  FROM'
      '      ARTIGO A,'
      '      PRODUTO P,'
      '      USUXGRUPPROD UXG'
      '  WHERE'
      
        '          (((A.FLGBLOQUEADO <> '#39'R'#39')  AND (A.FLGBLOQUEADO <> '#39'A'#39')' +
        ') OR (A.FLGBLOQUEADO IS NULL))'
      '      AND ( A.FLGATIVO = '#39'S'#39' )'
      '      AND (IDUSUARIO = :IDUSUARIO)'
      '      AND (IDPESSOA = :IDPESSOA)'
      '      AND (P.CODGRUPOPROD = UXG.CODGRUPOPROD)'
      '      AND (A.CODPRODUTO = P.CODPRODUTO )'
      ') U'
      'ORDER BY U.DESCPROD'
      ' ')
    ValidateWithMask = True
    Left = 446
    Top = 195
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryUnidMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select '
      '         U.CodMedida, '
      '         U.DescMedida '
      'From'
      '         UnMedida U,'
      '         Conver   C '
      'Where  '
      '         (RTRIM(C.CodProduto) =  :pCodProd)'
      '  and (U.CodMedida  = C.CodMedida)'
      'Order By CodMedida ')
    ValidateWithMask = True
    Left = 321
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end>
    object qryUnidMedCODMEDIDA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CODMEDIDA'
      Origin = 'UNMEDIDA.CODMEDIDA'
      Size = 4
    end
    object qryUnidMedDESCMEDIDA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCMEDIDA'
      Origin = 'UNMEDIDA.DESCMEDIDA'
      Size = 25
    end
  end
  object qryCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '            CUSTOMEDIO'
      'FROM '
      '           CUSTOMED'
      'WHERE'
      '         ( RTRIM(CODARTIGO) = RTRIM(:pCODART))'
      '  And (CODCUSTEIO = :pCODCUST) ')
    ValidateWithMask = True
    Left = 264
    Top = 231
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODCUST'
        ParamType = ptUnknown
      end>
  end
  object dsArtigo: TwwDataSource
    AutoEdit = False
    DataSet = qryArtigo
    Left = 377
    Top = 195
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
      '     (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 550
    Top = 141
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
