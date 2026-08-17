inherited FrmGeraProc2: TFrmGeraProc2
  Left = 78
  Top = 96
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
    object Label3: TLabel
      Left = 16
      Top = 200
      Width = 42
      Height = 13
      Caption = 'Pessoa'
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
      LookupTable = qryProc
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
      TabOrder = 7
    end
    object dblcGrpProd: TCMDBLookupCombo
      Left = 312
      Top = 120
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Descrição')
      LookupTable = qryGrpProd
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
      LookupTable = qryCentResp
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
      LookupTable = qryCentCust
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
      LookupTable = qryUnNegoc
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
    object cmPessoa: TCMProcura
      Left = 16
      Top = 216
      Width = 585
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MostraMensagens = True
      Mensagens.EmBranco = 'Pessoa não pode estar em branco'
      Mensagens.NaoExiste = 'Pessoa não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      LookupChave = 'IDPESSOA'
      LookupDescricao = 'RAZAOSOCIAL'
      MontaSelect = msPessoa
      LookupTabela = 'CM.PESSOA'
      DataBaseName = 'BaseDados'
      ReadOnly = False
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
      LookupTable = qryGrpProc
      LookupField = 'IDGRUPOPROCESSO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcGrpProcCloseUp
    end
  end
  inherited Dock971: TDock97
    Top = 355
    Width = 616
    inherited tb97Fundo: TToolbar97
      Left = 368
      DockPos = 368
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
      1
      (
        ''
        'Text'
        0))
  end
  object qryProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TP.IDTIPOPROCESSO,'
      '  TP.NOME,'
      '  OBSPROC,'
      '  FLGCENTCUST,'
      '  FLGCENTRESPON,'
      '  FLGGRUPPROD,'
      '  FLGUNIDNEGOC,'
      '  FLGVALOR'
      'FROM'
      '    RADTIPOPROCESSO TP'
      'WHERE'
      '       (TP.IDGRUPOPROCESSO = :IDGRUPOPROCESSO)'
      '   AND ( TP.IDGRPCRIAPROCESSO IN ( SELECT IDGRPRESPON'
      '             '#9'                  FROM RADRESPONXGRP'
      #9'                          WHERE (IDUSUARIO = :pIDUSUARIO) ) )'
      'ORDER BY TP.NOME'
      '')
    ValidateWithMask = True
    Left = 120
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryProcIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
      Origin = 'RADTIPOPROCESSO.IDTIPOPROCESSO'
    end
    object qryProcNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RADTIPOPROCESSO.NOME'
      Size = 60
    end
    object qryProcOBSPROC: TStringField
      FieldName = 'OBSPROC'
      Origin = 'RADTIPOPROCESSO.OBSPROC'
      Size = 200
    end
    object qryProcFLGCENTCUST: TStringField
      FieldName = 'FLGCENTCUST'
      Size = 1
    end
    object qryProcFLGCENTRESPON: TStringField
      FieldName = 'FLGCENTRESPON'
      Size = 1
    end
    object qryProcFLGGRUPPROD: TStringField
      FieldName = 'FLGGRUPPROD'
      Size = 1
    end
    object qryProcFLGUNIDNEGOC: TStringField
      FieldName = 'FLGUNIDNEGOC'
      Size = 1
    end
    object qryProcFLGVALOR: TStringField
      FieldName = 'FLGVALOR'
      Size = 1
    end
  end
  object qryUnNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            UNIDNEGOC,'
      '            NOME'
      'FROM'
      '           UNIDNEGOCIO'
      'WHERE'
      '           (IDPESSOA = :pIDPESSOA) AND'
      '           (UNETIPO = '#39'A'#39') '
      'ORDER BY 2  ')
    ValidateWithMask = True
    Left = 24
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryCentCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODCENTROCUSTO,'
      '      NOME'
      'FROM'
      '      CENTCUST'
      'WHERE'
      '        (IDEMPRESA = :pIDPESS)'
      '    AND (STATUSGRUPOCDC = '#39'A'#39')'
      '    AND (CODCENTROCUSTO IN (SELECT CODCENTROCUSTO  FROM USCCUSTO'
      '                            WHERE ( IDUSUARIO = :IDUSUARIO)'
      '                            AND (IDEMPRESA = :pIDPESS ) ) )'
      ''
      'ORDER BY 2  ')
    ValidateWithMask = True
    Left = 544
    Top = 265
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
      end>
  end
  object qryCentResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODCENTRORESPON,'
      '     NOME'
      'FROM'
      '      CENTRESPON'
      'WHERE'
      '        (IDPESSOA = :pIDPESS)'
      '    AND (ANALITICOSINTET = '#39'A'#39')'
      
        '    AND (CODCENTRORESPON IN (SELECT CODCENTRORESPON  FROM PESSOA' +
        'XCRESP'
      '                             WHERE (IDPESSOAACESSO = :IDUSUARIO)'
      
        '                              AND  (IDPESSOA       = :pIDPESS)) ' +
        ')'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 248
    Top = 273
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptInput
      end>
  end
  object qryGrpProd: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            CODGRUPOPROD,'
      '            DESCGRUPOPROD'
      'FROM'
      '            GRUPPROD'
      'WHERE'
      '           (STATUSGRUPO = '#39'A'#39')'
      'ORDER BY 2  ')
    ValidateWithMask = True
    Left = 328
    Top = 265
  end
  object msPessoa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Razão Social'
      'Nº  Documento')
    SensivelACaixa.Strings = (
      'N'
      'S')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 568
    Top = 120
  end
  object qryGrpProc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOPROCESSO,'
      '      DESCGRUPOPROCESSO'
      'FROM'
      '      RADGRUPOPROCESSO'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 421
    Top = 256
    object qryGrpProcDESCGRUPOPROCESSO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCGRUPOPROCESSO'
      Origin = '"CM.RADGRUPOPROCESSO".DESCGRUPOPROCESSO'
      Size = 60
    end
    object qryGrpProcIDGRUPOPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOPROCESSO'
      Origin = '"CM.RADGRUPOPROCESSO".IDGRUPOPROCESSO'
      Visible = False
    end
  end
end
