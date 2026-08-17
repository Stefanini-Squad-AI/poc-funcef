inherited frmLerCodProvento: TfrmLerCodProvento
  Left = 128
  Top = 144
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Associar Rubrica à Patrocianadora'
  ClientHeight = 275
  ClientWidth = 506
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 506
    Height = 236
    object gbRubrica: TGroupBox
      Left = 5
      Top = 48
      Width = 496
      Height = 68
      Align = alTop
      Caption = 'Rubrica'
      TabOrder = 0
      object LabelCodigo: TLabel
        Left = 8
        Top = 18
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object LabelCodRub: TLabel
        Left = 8
        Top = 35
        Width = 46
        Height = 13
        AutoSize = False
        Caption = 'Código da Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 65
        Top = 19
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object labelDescricao: TLabel
        Left = 66
        Top = 35
        Width = 423
        Height = 13
        AutoSize = False
        Caption = 'Descrição da Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlPatrocinadora: TPanel
      Left = 5
      Top = 5
      Width = 496
      Height = 43
      Align = alTop
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object gbPatrocinadora: TGroupBox
        Left = 1
        Top = 1
        Width = 494
        Height = 41
        Align = alClient
        Caption = 'Patrocinadora'
        TabOrder = 0
        object lbPatrocinadora: TLabel
          Left = 9
          Top = 18
          Width = 472
          Height = 16
          AutoSize = False
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object gbAssoc: TGroupBox
      Left = 5
      Top = 116
      Width = 496
      Height = 105
      Align = alTop
      Caption = 'Associação'
      TabOrder = 2
      object LabelAssocDesc: TLabel
        Left = 8
        Top = 60
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object LabelAssocCod: TLabel
        Left = 8
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object edDescProvento: TEdit
        Left = 8
        Top = 76
        Width = 481
        Height = 21
        TabOrder = 0
      end
      object EdCodProvento: TEdit
        Left = 8
        Top = 36
        Width = 64
        Height = 21
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 506
    inherited tb97Fundo: TToolbar97
      Left = 251
      DockPos = 251
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
      DockPos = 83
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 387
    Top = 54
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 458
    Top = 53
  end
end
