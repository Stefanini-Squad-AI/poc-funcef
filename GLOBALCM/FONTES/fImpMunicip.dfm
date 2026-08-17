inherited frmImpMunicip: TfrmImpMunicip
  Left = 287
  Top = 183
  Caption = 'Importa Subconta'
  ClientWidth = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 537
    inherited Panel1: TPanel
      Width = 535
      inherited rdgrpContas: TRadioGroup
        Left = 413
      end
    end
    inherited prgbrImportar: TProgressBar
      Width = 535
    end
    inherited mmTxt: TRichEdit
      Width = 524
    end
    inherited Panel2: TPanel
      inherited Panel4: TPanel
        object Label2: TLabel
          Left = 4
          Top = 29
          Width = 27
          Height = 13
          Caption = 'País'
        end
        object dblkPais: TwwDBLookupCombo
          Left = 4
          Top = 43
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPAIS'#9'30'#9'Nome')
          LookupTable = qryPais
          LookupField = 'IDPAIS'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 537
    inherited tb97Fundo: TToolbar97
      Left = 369
    end
  end
  inherited qryTXT: TwwQuery
    Top = 376
  end
  inherited qryArquivos: TwwQuery
    Left = 120
    Top = 376
  end
  inherited OpDlgTxt: TOpenArqText
    Left = 188
  end
  object qryPais: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from pais')
    ValidateWithMask = True
    Left = 149
    Top = 376
  end
end
