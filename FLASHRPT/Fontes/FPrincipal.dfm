inherited frmPrincipal: TfrmPrincipal
  Left = 91
  Top = 152
  Caption = 'Gerador - Flash Report'
  PixelsPerInch = 96
  TextHeight = 13
  inherited stbarStatusBar: TfcStatusBar
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psHint
        Tag = 0
        Text = '11/04/2001 22:50'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    inherited mnuCadastro: TMenuItem
      object mnuConfFlash: TMenuItem
        Caption = 'Configuração &Flash Report'
        object mnuPOA: TMenuItem
          Caption = '&POA'
          OnClick = mnuPOAClick
        end
        object mnuDepRev: TMenuItem
          Caption = '&Department Revenue'
          OnClick = mnuDepRevClick
        end
      end
    end
  end
  object qrySelHotel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHOTEL,IDPESSOA FROM HOTEL WHERE IDPESSOA = :PESSOA')
    ValidateWithMask = True
    Left = 348
    Top = 102
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryParam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select DATASISTEMA,CONTABINTEGRADO from PARAMHOTEL where IDHOTEL' +
        ' = :IDHOTEL')
    ValidateWithMask = True
    Left = 424
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
  end
end
