inherited FrmAssociaEmissorMT: TFrmAssociaEmissorMT
  HelpContext = 790112
  Caption = 'Cadastro'
  ClientHeight = 369
  ClientWidth = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 422
    Height = 252
    inherited dbGrd: TwwDBGrid [0]
      Top = 105
      Width = 420
      Height = 146
      Selected.Strings = (
        'DESCPARAMEMISSOR'#9'60'#9'Indicador')
    end
    inherited pnlControles: TPanel [1]
      Top = 105
      Width = 420
      Height = 146
      object Label1: TLabel
        Left = 20
        Top = 50
        Width = 71
        Height = 13
        Caption = 'Indicadores '
      end
      object DbeIndicador: TwwDBEdit
        Left = 20
        Top = 64
        Width = 373
        Height = 21
        DataField = 'DESCPARAMEMISSOR'
        DataSource = ds
        Enabled = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited pnlDados: TPanel
      Width = 420
      Height = 104
      object Label5: TLabel
        Left = 20
        Top = 9
        Width = 48
        Height = 13
        Caption = 'Emissor '
      end
      object Label2: TLabel
        Left = 20
        Top = 50
        Width = 182
        Height = 13
        Caption = 'Indicadores a serem associados'
      end
      object DbLkcEmissor: TwwDBLookupCombo
        Left = 20
        Top = 24
        Width = 261
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Emissor'#9'F')
        LookupTable = CdsAux
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DbLkcEmissorCloseUp
        OnExit = DbLkcEmissorExit
      end
      object DBlkIndicador: TwwDBLookupCombo
        Left = 19
        Top = 66
        Width = 390
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPARAMEMISSOR'#9'60'#9'Indicador'#9'F')
        LookupTable = CdsIndicador
        LookupField = 'IDPARAMEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 422
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 330
    Width = 422
    inherited tb97Fundo: TToolbar97
      Left = 250
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 81
    end
  end
  inherited pnlTitulo: TPanel
    Width = 422
    inherited lbNomItem: TfcLabel
      Width = 367
      Caption = 'Associação Emissores / Indicadores'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 290
  end
  inherited ds: TwwDataSource
    Left = 350
    Top = 223
  end
  inherited ImlPadrao: TImageList
    Left = 328
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyDelete = CmeCadastroApplyInsert
    Left = 360
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Active = True
    Left = 332
    Top = 223
    Data = {
      8D0000009619E0BD0100000018000000030000000000030000008D000E494450
      4152414D454D4953534F520800040000000000094944454D4953534F52080004
      00000000001044455343504152414D454D4953534F5201004900000001000557
      49445448020002003C0002000D44454641554C545F4F52444552020082000100
      00000300044C4349440400010009080000}
  end
  inherited MontaSelect: TMontaSelect
    Left = 256
  end
  inherited CdsAux: TCMClientDataSet
    Left = 300
    Top = 95
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 216
    Top = 4
  end
  object DtsAux: TwwDataSource
    DataSet = CdsAux
    Left = 342
    Top = 95
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT IDEMISSOR, SIGLAEMISSOR'
      ''
      'FROM EMISSOR '
      ''
      'ORDER BY SIGLAEMISSOR')
    ClientDataSet = CdsAux
    Left = 321
    Top = 94
  end
  object CdsIndicador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 332
    Top = 143
  end
  object DtsIndicador: TwwDataSource
    DataSet = CdsIndicador
    Left = 350
    Top = 143
  end
  object SqlIndicador: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  PEM.IDPARAMEMISSOR,'
      '  PEM.DESCPARAMEMISSOR'
      'FROM   '
      '  PARAMEMISSOR PEM'
      'WHERE  '
      '  IDPARAMEMISSOR NOT IN ( SELECT IDPARAMEMISSOR'
      '                          FROM PARAMXEMISSOR   '
      '                          WHERE IDEMISSOR =   -1)'
      ' ')
    ClientDataSet = CdsIndicador
    Left = 369
    Top = 142
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      ' PXE.IDPARAMEMISSOR,'
      ' PXE.IDEMISSOR,'
      ' PRE.DESCPARAMEMISSOR'
      'FROM   '
      ' PARAMXEMISSOR PXE,PARAMEMISSOR PRE'
      'WHERE  '
      '  PXE.IDPARAMEMISSOR = PRE.IDPARAMEMISSOR'
      '  AND PXE.IDEMISSOR =      1562215'
      'ORDER BY PRE.DESCPARAMEMISSOR'
      ' ')
    ClientDataSet = Cds
    Left = 369
    Top = 222
  end
end
