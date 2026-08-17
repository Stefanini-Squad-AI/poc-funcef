inherited frmCadCarteiraSPC: TfrmCadCarteiraSPC
  Left = 362
  Top = 205
  HelpContext = 545014
  Caption = 'Cadastro da Carteira SPC'
  ClientHeight = 284
  ClientWidth = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 435
    Height = 198
    inherited dbGrd: TwwDBGrid [0]
      Width = 433
      Height = 196
      Selected.Strings = (
        'DESCARTEIRASPC'#9'45'#9'Carteira'
        'DESCRICAO'#9'15'#9'Segmento')
    end
    inherited pnlControles: TPanel [1]
      Width = 433
      Height = 196
      object Label1: TLabel
        Left = 32
        Top = 34
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 32
        Top = 98
        Width = 57
        Height = 13
        Caption = 'Segmento'
      end
      object Label3: TLabel
        Left = 320
        Top = 34
        Width = 68
        Height = 13
        Caption = 'Código SPC'
      end
      object DBEdDescricao: TwwDBEdit
        Left = 32
        Top = 48
        Width = 273
        Height = 21
        DataField = 'DESCARTEIRASPC'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 32
        Top = 112
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'15'#9'Segmento'#9'F')
        DataField = 'CODSEGMENTO'
        DataSource = ds
        LookupTable = cdsSegmento
        LookupField = 'CODSEGMENTO'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object wwDBEdit1: TwwDBEdit
        Left = 320
        Top = 48
        Width = 73
        Height = 21
        DataField = 'CODTIPOCART'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 435
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 245
    Width = 435
    inherited tb97Fundo: TToolbar97
      Left = 263
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 94
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 890
    Top = 55
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 840
    Top = 55
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 320
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'Dsp'
    Left = 280
    Top = 0
    object CdsIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
    end
    object CdsDESCARTEIRASPC: TStringField
      FieldName = 'DESCARTEIRASPC'
      Size = 60
    end
    object CdsCODTIPOCART: TStringField
      FieldName = 'CODTIPOCART'
      Size = 5
    end
    object CdsCODSEGMENTO: TFloatField
      FieldName = 'CODSEGMENTO'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 15
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 368
    Top = 0
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT CODSEGMENTO, DESCRICAO FROM SEGMENTOSPC')
    ClientDataSet = cdsSegmento
    Left = 328
    Top = 192
  end
  object cdsSegmento: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 192
    Data = {
      9E0000009619E0BD01000000180000000200040000000300000059000B434F44
      5345474D454E544F08000400000000000944455343524943414F010049000000
      0100055749445448020002000F000100044C4349440400010009080000000000
      0000000000F03F02524600000000000000000040025256000000000000000008
      400B496D6F62696C69E172696F000000000000000010400A456D7072E9737469
      6D6F}
  end
end
