inherited frmGeraProcesso: TfrmGeraProcesso
  Left = 166
  Top = 164
  HelpContext = 230051
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gerar Processo'
  ClientHeight = 336
  ClientWidth = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 603
    Height = 297
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 100
      Height = 13
      Caption = 'Tipo de Processo'
    end
    object Label2: TLabel
      Left = 8
      Top = 211
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object Label4: TLabel
      Left = 8
      Top = 56
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object Label6: TLabel
      Left = 312
      Top = 56
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label7: TLabel
      Left = 8
      Top = 106
      Width = 107
      Height = 13
      Caption = 'Grupo de Produtos'
    end
    object Label8: TLabel
      Left = 312
      Top = 106
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object Label5: TLabel
      Left = 312
      Top = 158
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel
      Left = 8
      Top = 158
      Width = 116
      Height = 13
      Caption = 'Tipo de Documento:'
    end
    object dblcProc: TCMDBLookupCombo
      Left = 8
      Top = 24
      Width = 585
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      LookupTable = CdsProc
      LookupField = 'IDRADTIPOPROC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcProcCloseUp
      OnExit = dblcProcExit
    end
    object MemObs: TMemo
      Left = 8
      Top = 228
      Width = 585
      Height = 60
      MaxLength = 200
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object dblcGrpProd: TCMDBLookupCombo
      Left = 8
      Top = 122
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Descrição')
      LookupTable = CdsGrpProd
      LookupField = 'CODGRUPOPROD'
      Options = [loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcCentResp: TCMDBLookupCombo
      Left = 312
      Top = 72
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      LookupTable = CdsCentRespon
      LookupField = 'CODCENTRORESPON'
      Options = [loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcCentCust: TCMDBLookupCombo
      Left = 8
      Top = 72
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      LookupTable = CdsCentCust
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcUnNegoc: TCMDBLookupCombo
      Left = 312
      Top = 122
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      LookupTable = CdsUnNegoc
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edValor: TRealEdit
      Left = 312
      Top = 174
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dblcTipDoc: TCMDBLookupCombo
      Left = 8
      Top = 174
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'20'#9'Descrição'#9'F'
        'RECPAG'#9'10'#9'Sistema'#9'F')
      LookupTable = cdsTipDoc
      LookupField = 'CODTIPDOC'
      Options = [loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 297
    Width = 603
    inherited tb97Fundo: TToolbar97
      Left = 353
      DockPos = 368
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
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
        ClickHelpContext = 230051
      end
      object btnExecutar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gerar'
        Enabled = False
        TabOrder = 2
        OnClick = btnExecutarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 65523
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object SqlUnNegoc: TCMSqlParams
    SQL.Strings = (
      'select   UNIDNEGOC, '
      '         NOME,      '
      '         UNECODIGO  '
      'from     UNIDNEGOCIO'
      'order by UNECODIGO  ')
    ClientDataSet = CdsUnNegoc
    Left = 117
    Top = 194
  end
  object CdsUnNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 117
    Top = 242
  end
  object SqlProc: TCMSqlParams
    SQL.Strings = (
      'SELECT   IDRADTIPOPROC,'
      '         NOME,'
      '         IDREFERENCIA, PRAZOESTIMADO '
      'FROM     RADTIPOPROC TP'
      'WHERE FLGATIVO = 1'
      'ORDER BY TP.NOME'
      ' ')
    ClientDataSet = CdsProc
    Left = 193
    Top = 194
  end
  object CdsProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 193
    Top = 242
  end
  object CdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 281
    Top = 242
  end
  object SqlCentRespon: TCMSqlParams
    SQL.Strings = (
      'select   c.CODCENTRORESPON ,          '
      '         c.NOME                      '
      'from     CENTRESPON        c                  '
      'where    c.ANALITICOSINTET = '#39'A'#39
      '  and    IDPLANCRESPON = :IDPLANCRESPON'
      'order by c.NOME            ,'
      '         c.CODCENTRORESPON')
    ClientDataSet = CdsCentRespon
    Left = 281
    Top = 194
  end
  object SqlGrpProc: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPOPROCESSO,'
      '       DESCGRUPOPROCESSO'
      '  FROM RADGRUPOPROCESSO'
      ' ORDER BY 2')
    ClientDataSet = CdsGrpProc
    Left = 365
    Top = 194
  end
  object CdsGrpProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 365
    Top = 242
  end
  object SqlCentCust: TCMSqlParams
    SQL.Strings = (
      'select   CODCENTROCUSTO ,        '
      '         NOME                    '
      'from     CENTCUST                         '
      'where    STATUSGRUPOCDC = '#39'A'#39
      '  and    IDPLANCENTCUST = :IDPLANCENTCUST'
      'order by CODCENTROCUSTO')
    ClientDataSet = CdsCentCust
    Left = 461
    Top = 194
  end
  object CdsCentCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 461
    Top = 242
  end
  object SqlGrpProd: TCMSqlParams
    SQL.Strings = (
      'select   CODGRUPOPROD, '
      '         DESCGRUPOPROD'
      'from     GRUPPROD              '
      'order by CODGRUPOPROD')
    ClientDataSet = CdsGrpProd
    Left = 549
    Top = 194
  end
  object CdsGrpProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 549
    Top = 242
  end
  object cdsTipDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 37
    Top = 242
  end
  object SqlTipDoc: TCMSqlParams
    SQL.Strings = (
      
        'select   CODTIPDOC,                                             ' +
        '                    '
      
        '         DESCRICAO,                                             ' +
        '                   '
      
        '         decode( RECPAG, '#39'P'#39', '#39'Contas a Pagar'#39', '#39'Contas a Recebe' +
        'r'#39') as RECPAG         '
      
        'from     TIPODOCRECPAG                                          ' +
        '                            '
      'order by DESCRICAO'
      ' ')
    ClientDataSet = cdsTipDoc
    Left = 37
    Top = 194
  end
end
