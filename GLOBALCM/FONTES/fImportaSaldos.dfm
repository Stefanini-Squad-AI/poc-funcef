inherited frmImportaSaldos: TfrmImportaSaldos
  Caption = 'Importação de Saldos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited Panel2: TPanel
      inherited Panel4: TPanel
        object Label2: TLabel
          Left = 6
          Top = 30
          Width = 94
          Height = 13
          Caption = 'Plano de Contas'
        end
        object Label3: TLabel
          Left = 9
          Top = 6
          Width = 75
          Height = 13
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clActiveCaption
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 75
          Width = 55
          Height = 13
          Caption = 'Exercício'
        end
        object edPlano: TEdit
          Left = 6
          Top = 48
          Width = 121
          Height = 25
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          Text = 'EDPLANO'
        end
        object dblkExercicio: TwwDBLookupCombo
          Left = 6
          Top = 90
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PEREXERCICIO'#9'10'#9'Exercício')
          LookupTable = qryExercicio
          LookupField = 'PEREXERCICIO'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
      end
    end
  end
  inherited qryTXT: TwwQuery
    Top = 343
  end
  inherited qryArquivos: TwwQuery
    Left = 117
    Top = 352
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 168
    Top = 343
  end
  object qryExercicio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select distinct perexercicio from periodo')
    ValidateWithMask = True
    Left = 219
    Top = 352
  end
end
