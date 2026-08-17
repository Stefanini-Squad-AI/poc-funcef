inherited frmBenefRevisao: TfrmBenefRevisao
  Left = 248
  Top = 146
  Caption = 'Selecione um dos beneficiários cadastrados ...'
  ClientHeight = 173
  ClientWidth = 432
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 432
    Height = 134
    object rgrpBeneficiario: TRadioGroup
      Left = 1
      Top = 1
      Width = 430
      Height = 132
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 134
    Width = 432
    inherited tb97Fundo: TToolbar97
      Left = 260
      DockPos = 263
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
      DockPos = 94
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 123
  end
  object dsInserir: TwwDataSource
    DataSet = qryInserir
    Left = 74
    Top = 123
  end
  object qryInserir: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  P.IDPESSOA, P.NOME'
      'FROM    PESSOA P, BFCIARIOTITPLAN BT'
      'WHERE   BT.IDTITULAR   = :IDTITULAR'
      'AND     BT.IDBENEFICIO = :IDBENEFICIO'
      'AND     BT.IDPESSOA    = P.IDPESSOA'
      
        'AND     P.IDPESSOA NOT IN (SELECT BF.IDPESSOA FROM BENEFBFCIARIO' +
        ' BF'
      
        '                           WHERE  BF.NUMEROPROCESSO = :NUMEROPRO' +
        'CESSO'
      '                           AND    BF.IDBENEFICIO = :IDBENEFICIO)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 129
    Top = 123
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
end
