inherited frmParamOpeContAcoes: TfrmParamOpeContAcoes
  Left = 429
  Top = 209
  HelpContext = 790554
  Caption = 'frmParamOpeContAcoes'
  ClientHeight = 170
  ClientWidth = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 371
    Height = 131
    inherited bvlSepTit: TBevel
      Width = 369
    end
    object Label1: TLabel [1]
      Left = 19
      Top = 56
      Width = 49
      Height = 13
      Caption = 'Contrato'
    end
    inherited pnlTitulo: TPanel
      Width = 369
      inherited lbNomDescricao: TfcLabel
        Width = 336
        Caption = 'Operações de Contrato de Ações'
      end
    end
    object dblContrato: TCMDBLookupCombo
      Left = 19
      Top = 70
      Width = 334
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CONTRATO'#9'28'#9'CONTRATO'#9'F'
        'PLANPRVCONTABPATRO'#9'30'#9'Plano/Patrocinadora'#9'F')
      LookupTable = qryContratos
      LookupField = 'IDOPERCONTACOES'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object chkExpandido: TCheckBox
      Left = 19
      Top = 101
      Width = 97
      Height = 17
      Caption = 'Expandido'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 131
    Width = 371
    inherited tb97Fundo: TToolbar97
      Left = 199
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 30
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 123
  end
  object qryContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.IDOPERCONTACOES,'
      '              PP.PLANPRVCONTABPATRO,'
      
        '              (E.SIGLAEMISSOR || '#39' - '#39' || TO_CHAR(O.DATAOPERACAO' +
        ', '#39'DD/MM/YYYY'#39')) AS CONTRATO'
      'FROM OPERCONTACOES O, EMISSOR E, VWPLANPREVCTBPATR PP'
      'WHERE O.IDEMISSOR = E.IDEMISSOR'
      '  AND O.IDOPERCONTACOES = O.IDOPERCONTACOESAP'
      '  AND O.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      ''
      'ORDER BY  PP.PLANPRVCONTABPATRO,E.SIGLAEMISSOR, O.DATAOPERACAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 308
    Top = 62
    object qryContratosCONTRATO: TStringField
      DisplayWidth = 28
      FieldName = 'CONTRATO'
      Size = 28
    end
    object qryContratosPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano/Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryContratosIDOPERCONTACOES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCONTACOES'
      Visible = False
    end
  end
end
