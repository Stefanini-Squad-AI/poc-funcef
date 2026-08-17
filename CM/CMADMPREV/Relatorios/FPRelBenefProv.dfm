inherited frmPRelBenefProv: TfrmPRelBenefProv
  Left = 314
  Top = 168
  Caption = 'Benefícios Provisórios'
  ClientWidth = 422
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 422
    TabOrder = 1
    object grpParamBenef: TGroupBox
      Left = 55
      Top = 33
      Width = 306
      Height = 168
      Caption = ' Prazo '
      TabOrder = 0
      object Label1: TLabel
        Left = 31
        Top = 50
        Width = 123
        Height = 13
        Caption = 'Quantidade de meses'
      end
      object ckbIncluiMes: TCheckBox
        Left = 33
        Top = 100
        Width = 256
        Height = 17
        Caption = 'Incluir Meses Anteriores ao Mês Final'
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Width = 422
    inherited tb97Fundo: TToolbar97
      Left = 221
      DockPos = 221
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 53
      DockPos = 53
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object mebMeses: TMaskEdit [2]
    Left = 234
    Top = 79
    Width = 23
    Height = 21
    EditMask = '!99;0;'
    MaxLength = 2
    TabOrder = 0
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
¿
