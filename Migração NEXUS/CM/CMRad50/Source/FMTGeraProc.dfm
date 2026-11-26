inherited FrmMTGeraProc: TFrmMTGeraProc
  Left = 377
  Top = 260
  HelpContext = 230051
  Caption = 'Gerar Processo'
  ClientHeight = 394
  ClientWidth = 616
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 616
    Height = 355
    object Label1: TLabel
      Left = 16
      Top = 56
      Width = 100
      Height = 13
      Caption = 'Tipo de Processo'
    end
    object Label2: TLabel
      Left = 16
      Top = 248
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object Label4: TLabel
      Left = 312
      Top = 56
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object Label6: TLabel
      Left = 16
      Top = 104
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label7: TLabel
      Left = 312
      Top = 104
      Width = 107
      Height = 13
      Caption = 'Grupo de Produtos'
    end
    object Label8: TLabel
      Left = 16
      Top = 152
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object Label5: TLabel
      Left = 312
      Top = 152
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Label9: TLabel
      Left = 16
      Top = 16
      Width = 109
      Height = 13
      Caption = 'Grupo de Processo'
    end
    object dblcProc: TCMDBLookupCombo
      Left = 16
      Top = 72
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      LookupTable = CdsProc
      LookupField = 'IDTIPOPROCESSO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcProcCloseUp
    end
    object MemObs: TMemo
      Left = 16
      Top = 264
      Width = 585
      Height = 73
      MaxLength = 200
      TabOrder = 6
    end
    object dblcGrpProd: TCMDBLookupCombo
      Left = 312
      Top = 120
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Descrição')
      LookupTable = CdsGrpProd
      LookupField = 'CODGRUPOPROD'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcCentResp: TCMDBLookupCombo
      Left = 16
      Top = 120
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      LookupTable = CdsCentRespon
      LookupField = 'CODCENTRORESPON'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcCentCust: TCMDBLookupCombo
      Left = 312
      Top = 72
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      LookupTable = CdsCentCust
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcUnNegoc: TCMDBLookupCombo
      Left = 16
      Top = 168
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      LookupTable = CdsUnNegoc
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edValor: TRealEdit
      Left = 312
      Top = 168
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dblcGrpProc: TCMDBLookupCombo
      Left = 16
      Top = 32
      Width = 585
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROCESSO'#9'60'#9'Descrição')
      DataField = 'IDGRUPOPROCESSO'
      LookupTable = CdsGrpProc
      LookupField = 'IDGRUPOPROCESSO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcGrpProcCloseUp
    end
    object cmPessoa: TCMProcuraSubTipo
      Left = 16
      Top = 192
      Width = 585
      Height = 50
      Caption = ' Pessoa '
      TabOrder = 8
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      SubTipo = stAdminImovel
      FiltraSubTipo = False
    end
  end
  inherited Dock971: TDock97
    Top = 355
    Width = 616
    inherited tb97Fundo: TToolbar97
      Left = 366
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
        HelpContext = 230051
        ClickHelpContext = 230051
      end
      object btnExecutar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Gerar'
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
      'SELECT UNIDNEGOC,'
      '       NOME'
      '  FROM UNIDNEGOCIO'
      ' WHERE ( IDPESSOA = :pIDPESSOA )'
      '   AND ( UNETIPO = '#39'A'#39' )'
      'ORDER BY 2')
    ClientDataSet = CdsUnNegoc
    Left = 37
    Top = 266
  end
  object CdsUnNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 37
    Top = 314
  end
  object SqlProc: TCMSqlParams
    SQL.Strings = (
      'SELECT TP.IDTIPOPROCESSO,'
      '       TP.NOME,'
      '       OBSPROC,'
      '       FLGCENTCUST,'
      '       FLGCENTRESPON,'
      '       FLGGRUPPROD,'
      '       FLGUNIDNEGOC,'
      '       FLGVALOR'
      '  FROM RADTIPOPROCESSO TP'
      ' WHERE ( TP.IDGRUPOPROCESSO = :IDGRUPOPROCESSO )'
      '   AND ( TP.IDGRPCRIAPROCESSO IN ( SELECT IDGRPRESPON'
      '                                     FROM RADRESPONXGRP'
      
        #9'                            WHERE ( IDUSUARIO = :pIDUSUARIO ) )' +
        ' )'
      'ORDER BY TP.NOME')
    ClientDataSet = CdsProc
    Left = 89
    Top = 266
  end
  object CdsProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 314
  end
  object CdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 314
  end
  object SqlCentRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCENTRORESPON, NOME'
      '  FROM CENTRESPON'
      ' WHERE ( IDPESSOA = :pIDPESS )'
      '   AND ( ANALITICOSINTET = '#39'A'#39' )'
      
        '   AND ( CODCENTRORESPON IN ( SELECT CODCENTRORESPON  FROM PESSO' +
        'AXCRESP'
      
        '                               WHERE ( IDPESSOAACESSO = :IDUSUAR' +
        'IO )'
      
        '                                 AND ( IDPESSOA       = :pIDPESS' +
        'OA ) ) )'
      'ORDER BY 2')
    ClientDataSet = CdsCentRespon
    Left = 145
    Top = 266
  end
  object SqlGrpProc: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPOPROCESSO,'
      '       DESCGRUPOPROCESSO'
      '  FROM RADGRUPOPROCESSO'
      ' ORDER BY 2')
    ClientDataSet = CdsGrpProc
    Left = 213
    Top = 266
  end
  object CdsGrpProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 213
    Top = 314
  end
  object SqlCentCust: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCENTROCUSTO, NOME'
      '  FROM CENTCUST'
      ' WHERE ( IDEMPRESA = :pIDPESSOA )'
      '   AND ( STATUSGRUPOCDC = '#39'A'#39' )'
      '   AND ( CODCENTROCUSTO IN ( SELECT CODCENTROCUSTO'
      '                               FROM USCCUSTO'
      '                              WHERE ( IDUSUARIO = :IDUSUARIO )'
      
        '                                AND ( IDEMPRESA = :pIDPESSOA ) )' +
        ' )'
      ' ORDER BY 2'
      ' ')
    ClientDataSet = CdsCentCust
    Left = 277
    Top = 266
  end
  object CdsCentCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 277
    Top = 314
  end
  object SqlGrpProd: TCMSqlParams
    SQL.Strings = (
      'SELECT CODGRUPOPROD,'
      '       DESCGRUPOPROD'
      '  FROM GRUPPROD'
      ' WHERE STATUSGRUPO = '#39'A'#39
      'ORDER BY 2')
    ClientDataSet = CdsGrpProd
    Left = 341
    Top = 266
  end
  object CdsGrpProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 341
    Top = 314
  end
end
