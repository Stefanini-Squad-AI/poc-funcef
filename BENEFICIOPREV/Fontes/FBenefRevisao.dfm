inherited frmBenefRevisao: TfrmBenefRevisao
  Left = 150
  Top = 150
  Caption = 'Selecione um dos beneficiários cadastrados ...'
  ClientHeight = 206
  ClientWidth = 493
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 493
    Height = 167
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 5
      Width = 483
      Height = 157
      Selected.Strings = (
        'FLGINSERIR'#9'5'#9'Inserir'
        'NOME'#9'50'#9'Beneficiário')
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsInserir
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 167
    Width = 493
    inherited tb97Fundo: TToolbar97
      Left = 262
      DockPos = 262
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 94
      DockPos = 94
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 156
  end
  object dsInserir: TwwDataSource
    DataSet = qryInserir
    Left = 53
    Top = 153
  end
  object qryInserir: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  1 AS FLGINSERIR, P.IDPESSOA, P.NOME'
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
    Params.Data = {
      01000400094944544954554C4152000304000000000000000B494442454E4546
      4943494F000304000000000000000E4E554D45524F50524F434553534F000304
      000000000000000B494442454E45464943494F00030400000000000000}
    UpdateObject = updInserir
    ControlType.Strings = (
      'FLGINSERIR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 102
    Top = 147
  end
  object updInserir: TUpdateSQL
    Left = 45
    Top = 177
  end
end
