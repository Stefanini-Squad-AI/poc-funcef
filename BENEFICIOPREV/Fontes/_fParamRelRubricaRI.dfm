inherited frmParamRelRubricaRI: TfrmParamRelRubricaRI
  Top = 44
  Caption = 'Beneficiários por Rubricas'
  ClientHeight = 375
  ClientWidth = 474
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 474
    Height = 336
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 116
      Height = 13
      Caption = 'Rubrica / Descrição'
    end
    object chkListX: TCheckListBox
      Left = 12
      Top = 33
      Width = 450
      Height = 291
      ItemHeight = 13
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 474
    inherited tb97Fundo: TToolbar97
      Left = 304
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 137
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      SUBSTR(RXI.RUBRICAINSS || '#39' - '#39' ||PD.DESCRICAO,1,40) DESCR' +
        'ICAO,'
      '      RXI.RUBRICAINSS'
      'FROM RUBRICAXINSS RXI, PROVDESC PD'
      'WHERE RXI.IDRUBRICA = PD.IDPROVENTO'
      '  AND RXI.FLGRUBCENTRAL = 1'
      'ORDER BY RXI.RUBRICAINSS'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 40
  end
  object dsRubrica: TDataSource
    DataSet = qryRubrica
    Left = 336
    Top = 40
  end
end
