inherited FrmParamAcompProc: TFrmParamAcompProc
  Left = 167
  Top = 306
  Caption = 'Acompanhamento dos Processos'
  ClientHeight = 172
  ClientWidth = 498
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 498
    Height = 133
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 100
      Height = 13
      Caption = 'Tipo de Processo'
    end
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 89
      Height = 13
      Caption = 'Nº do Processo'
    end
    object dblcProc: TCMDBLookupCombo
      Left = 24
      Top = 40
      Width = 449
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Descrição')
      LookupTable = DtmRelRAD.qryProc
      LookupField = 'IDTIPOPROCESSO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edNumProc: TEdit
      Left = 24
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = edNumProcKeyPress
    end
    object RgProc: TRadioGroup
      Left = 152
      Top = 69
      Width = 321
      Height = 41
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Só pendentes'
        'em atraso')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 133
    Width = 498
    inherited tb97Fundo: TToolbar97
      Left = 328
      DockPos = 328
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 160
      DockPos = 160
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
