inherited frmImpPlanoCntas: TfrmImpPlanoCntas
  Left = 169
  Top = 121
  Caption = 'Importa Plano de Contas'
  ClientHeight = 422
  ClientWidth = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 530
    Height = 383
    inherited Panel1: TPanel
      Width = 520
      inherited rdgrpContas: TRadioGroup
        Left = 398
      end
    end
    inherited prgbrImportar: TProgressBar
      Top = 362
      Width = 520
    end
    inherited Panel2: TPanel
      inherited Panel3: TPanel
        inherited lvCampos: TListView
          HideSelection = False
        end
      end
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 530
    inherited tb97Fundo: TToolbar97
      Left = 364
      DockPos = 364
    end
  end
  inherited OpDlgTxt: TOpenArqText
    Left = 213
    Top = 383
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 147
    Top = 382
  end
end
